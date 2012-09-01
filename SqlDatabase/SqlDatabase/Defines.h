#ifndef SQLDATABASE_DATABASETYPE_H
#define SQLDATABASE_DATABASETYPE_H

#include <vector>
#include <stdint.h>

namespace Sql {
	enum DatabaseType
	{
		DATABASETYPE_UNKOWN,
		DATABASETYPE_MYSQL,
		DATABASETYPE_SQLITE
	};
	enum QueryFlag
	{
		QUERYFLAG_NONE,
		QUERYFLAG_BUFFERRES,
		QUERYFLAG_SCALAR,
	};

	enum FieldType
	{
		FIELDTYPE_STRING	= 0,
		FIELDTYPE_INTEGER	= 1,
		FIELDTYPE_FLOAT		= 2,
		FIELDTYPE_DBNULL	= 4,
		FIELDTYPE_BLOB		= 5,
		FIELDTYPE_UNKNOWN	= 6
	};


}
#endif