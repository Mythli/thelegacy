#ifndef RCMETA_RCMETA_H
#define RCMETA_RCMETA_H

#include <vector>
#include "Reader/RCGitReader.h"
#include "Reader/RCSubversionReader.h"

namespace RCMeta
{
	typedef std::vector<boost::shared_ptr<RCMetaReader> > tRCMetaReaderVector;

	class RCMeta
	{
	public:
		static tRCMetaReaderVector DefaultReaders();
		
		RCMeta(tRCMetaReaderVector Readers = RCMeta::DefaultReaders()) :
			readers(Readers),
			isDataLoaded(false)
		{
		}

		RCMeta(const std::string& RCPath, tRCMetaReaderVector Readers = RCMeta::DefaultReaders()) :
			readers(Readers),
			isDataLoaded(false)
		{
			this->Open(RCPath);
		}

		~RCMeta()
		{
		}

		void Open(const std::string& RCPath);
		RCMetaData GetData() { return this->data; }
		RCMetaDataAdapter& Data() { return *this->dataAdapter; }

	private:
		tRCMetaReaderVector& readers;
		RCMetaData data;
		boost::shared_ptr<RCMetaDataAdapter> dataAdapter;
		bool isDataLoaded;
	};
} // namespace RCMeta

#endif