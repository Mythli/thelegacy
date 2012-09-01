#ifndef SQLDATABASE_SQLITE_DATABASE_H
#define	SQLDATABASE_SQLITE_DATABASE_H

#include <boost/bind.hpp>
#include <boost/scoped_ptr.hpp>

#include "../Database.h"
#include "Defines.h"
#include "ResultSet.h"
#include "Statement.h"

namespace Sql { namespace Sqlite {
	class Database
		: public Sql::Database
	{

	public:
		Database();
		Database(const std::string& ConnectionString, int OpenFlag = DBOPENFLAG_READWRITE) { this->Open(ConnectionString, OpenFlag); }
		~Database();

		Sql::DatabaseType Type() { return Database::dbType; }
		const std::string& Name() { return Database::dbName; }

		void Open(const std::string& ConnectionString) { this->Open(ConnectionString, DBOPENFLAG_READWRITE); }
		void Open(const std::string& ConnectionString, int OpenFlag);

		void Close();
		bool Ping() { return true; }
		void ChangeDatabase(const std::string& NewDatabase)
		{
			this->Close();
			this->Open(NewDatabase);
		}

		void TransactionBegin();
		void TransactionCommit();
		void TransactionRollback();

		Detail::Result* Query(const std::string& Query, Sql::QueryFlag Flag = Sql::QUERYFLAG_NONE);
		Detail::ResultSet* QueryMulti(const std::string& Query, Sql::QueryFlag Flag = Sql::QUERYFLAG_NONE);

		Detail::Statement* CreateStatement();
		Detail::Statement* CreateStatement(const std::string& StatementStr)
		{
			Detail::Statement* statement = this->CreateStatement();
			statement->Prepare(StatementStr);
			return statement;
		}
	private:
		static const Sql::DatabaseType dbType = Sql::DATABASETYPE_SQLITE;
		static const std::string dbName;
		Detail::tSqlitePtr sqlitePtr;
	};
} }
#endif