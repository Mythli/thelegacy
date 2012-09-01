#ifndef SQLDATABASE_DBACCESSLAYER_H
#define SQLDATABASE_DBACCESSLAYER_H

#include <boost/scoped_ptr.hpp>
#include <boost/signals2.hpp>
#include "ResultField.h"
#include "Result.h"
#include "ResultSet.h"
#include "Statement.h"

namespace Sql {
	class DbAccessLayer
	{
	public:
		DbAccessLayer() { }
		virtual ~DbAccessLayer() { }

		// Connect to these signal for query logging
		boost::signals2::signal<void (bool, const std::string&)> OnQueryExecuted;

		virtual DatabaseType Type() = 0;
		virtual const std::string& Name() = 0;
		virtual std::string EscapeString(const std::string& Str)
		{
			return Str;
		}
		virtual bool Ping() = 0;

		virtual void TransactionBegin() = 0;
		virtual void TransactionCommit() = 0;
		virtual void TransactionRollback() = 0;

		virtual Detail::Result* Query(const std::string& Query, QueryFlag Flag = QUERYFLAG_NONE) = 0;
		virtual Detail::ResultSet* QueryMulti(const std::string& Query, QueryFlag Flag = QUERYFLAG_NONE) = 0;

		virtual uint64_t RowCount(const std::string& Query)
		{
			boost::scoped_ptr<Detail::Result> res(this->Query(Query));
			return res->RowCount();
		}
		virtual uint64_t AffectedCount(const std::string& Query)
		{
			boost::scoped_ptr<Detail::Result> res(this->Query(Query));
			return res->AffectedCount();
		}


		virtual Detail::Statement* CreateStatement() = 0;
		virtual Detail::Statement* CreateStatement(const std::string& Statement) = 0;

	};
} 

#endif