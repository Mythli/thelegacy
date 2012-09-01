#ifndef SQLDATABASE_SQLITE_DEFINES_H
#define	SQLDATABASE_SQLITE_DEFINES_H

#include <boost/shared_ptr.hpp>
#include <sqlite/sqlite3.h>

namespace Sql { namespace Sqlite {
	enum DbOpenFlag
	{
		DBOPENFLAG_NOMUTEX = SQLITE_OPEN_NOMUTEX,
		DBOPENFLAG_FULLMUTEX = SQLITE_OPEN_FULLMUTEX,
		DBOPENFLAG_SHAREDCACHE = SQLITE_OPEN_SHAREDCACHE,
		DBOPENFLAG_READONLY = SQLITE_OPEN_READONLY,
		DBOPENFLAG_READWRITE = SQLITE_OPEN_READWRITE,
		DBOPENFLAG_CREATE = SQLITE_OPEN_CREATE,
	};

	namespace Detail {
		typedef boost::shared_ptr<sqlite3> tSqlitePtr;
		typedef boost::shared_ptr<sqlite3_stmt> tSqliteStmtPtr;
	}
} }
#endif