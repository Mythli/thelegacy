#include "Puzzle.h"

using namespace fbcarrerpuzzles;

void Puzzle::Open(int argc, char** argv)
{
	std::string fileName;
	
	try
	{
		if (argc < 2)
			throw std::logic_error("You have to pass a filename!");
		// Initialize fileName with first comand line argument
		fileName = std::string(argv[1]);
		if(fileName.size() < 3)
			throw std::logic_error("File name invalid!");
	}
	// Perform console input if comand line arguments were incorect
	catch(const std::exception& ex)
	{
		std::cout << "Error: "  << ex.what() << std::endl;
		std::cout << "Enter a filename: ";
		std::cin >> fileName;
		
		if(fileName.size() < 1)
			throw std::logic_error("No filename entered!");
		else if(fileName.size() < 3)
			throw std::logic_error("File name invalid!");
	}
	this->Open(fileName);
}

void Puzzle::Open(const std::string& FileName)
{
	if (!this->iFBStream)
		this->iFBStream.reset(new std::ifstream());
		
	// Open input file
	this->iFBStream->open(FileName.c_str());
	// Test iStream
	if (!this->iFBStream->good())
		throw std::logic_error("Failed to open input file!");
}
