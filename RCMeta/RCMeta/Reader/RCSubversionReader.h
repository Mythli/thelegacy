// http://en.wikipedia.org/wiki/Subversion_(software)

#ifndef RCMETA_READER_RCSVNREADER_H
#define RCMETA_READER_RCSVNREADER_H

#include "../RCMetaReader.h"
#include <istream>
#include <fstream>
#include <boost/filesystem/operations.hpp>
#include <boost/filesystem/path.hpp>
#include <boost/regex.hpp>

namespace RCMeta
{
	class RCMetaDataSubversion
		: public RCMetaData

	{
	public:
	private:
	};

	class RCSubversionReader;
	class RCMetaDataSubversionAdapter
		: public RCMetaDataAdapter
	{
		friend class RCSubversionReader;
	public:
		RCType Type() { return this->data->Type; }
		std::string TypeStr() { return this->data->TypeStr; }
		std::string RevisionUID() { return this->data->RevisionUID; }
		boost::posix_time::ptime Date() { return this->data->Date; }
		std::string Author() { return this->data->Author; }
		std::string Url() { return this->data->Url; }
	private:
		RCMetaDataSubversion* data;
	};

	class RCSubversionReader :
		public RCMetaReader
	{
	public:
		RCType Type() { return RCTYPE_SUBVERSION; }
		std::string TypeStr() { return "Subversion"; }

		bool Check(const std::string& RCPath);

		RCMetaData ReadData();
		boost::shared_ptr<RCMetaDataAdapter> CreateDataAdapter(RCMetaData* data)
		{
			boost::shared_ptr<RCMetaDataSubversionAdapter> adapter(new RCMetaDataSubversionAdapter());
			adapter->data = (RCMetaDataSubversion*)data;

			return adapter;
		}
	private:
		std::string rcPath;
	};
} // namespace RCMeta

#endif