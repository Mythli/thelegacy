#include "RCMeta.h"

RCMeta::tRCMetaReaderVector RCMeta::RCMeta::DefaultReaders()
{
	tRCMetaReaderVector tmpVector;
	tmpVector.push_back(boost::shared_ptr<RCGitReader>(new RCGitReader()));
	tmpVector.push_back(boost::shared_ptr<RCSubversionReader>(new RCSubversionReader()));
	return tmpVector;
}

void RCMeta::RCMeta::Open(const std::string& RCPath)
{
	this->isDataLoaded = false;

	for (unsigned int i = 0; i < this->readers.size(); i++)
	{
		if(this->readers[i]->Check(RCPath) == true)
		{
			this->data = readers[i]->ReadData();
			this->dataAdapter = readers[i]->CreateDataAdapter(&this->data);
			this->isDataLoaded = true;
		}
	}
	if (!this->isDataLoaded)
		throw std::logic_error("Failed to find a valid RCMetaReader!");
}