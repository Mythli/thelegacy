#ifndef SQLDATABASE_QUERYRESULTSET_H
#define SQLDATABASE_QUERYRESULTSET_H

#include "Result.h"
namespace Sql {
	namespace Detail {
		class ResultSet
		{
		public:
			typedef boost::shared_ptr<ResultSet> Ptr;

			ResultSet() { }
			ResultSet(QueryFlag Flag) :
				flag(Flag)
			{ }

			virtual ~ResultSet() { }

			virtual bool IsMultiResult() = 0;
			virtual bool HasMoreResults() = 0;
			virtual bool NextResult(QueryFlag Flag = QUERYFLAG_NONE) = 0;
	
			virtual Result& Result() = 0;
		protected:
			QueryFlag flag;
		private:
		};
	}

	typedef boost::shared_ptr<Detail::ResultSet> ResultSet;
}
#endif