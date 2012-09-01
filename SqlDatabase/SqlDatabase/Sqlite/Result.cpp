#include "Result.h"

using namespace Sql::Sqlite;

Detail::Result::Result(Detail::tSqlitePtr SqlitePtr, Detail::tSqliteStmtPtr StmtPtr, Sql::QueryFlag Flag)
	: Sql::Detail::Result(Flag),
	  sqlitePtr(SqlitePtr),
	  stmtPtr(StmtPtr),
	  isRowLoaded(false),
	  fieldCount(0),
	  rowCount(0),
	  currentRowIndexBuffered(0),
	  currentRow(NULL),
	  isResultBuffered(false)
{
	this->initResult();
}

Detail::Result::~Result()
{
	// Free Result buffer
	if (this->flag == Sql::QUERYFLAG_BUFFERRES)
	{
		for (uint32_t i = 0; i < this->resultBuffer.size(); i++)
		{
			for (uint32_t j = 0; j < this->currentRow.FieldCount(); j++)
			{
				if (this->resultBuffer[i].rowData[j].value != NULL)
					delete[] this->resultBuffer[i].rowData[j].value;
			}
		}
	}
}

void Detail::Result::bufferResult()
{
	// We loop through all rows
	while(this->NextRow()) { }
	this->rowCount = this->resultBuffer.size();
}

void Detail::Result::initResult()
{
	this->fieldCount = sqlite3_column_count(this->stmtPtr.get());
	if (!this->HasResult())
		return;
	
	this->currentRow.rowData.reserve(this->fieldCount);
	this->currentRow.metaMap = new Detail::tSqliteFielNameMap();

	for(uint32_t i = 0; i < this->fieldCount; i++)
	{
		ResultField field;
		field.metaData = new ResultFieldMetaData(
			std::string(sqlite3_column_table_name(this->stmtPtr.get(), i)),
			std::string(sqlite3_column_name(this->stmtPtr.get(), i)),
			ResultFieldMetaData::NormalizeFieldType(sqlite3_column_type(this->stmtPtr.get(), i))
		);
		this->currentRow.rowData.push_back(field);
		this->currentRow.metaMap->insert(std::make_pair(field.MetaData().FieldName(), i));
	}

	// Buffer result if flag is set
	if (this->flag == Sql::QUERYFLAG_BUFFERRES)
		this->bufferResult();
}

bool Detail::Result::HasResult()
{
	return this->fieldCount > 0;
}

bool Detail::Result::NextRow()
{
	if (!this->HasResult())
		BOOST_THROW_EXCEPTION(std::logic_error("Executed query has no result!"));

	if (!this->isResultBuffered)
	{
		// Get Row
		uint8_t stepResult = sqlite3_step(this->stmtPtr.get());
		
		switch(stepResult)
		{	
			case SQLITE_ROW:
				for (uint32_t i = 0; i < this->fieldCount; i++)
				{
					this->currentRow[i].metaData->fieldType = ResultFieldMetaData::NormalizeFieldType(sqlite3_column_type(this->stmtPtr.get(), i));
					this->currentRow[i].isDbNull = this->currentRow[i].metaData->FieldType() == Sql::FIELDTYPE_DBNULL;
					if(this->flag == Sql::QUERYFLAG_BUFFERRES)
					{
						// We need to create a copy of the value because memory will be freed due next step
						if (!this->currentRow[i].IsDbNull())
						{
							this->currentRow[i].length = sqlite3_column_bytes(this->stmtPtr.get(), i);
							// Add 1 for zero terminator
							this->currentRow[i].value = (void*)new char[this->currentRow[i].length + 1];
							strcpy(((char*)this->currentRow[i].value), (char*)sqlite3_column_text(this->stmtPtr.get(), i));
						} else
							this->currentRow[i].value = NULL;
					} else
					{
						this->currentRow[i].value = (void*)sqlite3_column_text(this->stmtPtr.get(), i);
					}
				}

				// Copy current row in result buffer if result should be buffered
				if(this->flag == Sql::QUERYFLAG_BUFFERRES)
					this->resultBuffer.push_back(this->currentRow);

				this->rowCount++;
				break;
			case SQLITE_DONE:
				this->isResultBuffered = true;
				return false;
			default:
				BOOST_THROW_EXCEPTION(DatabaseException(this->sqlitePtr, "Failed to step through result!"));
				break;
		}
		return true;
	} else if(this->flag == Sql::QUERYFLAG_BUFFERRES && this->isResultBuffered)
	{
		if (this->currentRowIndexBuffered >= this->resultBuffer.size())
			return false;

		this->currentRow = this->resultBuffer[this->currentRowIndexBuffered];
		this->currentRowIndexBuffered++;

		return true;
	}
	return false;
}

ResultRow& Detail::Result::Row()
{
	if (this->flag == Sql::QUERYFLAG_BUFFERRES)
	{
		if (this->currentRowIndexBuffered == 1)
		{
			return this->currentRow;
			if (!this->NextRow())
				BOOST_THROW_EXCEPTION(std::logic_error("No rows in result!"));
		}
	} else
	{
		if (this->rowCount == 1)
		{
			return this->currentRow;
			if (!this->NextRow())
				BOOST_THROW_EXCEPTION(std::logic_error("No rows in result!"));
		}
	}
	return this->currentRow;
}

uint64_t Detail::Result::RowCount()
{
	if (this->HasResult())
	{
		if (!this->isResultBuffered)
			BOOST_THROW_EXCEPTION(std::logic_error("Failed to return row count due result is not buffered up to now!"));
		return this->rowCount;
	} else
		BOOST_THROW_EXCEPTION(std::logic_error("Failed to count rows as there is no result available"));
}

uint64_t Detail::Result::AffectedCount()
{
	return sqlite3_changes(this->sqlitePtr.get());
}

uint64_t Detail::Result::LastInsertId()
{
	return sqlite3_last_insert_rowid(this->sqlitePtr.get());
}
