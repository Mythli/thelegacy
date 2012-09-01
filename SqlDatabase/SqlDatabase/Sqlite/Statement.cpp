#include "Statement.h"

using namespace Sql::Sqlite::Detail;

Statement::Statement(tSqlitePtr SqlitePtr)
	: Sql::Detail::Statement(),
	  sqlitePtr(SqlitePtr)
{

}

Statement::~Statement()
{
}
void Statement::Prepare(const std::string& StatementStr)
{
	sqlite3_stmt* stmtPtr = NULL;
	if (sqlite3_prepare_v2(this->sqlitePtr.get(), StatementStr.c_str(), -1,  &stmtPtr, NULL) != SQLITE_OK)
		BOOST_THROW_EXCEPTION(DatabaseException(this->sqlitePtr, "Failed to prepare statement!"));

	this->stmtPtr = tSqliteStmtPtr(stmtPtr, &sqlite3_finalize);
}


Result* Statement::Execute(Sql::QueryFlag Flag)
{
	return new Result(this->sqlitePtr, this->stmtPtr, Flag);
}

void Statement::Reset()
{
	if (sqlite3_reset(this->stmtPtr.get()) != SQLITE_OK)
		BOOST_THROW_EXCEPTION(DatabaseException(this->sqlitePtr, "Failed to reset statement!"));
}

void Statement::ResetParameters()
{
	if (sqlite3_clear_bindings(this->stmtPtr.get()) != SQLITE_OK)
		BOOST_THROW_EXCEPTION(DatabaseException(this->sqlitePtr, "Failed to reset prepared statement parameters!"));
}

