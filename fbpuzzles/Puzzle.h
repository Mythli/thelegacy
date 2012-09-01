#ifndef FBCARRERPUZZLES_PUZZLE_H
#define FBCARRERPUZZLES_PUZZLE_H


#include <istream>
#include <fstream>
#include <iostream>
#include <stdexcept>
#include <stdlib.h>

#include <boost/shared_ptr.hpp>
#include <boost/scoped_ptr.hpp>

#include "Defines.h"

namespace fbcarrerpuzzles
{
	typedef boost::shared_ptr<std::ifstream> ifStreamRef;
	class Puzzle
	{
	public:
		Puzzle(std::ostream* OStream = NULL, std::ostream* EStream = NULL)
		{
			this->setOEStream(OStream, EStream);
		}
		
		Puzzle(int argc, char **argv, std::ostream* OStream = NULL, std::ostream* EStream = NULL)
		{ 
			this->setOEStream(OStream, EStream);
			this->Open(argc, argv);
		}
		
		Puzzle(const std::string& FileName, std::ostream* OStream = NULL, std::ostream* EStream = NULL)
		{
			this->setOEStream(OStream, EStream);
			this->Open(FileName);
		}
		
		Puzzle(ifStreamRef IFBStream, std::ostream* OStream = NULL, std::ostream* EStream = NULL) :
			iFBStream(IFBStream)
		{
			this->setOEStream(OStream, EStream);
		}
		
		virtual void Open(int argc, char **argv);
		virtual void Open(const std::string& FileName);
		
		virtual void Solve() = 0;
		
		virtual void Close()
		{
			if(this->iFBStream->is_open())
				this->iFBStream->close();
		}
		
		virtual ~Puzzle() {
			this->Close();
		}
	protected:
		ifStreamRef iFBStream;
		std::ostream* oStream;
		std::ostream* eStream;
	private:
		void setOEStream(std::ostream* OStream = NULL, std::ostream* EStream = NULL)
		{
			if(OStream)
				this->oStream = OStream;
			else
				this->oStream = &std::cout;
			
			if(EStream)
				this->eStream = EStream;
			else
				this->eStream = &std::cerr;
		}
	};
	
	typedef boost::scoped_ptr<fbcarrerpuzzles::Puzzle> tPuzzle;
}

#endif