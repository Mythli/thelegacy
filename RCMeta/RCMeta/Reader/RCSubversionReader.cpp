#include "RCSubversionReader.h"

bool RCMeta::RCSubversionReader::Check(const std::string& RCPath)
{
	this->rcPath = RCPath;

	if (!boost::filesystem::is_directory(this->rcPath))
		throw std::logic_error("RCPath is not a directory!");

	if (boost::filesystem::is_directory(this->rcPath + ".svn/"))
	{
		this->rcPath = this->rcPath + ".svn/";
		return true;
	} else if(boost::filesystem::is_directory(this->rcPath + "_svn/"))
	{
		this->rcPath = this->rcPath + "_svn/";
		return true;
	}
	return false;
}

RCMeta::RCMetaData RCMeta::RCSubversionReader::ReadData()
{
	std::ifstream fStream;
	fStream.open(std::string(this->rcPath + "ENTRIES").c_str());
	if (!fStream.good())
		throw std::logic_error("Failed to open ENTRIES file");

	RCMetaData tmpData;
	std::string line;

	std::getline(fStream, line);
	std::getline(fStream, line);
	std::getline(fStream, line);

	std::getline(fStream, tmpData.RevisionUID);
	std::getline(fStream, tmpData.Url);

	std::getline(fStream, line);
	std::getline(fStream, line);
	std::getline(fStream, line);
	std::getline(fStream, line);

	std::getline(fStream, line);
	boost::regex timeMatch("^(\\d+-\\d+-\\d+)T(\\d+:\\d+).*$");
	boost::match_results<std::string::const_iterator> matches;
	if (boost::regex_match(line, matches, timeMatch) && matches[1].matched && matches[2].matched)
		tmpData.Date = boost::posix_time::time_from_string(matches[1] + " " + matches[2]);

	std::getline(fStream, line);

	std::getline(fStream, tmpData.Author);

	tmpData.Type = this->Type();
	tmpData.TypeStr = this->TypeStr();

	return tmpData;
}