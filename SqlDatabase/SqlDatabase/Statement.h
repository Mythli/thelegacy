#ifndef SQLDATABASE_PREPSTATEMENT_H
#define SQLDATABASE_PREPSTATEMENT_H

#include <boost/scoped_ptr.hpp>
#include "DatabaseException.h"
#include "Result.h"

namespace Sql { 
	namespace Detail {
		class Statement
		{
		public:
			Statement()
				: paramIndex(0) { }
			virtual ~Statement() { }

			virtual void Prepare(const std::string& StatementStr) = 0;	
	
			virtual void SetParameter(uint32_t Index, bool Value) = 0; 
			virtual void SetParameter(uint32_t Index, int16_t Value) = 0;
			virtual void SetParameter(uint32_t Index, uint16_t Value) = 0;
			virtual void SetParameter(uint32_t Index, int Value) = 0;
			virtual void SetParameter(uint32_t Index, uint32_t Value) = 0;
			virtual void SetParameter(uint32_t Index, int64_t Value) = 0;
			virtual void SetParameter(uint32_t Index, uint64_t Value) = 0;
			virtual void SetParameter(uint32_t Index, float Value) = 0;
			virtual void SetParameter(uint32_t Index, double Value) = 0;
			virtual void SetParameter(uint32_t Index, char* Value) = 0;
			virtual void SetParameter(uint32_t Index, const std::string& Value) = 0; //

			virtual void AddParameter(bool Value) { this->SetParameter(this->paramIndex, Value); this->sIncParamindex(); }
			virtual void AddParameter(int16_t Value) { this->SetParameter(this->paramIndex, Value); this->sIncParamindex(); }
			virtual void AddParameter(uint16_t Value) { this->SetParameter(this->paramIndex, Value); this->sIncParamindex(); }
			virtual void AddParameter(int Value) { this->SetParameter(this->paramIndex, Value); this->sIncParamindex(); }
			virtual void AddParameter(uint32_t Value) { this->SetParameter(this->paramIndex, Value); this->sIncParamindex(); }
			virtual void AddParameter(int64_t Value) { this->SetParameter(this->paramIndex, Value); this->sIncParamindex(); }
			virtual void AddParameter(uint64_t Value) { this->SetParameter(this->paramIndex, Value); this->sIncParamindex(); }
			virtual void AddParameter(float Value) { this->SetParameter(this->paramIndex, Value); this->sIncParamindex(); }
			virtual void AddParameter(double Value) { this->SetParameter(this->paramIndex, Value); this->sIncParamindex(); }
			virtual void AddParameter(char* Value) { this->SetParameter(this->paramIndex, Value); this->sIncParamindex(); }
			virtual void AddParameter(const std::string& Value) { this->SetParameter(this->paramIndex, Value); this->paramIndex++; }
	
			Statement& operator << (bool Value) { this->AddParameter(Value); return *this; }
			Statement& operator << (int16_t Value) { this->AddParameter(Value); return *this; }
			Statement& operator << (uint16_t Value) { this->AddParameter(Value); return *this; }
			Statement& operator << (int Value) { this->AddParameter(Value); return *this; }
			Statement& operator << (int64_t Value) { this->AddParameter(Value); return *this; }
			Statement& operator << (uint64_t Value) { this->AddParameter(Value); return *this; }
			Statement& operator << (float Value) { this->AddParameter(Value); return *this; }
			Statement& operator << (double Value) { this->AddParameter(Value); return *this; }
			Statement& operator << (char* Value) { this->AddParameter(Value); return *this; }
			Statement& operator << (const std::string& Value) { this->AddParameter(Value); return *this; }
	
			virtual void Reset() = 0;
			virtual void ResetParameters() = 0;
			virtual Result* Execute(QueryFlag Flag = QUERYFLAG_NONE) = 0;
			virtual uint32_t ParamCount() = 0;
			virtual std::string StatementStr() = 0;	

		protected:
			uint32_t paramIndex;
			virtual void sIncParamindex()
			{
				if (this->ParamCount() >= this->paramIndex)
					this->paramIndex++;
				else
					BOOST_THROW_EXCEPTION(std::logic_error("Parameter index out of bounds!"));
			}
		private:
		};
	} 

	typedef boost::shared_ptr<Detail::Statement> Statement;
}
#endif