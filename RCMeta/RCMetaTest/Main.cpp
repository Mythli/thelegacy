#include <iostream>
#include "RCMeta/RCMeta.h"

int main(int argc, char **argv)
{
	bool run = true;

	while(run)
	{
		std::cout << "Enter a revision controled path: ";
		
		std::string path;
		std::getline(std::cin, path);

		if (path.size() < 2)
			path = "../../";
		try
		{
			if (path == "exit")
				exit(0);

			std::cout << "============================================================" << std::endl;
			if (path[path.size() - 1] != '\\' && path[path.size() - 1] != '/')
			path += "/";

			RCMeta::RCMeta rcMeta(path);
			
			std::cout << "Type: " << rcMeta.Data().TypeStr() << std::endl;
			std::cout << "UID: " << rcMeta.Data().RevisionUID() << std::endl;
			std::cout << "Url: " << rcMeta.Data().Url() << std::endl;
			std::cout << "Author: " << rcMeta.Data().Author() << std::endl;
			std::cout << "Date: " << boost::posix_time::to_simple_string(rcMeta.Data().Date()) << std::endl;
			std::cout << "============================================================" << std::endl;
		}
		catch(std::exception& ex)
		{
			std::cout << "Failed to read meta data: " << ex.what() << std::endl;
		}
	}
}