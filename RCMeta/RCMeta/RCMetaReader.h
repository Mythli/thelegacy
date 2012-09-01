#ifndef RCMETA_RCMETAREADER_H
#define RCMETA_RCMETAREADER_H

#include <string.h>
#include <boost/scoped_ptr.hpp>
#include <boost/shared_ptr.hpp>
#include <boost/date_time/posix_time/posix_time.hpp>

namespace RCMeta
{
	enum RCType
	{
		RCTYPE_GIT,
		RCTYPE_SUBVERSION,
		RCTYPE_MERCURIAL
	};

	class RCMetaData
	{
	public:
		RCType Type;
		std::string TypeStr;
		std::string RevisionUID;
		boost::posix_time::ptime Date;
		std::string Author;
		std::string Url;

		virtual ~RCMetaData() { }
	};

	class RCMetaDataAdapter :
		public boost::noncopyable
	{
	public:
		virtual ~RCMetaDataAdapter() { }

		virtual RCType Type() = 0;
		virtual std::string TypeStr() = 0;
		virtual std::string RevisionUID() = 0;
		virtual boost::posix_time::ptime Date() = 0;
		virtual std::string Author() = 0;
		virtual std::string Url() = 0;
	};

	class RCMetaReader
	{
	public:
		RCMetaReader() {}
		virtual ~RCMetaReader() { }
		virtual RCType Type() = 0;
		virtual std::string TypeStr() = 0;
		virtual bool Check(const std::string& RCPath) = 0;
		virtual RCMetaData ReadData() = 0;
		virtual boost::shared_ptr<RCMetaDataAdapter> CreateDataAdapter(RCMetaData* data) = 0;
	};
} // namespace RCMeta

#endif