#ifndef SQLDATABASE_SQLITE_RESULT_H
#define SQLDATABASE_SQLITE_RESULT_H

#include <vector>

#include "../Result.h"
#include "DatabaseException.h"
#include "ResultRow.h"

namespace Sql { namespace Sqlite {
	class Database;

	namespace Detail {
		class Result :
			  public Sql::Detail::Result
		{
			friend class Database;
		public:
			Result(Detail::tSqlitePtr SqlitePtr, Detail::tSqliteStmtPtr StmtPtr, Sql::QueryFlag Flag);
			~Result();

			bool HasResult();
			bool NextRow();
			ResultRow& Row();
			uint64_t RowCount();
			uint64_t AffectedCount();
			uint64_t LastInsertId();
		private:
			Result() { }
			typedef std::vector<ResultRow> tResultBuffer;

			// Native handles (encapsulated in boost::shared_ptr)
			tSqlitePtr sqlitePtr;
			tSqliteStmtPtr stmtPtr;

			bool isRowLoaded;
			uint32_t fieldCount;
			uint64_t rowCount;
			uint64_t currentRowIndexBuffered;
			ResultRow currentRow;
			// If a full step through the result occured this is set to true
			bool isResultBuffered;
			tResultBuffer resultBuffer;

			void initResult();
			void bufferResult();
		};
	}
	typedef boost::shared_ptr<Detail::Result> Result;
} }
#endif