#include "RCGitReader.h"


bool RCMeta::RCGitReader::Check(const std::string& RCPath)
{
	this->rcPath = RCPath;

	if (!boost::filesystem::is_directory(this->rcPath))
		throw std::logic_error("RCPath is not a directory!");
	this->rcPath += ".git/";

	return boost::filesystem::is_directory(this->rcPath);
}

RCMeta::RCMetaData RCMeta::RCGitReader::ReadData()
{
	std::ifstream fStream;
	fStream.open(std::string(this->rcPath + "FETCH_HEAD").c_str());
	if (!fStream.good())
		throw std::logic_error("Failed to open FETCH_HEAD file");

	std::string line;
	if (std::getline(fStream, line))
	{
		// matches[1] rUID
		// matches[2] branch
		// matches[3] url
		boost::regex rcInfoLineMatch("^([a-z0-9]*)\\s*branch '([^']*)' of\\s(.*)$");
		boost::match_results<std::string::const_iterator> matches;

		if (!boost::regex_match(line, matches, rcInfoLineMatch) || !matches[1].matched)
			throw std::logic_error("FETCH_HEAD file is not valid!");

		RCMetaDataGit tmpData;
		tmpData.RevisionUID = matches[1];
		tmpData.Branch = matches[2];
		tmpData.Url = this->formatUrl(matches[3]);
		tmpData.Type = this->Type();
		tmpData.TypeStr = this->TypeStr();

		// We are finish with file FETCH_HEAD
		fStream.close();
		fStream.open(std::string(this->rcPath + "/logs/HEAD").c_str());
		if (fStream.good())
		{
			// matches[1] Author
			// matches[2] Unix timestamp
			boost::regex rcLogFileLineMatch("^[a-z0-9]+\\s+"+tmpData.RevisionUID+"\\s+([^\\s]*).*?\\s+(\\d+).*$");
			while(fStream.good())
			{
				std::getline(fStream, line);

				if (!boost::regex_match(line, matches, rcLogFileLineMatch) || !matches[1].matched || !matches[2].matched)
					continue;
				tmpData.Author = matches[1];
				tmpData.Date = boost::posix_time::from_time_t(atoi(std::string(matches[2]).c_str()));
			}
		}

		return tmpData;
	} else
		throw std::logic_error("Failed to read Line!");
}

std::string RCMeta::RCGitReader::formatUrl(const std::string& Url)
{
	// github.com:Mythli/RCMeta
	// matches[1] Host
	// matches[2] User
	// matches[2] Name
	boost::regex urlMatch("^(.*?\\..*?):(.*?)/(.*)$");
	boost::match_results<std::string::const_iterator> matches;

	if (boost::regex_match(Url, matches, urlMatch))
	{
		std::string tmpUrl = "http://";
		tmpUrl += matches[1];
		tmpUrl += "/";
		tmpUrl += matches[2];
		tmpUrl += "/";
		tmpUrl += matches[3];
		tmpUrl += "/";
		return tmpUrl;
	} else
		return Url;
}