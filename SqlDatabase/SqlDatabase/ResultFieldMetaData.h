#ifndef SQLDATABASE_SQLRESULTFIELDMETADATA_H
#define SQLDATABASE_SQLRESULTFIELDMETADATA_H

#include "Defines.h"
namespace Sql {
	class ResultFieldMetaData
	{
	public:
		virtual ~ResultFieldMetaData() { }

		virtual const std::string& TableName() = 0;
		virtual const std::string& FieldName() = 0;
		virtual FieldType FieldType() = 0;
	};
}
#endif