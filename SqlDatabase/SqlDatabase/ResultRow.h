#ifndef SQLDATABASE_SQLRESULTROW_H
#define	SQLDATABASE_SQLRESULTROW_H

#include <vector>


#include "ResultField.h"
namespace Sql {
	class ResultRow
	{
	public:
		//SqlResultRow()  { }
		virtual ~ResultRow() { }

		// by index accessor
		virtual ResultField& operator[] (uint32_t Index) = 0;
		// by fieldName accessor
		virtual ResultField& operator[] (const std::string& FieldName) = 0;
	
		virtual uint32_t FieldCount() = 0;
	};
}
#endif