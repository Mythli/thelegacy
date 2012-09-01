#ifndef FBCARRERPUZZLES_BREATHALYZER_PUZZLE_H
#define FBCARRERPUZZLES_BREATHALYZER_PUZZLE_H

#include <map>
#include <algorithm>

#include <boost/algorithm/string.hpp>
#include <boost/scoped_ptr.hpp>
#include <boost/multi_array.hpp>

#include "../Puzzle.h"
#include "Dictionary.h"


namespace fbcarrerpuzzles
{
	namespace breathalyzer
	{
		class Puzzle :
			public fbcarrerpuzzles::Puzzle
		{
		public:
			Puzzle(int argc, char** argv, std::ostream* OStream = NULL, std::ostream* EStream = NULL) :
				fbcarrerpuzzles::Puzzle(argc, argv, OStream, EStream)
			{ }
			
			void Solve();
		private:
		};
	}
}

#endif