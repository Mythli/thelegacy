#include "Database.h"

using namespace Sql::Sqlite;

const std::string Database::dbName = "Sqlite";

Database::Database()
	: Sql::Database()
{
	if (sqlite3_threadsafe() == 0)
		BOOST_THROW_EXCEPTION(std::runtime_error("Used MySQL library isn't thread-safe."));
}

Database::~Database()
{
}

void Database::Close()
{
	this->sqlitePtr.reset();
}

void Database::Open(const std::string& ConnectionString, int OpenFlag)
{
	sqlite3* sqlitePtr = NULL;
	if (!sqlite3_open_v2(ConnectionString.c_str(), &sqlitePtr, OpenFlag, NULL) == SQLITE_OK)
	{
		this->Close();
		BOOST_THROW_EXCEPTION(DatabaseException(this->sqlitePtr, "Failed to open database file!"));
	}

	this->sqlitePtr = Detail::tSqlitePtr(sqlitePtr, &sqlite3_close);
}

void Database::TransactionBegin()
{
	this->Query("BEGIN");
}

void Database::TransactionCommit()
{
	this->Query("COMMIT");
}

void Database::TransactionRollback()
{
	this->Query("ROLLBACK");
}


Detail::Result* Database::Query(const std::string& Query, Sql::QueryFlag Flag)
{
	//Sql::Statement stmt = this->CreateStatement(Query);
	//return stmt->Execute(Flag);
	return new Detail::Result();
}

Detail::ResultSet* Database::QueryMulti(const std::string& Query, Sql::QueryFlag Flag)
{
	return new Detail::ResultSet(this->sqlitePtr, Query, Flag);
}

Detail::Statement* Database::CreateStatement()
{
	return new Detail::Statement(this->sqlitePtr);
}
