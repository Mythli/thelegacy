#ifndef SQLDATABASE_DATABASE_H
#define SQLDATABASE_DATABASE_H

#include "DbAccessLayer.h"

namespace Sql {
	class Database
		 : private boost::noncopyable,
		   public DbAccessLayer
	{
	public:
		virtual ~Database() { }
	
		virtual void Open(const std::string& ConnectionString) = 0;
		virtual void Close() = 0;
	protected:
	private:
	};
}
#endif