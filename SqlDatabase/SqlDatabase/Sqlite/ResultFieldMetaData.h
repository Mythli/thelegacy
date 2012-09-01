#ifndef SQLDATABASE_SQLITE_RESULTFIELDMETADATA_H
#define	SQLDATABASE_SQLITE_RESULTFIELDMETADATA_H

#include <boost/unordered_map.hpp>
#include "../ResultFieldMetaData.h"
#include "Defines.h"

namespace Sql { namespace Sqlite {
	class ResultField;
	namespace Detail {
		class Result;
	}

	class ResultFieldMetaData :
		public Sql::ResultFieldMetaData
	{
		friend class ResultField;
		friend class Detail::Result;

	public:
		static Sql::FieldType NormalizeFieldType(int SqliteFieldType)
		{
			switch(SqliteFieldType)
			{
				case SQLITE_INTEGER: return Sql::FIELDTYPE_INTEGER;
				case SQLITE_FLOAT: return Sql::FIELDTYPE_FLOAT;
				case SQLITE_TEXT: return Sql::FIELDTYPE_STRING;
				case SQLITE_NULL: return Sql::FIELDTYPE_DBNULL;
				case SQLITE_BLOB: return Sql::FIELDTYPE_BLOB;
				default: return Sql::FIELDTYPE_UNKNOWN;
			}
		}

		ResultFieldMetaData() { }
		ResultFieldMetaData(const std::string& TableName, const std::string& FieldName, Sql::FieldType FieldType) :
			tableName(TableName),
			fieldName(FieldName),
			fieldType(FieldType)
		{ }

		const std::string& TableName()
		{
			return this->tableName;
		}
		const std::string& FieldName()
		{
			return this->fieldName;
		}
		Sql::FieldType FieldType()
		{
			return this->fieldType;
		}
	private:
		std::string tableName;
		std::string fieldName;
		Sql::FieldType fieldType;
	};
} }
#endif