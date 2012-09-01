#ifndef SQLDATABASE_SQLRESULTFIELD_H
#define	SQLDATABASE_SQLRESULTFIELD_H

#include <boost/lexical_cast.hpp>
#include "ResultFieldMetaData.h"

namespace Sql {
	class ResultField
	{
	public:
		ResultField() :
			value(NULL) { }
		virtual ~ResultField() { }
	
		virtual bool IsDbNull() = 0;
		virtual uint64_t Length() = 0;
		virtual Sql::ResultFieldMetaData& MetaData() const = 0;
		template <typename T>
		T Value()
		{

		}

		operator std::string() { return this->Value<std::string>(); }

	protected:
		void* value;
	private:
	};
}
#endif