#ifndef SQLDATABASE_SQLITE_RESULTROW_H
#define SQLDATABASE_SQLITE_RESULTROW_H

#include <vector>
#include "../ResultRow.h"
#include "ResultField.h"
namespace Sql { namespace Sqlite {
	
	namespace Detail
	{
		class Result;

		typedef std::vector<ResultField> tSqliteRowData;
		typedef boost::unordered_map<std::string, uint32_t> tSqliteFielNameMap;
	}

	class ResultRow :
		public Sql::ResultRow
	{

	friend class Detail::Result;

	public:
		ResultRow() :
			metaMap(NULL)
		{ }
		ResultRow(Detail::tSqliteFielNameMap* MetaMap) :
			metaMap(MetaMap)
		{ }

		// By index accessor
		ResultField& operator[] (uint32_t Index)
		{
			return this->rowData[Index];
		}
		// By fieldName accessor
		ResultField& operator[] (const std::string& FieldName)
		{
			uint32_t index = (*this->metaMap)[FieldName];
			return (*this)[index];
		}

		uint32_t FieldCount()
		{
			return this->rowData.size();
		}
	private:
		Detail::tSqliteFielNameMap* metaMap;
		Detail::tSqliteRowData rowData;
	};
} }
#endif