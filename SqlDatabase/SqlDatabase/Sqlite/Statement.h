#ifndef SQLITE_STATEMENT
#define	SQLITE_STATEMENT

#include <boost/numeric/conversion/cast.hpp>
#include "../Statement.h"
#include "../Defines.h"
#include "DatabaseException.h"
#include "Result.h"

namespace Sql { namespace Sqlite {
	namespace Detail {
		class Statement
			: public Sql::Detail::Statement
		{

		public:
			Statement(tSqlitePtr SqlitePtr);
			~Statement();
			void Prepare(const std::string& StatementStr);


			void SetParameter(uint32_t Index, int Value)
			{
				if (sqlite3_bind_int(this->stmtPtr.get(), Index + 1, Value) != SQLITE_OK)
					BOOST_THROW_EXCEPTION(DatabaseException(this->sqlitePtr, "Failed to bind int value to statement!"));
			}
			void SetParameter(uint32_t Index, int64_t Value)
			{
				if (sqlite3_bind_int64(this->stmtPtr.get(), Index + 1, Value) != SQLITE_OK)
					BOOST_THROW_EXCEPTION(DatabaseException(this->sqlitePtr, "Failed to int64_t bool value to statement!"));
			}
			void SetParameter(uint32_t Index, double Value)
			{
				if (sqlite3_bind_double(this->stmtPtr.get(), Index + 1, Value) != SQLITE_OK)
					BOOST_THROW_EXCEPTION(DatabaseException(this->sqlitePtr, "Failed to bind bool value to statement!"));
			}
			void SetParameter(uint32_t Index, char* Value)
			{
				if (sqlite3_bind_text(this->stmtPtr.get(), Index + 1, Value, strlen(Value), NULL) != SQLITE_OK)
					BOOST_THROW_EXCEPTION(DatabaseException(this->sqlitePtr, "Failed to bind bool value to statement!"));
			}

			void SetParameter(uint32_t Index, bool Value) { this->SetParameter(Index, (int)Value); }
			void SetParameter(uint32_t Index, int16_t Value) { this->SetParameter(Index, (int)Value); }
			void SetParameter(uint32_t Index, uint16_t Value) { this->SetParameter(Index, (int)Value); }
			void SetParameter(uint32_t Index, uint32_t Value) { this->SetParameter(Index, (int64_t)Value); }
			void SetParameter(uint32_t Index, uint64_t Value) { this->SetParameter(Index, boost::numeric_cast<int64_t, uint64_t>(Value)); }
			void SetParameter(uint32_t Index, float Value) { this->SetParameter(Index, (double)Value); }
			void SetParameter(uint32_t Index, const std::string& Value) { this->SetParameter(Index, Value.c_str()); }

			Result* Execute(QueryFlag Flag = Sql::QUERYFLAG_NONE);
			uint32_t ParamCount() { return sqlite3_bind_parameter_count(this->stmtPtr.get()); }
			std::string StatementStr() { return ""; }
			void Reset();
			void ResetParameters();
		private:
			tSqlitePtr sqlitePtr;
			tSqliteStmtPtr stmtPtr;
		};
	}
	typedef boost::shared_ptr<Detail::Statement> Statement;
} }
#endif