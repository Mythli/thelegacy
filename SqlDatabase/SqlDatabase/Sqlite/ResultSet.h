#ifndef SQLDATABASE_SQLITE_RESULTSET_H
#define SQLDATABASE_SQLITE_RESULTSET_H

#include <vector>
#include <boost/algorithm/string/regex.hpp>
#include <boost/regex.hpp>
#include "../ResultSet.h"
#include "Statement.h"

namespace Sql { namespace Sqlite {
	namespace Detail {
		class ResultSet
			: public Sql::Detail::ResultSet
		{
		public:
			ResultSet(tSqlitePtr SqlitePtr, const std::string& Query, Sql::QueryFlag Flag);
			~ResultSet();

			// SqlResultSet
			bool IsMultiResult() { return this->querys.size() > 1; }
			bool HasMoreResults() { return this->querys.size() > this->currentQueryNr; }
			bool NextResult(QueryFlag Flag = Sql::QUERYFLAG_NONE);
			Detail::Result& Result()
			{
				if (this->currentResult == NULL)
				{
					if (!this->NextResult())
						BOOST_THROW_EXCEPTION(std::runtime_error("Failed to get Result!"));
				}
				return (Detail::Result&)*this->currentResult.get();
			}

		private:
			typedef std::vector<std::string> tQueryVector;

			tSqlitePtr sqlitePtr;
			tQueryVector querys;
			uint32_t currentQueryNr;

			boost::scoped_ptr<Statement> currentStatement;
			Sql::Result currentResult;
		};
	}

	typedef boost::shared_ptr<Detail::ResultSet> ResultSet;
} }
#endif