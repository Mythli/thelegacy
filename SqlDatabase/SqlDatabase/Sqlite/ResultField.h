#ifndef SQLDATABASE_SQLITERE_SULTFIELD_H
#define	SQLDATABASE_SQLITERE_SULTFIELD_H

#include <boost/scoped_ptr.hpp>

#include "../ResultField.h"
#include "ResultFieldMetaData.h"

namespace Sql { namespace Sqlite {
	namespace Detail {
		class Result;
	}

	class ResultField :
		public Sql::ResultField
	{

	friend class Detail::Result;

	public:
		ResultField() :
			isDbNull(0),
			length(0)
		{ }
		~ResultField() { }

		bool IsDbNull()
		{
			return this->isDbNull;
		}
		uint64_t Length()
		{
			return this->length;
		}
		ResultFieldMetaData& MetaData() const
		{
			return *this->metaData;
		}
	private:
		bool isDbNull;
		uint64_t length;
		ResultFieldMetaData* metaData;
	};
} }
#endif