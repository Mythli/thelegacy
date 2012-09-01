#include <iostream>

#ifndef SQLDATABASE_DATABASEEXCEPTION_H
#define SQLDATABASE_DATABASEEXCEPTION_H
namespace Sql {
	struct DatabaseException :
		public std::exception
	{
		int sqlErrorCode;
		std::string sqlErrorMessage;
	
		DatabaseException(const std::string& Message = "")
			: std::exception(Message.c_str()), sqlErrorCode(0) { }
		DatabaseException(int SqlErrorCode, const std::string& SqlErrorMessage = "", const std::string& Message = "")
			: std::exception(Message.c_str()), sqlErrorCode(SqlErrorCode), sqlErrorMessage(SqlErrorMessage) { }

		virtual ~DatabaseException()
		{
		}
	};
}
#endif