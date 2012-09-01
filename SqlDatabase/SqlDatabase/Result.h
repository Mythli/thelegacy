#ifndef SQLDATABASE_SQLRESULT_H
#define	SQLDATABASE_SQLRESULT_H

#include <boost/scoped_ptr.hpp>
#include "Defines.h"
#include "ResultRow.h"

namespace Sql {
	namespace Detail {
		class Result
		{
		public:
			Result() { }
			Result(QueryFlag Flag) :
				flag(Flag)
			{ }

			virtual ~Result() { }
	
			virtual bool HasResult() = 0;
			virtual bool NextRow() = 0;
			virtual ResultRow& Row() = 0;
			virtual uint64_t RowCount() = 0;
			virtual uint64_t AffectedCount() = 0;
			virtual uint64_t LastInsertId() = 0;
		protected:
			QueryFlag flag;
		private:
		};
	}
	typedef boost::shared_ptr<Detail::Result> Result;
}
#endif