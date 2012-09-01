// http://en.wikipedia.org/wiki/Git_(software)

#ifndef RCMETA_READER_RCGITREADER_H
#define RCMETA_READER_RCGITREADER_H

#include <istream>
#include <fstream>
#include <boost/filesystem/operations.hpp>
#include <boost/filesystem/path.hpp>
#include <boost/regex.hpp>
#include "../RCMetaReader.h"

namespace RCMeta
{
	class RCMetaDataGit
		: public RCMetaData
	
	{
	public:
		std::string Branch;
	private:
	};

	class RCGitReader;
	class RCMetaDataGitAdapter
		: public RCMetaDataAdapter
	{
		friend class RCGitReader;
	public:
		RCType Type() { return this->data->Type; }
		std::string TypeStr() { return this->data->TypeStr; }
		std::string RevisionUID() { return this->data->RevisionUID; }
		boost::posix_time::ptime Date() { return this->data->Date; }
		std::string Author() { return this->data->Author; }
		std::string Url() { return this->data->Url; }
		std::string Branch() { return this->data->Branch; }
	private:
		RCMetaDataGit* data;
	};

	class RCGitReader :
		public RCMetaReader
	{
	public:
		RCType Type() { return RCTYPE_GIT; }
		std::string TypeStr() { return "Git"; }

		bool Check(const std::string& RCPath);
		RCMetaData ReadData();

		boost::shared_ptr<RCMetaDataAdapter> CreateDataAdapter(RCMetaData* data)
		{
			boost::shared_ptr<RCMetaDataGitAdapter> adapter(new RCMetaDataGitAdapter());
			adapter->data = (RCMetaDataGit*)data;

			return adapter;
		}

	private:
		std::string rcPath;

		std::string formatUrl(const std::string& Url);
	};
} // namespace RCMeta
#endif