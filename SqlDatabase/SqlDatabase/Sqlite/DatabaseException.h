#include "../DatabaseException.h"
#include "Defines.h"

#ifndef SQLDATABASE_SQLITE_XCEPTION_H
#define SQLDATABASE_SQLITE_XCEPTION_H
namespace Sql { namespace Sqlite {
	struct DatabaseException :
		public Sql::DatabaseException
	{
		DatabaseException(Detail::tSqlitePtr SqlitePtr, const std::string& Message = "")
			: Sql::DatabaseException(Message)
		{
			this->sqlErrorCode = sqlite3_errcode(SqlitePtr.get());
			this->sqlErrorMessage = sqlite3_errmsg(SqlitePtr.get());
		}
		~DatabaseException()
		{
		}
	};
} }
#endif