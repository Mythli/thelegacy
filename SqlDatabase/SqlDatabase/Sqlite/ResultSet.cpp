#include "ResultSet.h"

using namespace Sql::Sqlite::Detail;

ResultSet::ResultSet(tSqlitePtr SqlitePtr, const std::string& Query, Sql::QueryFlag Flag)
	: Sql::Detail::ResultSet(Flag),
	  sqlitePtr(SqlitePtr)
{
	// This regex brings performance boost as it's located in the boost namespace
	boost::algorithm::split_regex(this->querys, Query, boost::regex("('(?:\\.|''|[^'])*(')?)|(;)"));
	this->currentStatement.reset(new Statement(this->sqlitePtr));
}

ResultSet::~ResultSet()
{
}

bool ResultSet::NextResult(Sql::QueryFlag Flag)
{
	if (Flag == Sql::QUERYFLAG_NONE)
		Flag = this->flag;

	if (!this->HasMoreResults())
		return false;

	this->currentStatement->Reset();
	this->currentStatement->Prepare(this->querys[this->currentQueryNr]);
	this->currentResult.reset(this->currentStatement->Execute(Flag));
	
	this->currentQueryNr++;
	return true;
}