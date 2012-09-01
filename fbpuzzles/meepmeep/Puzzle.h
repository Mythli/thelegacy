#ifndef FBCARRERPUZZLES_MEEPMEEP_PUZZLE_H
#define FBCARRERPUZZLES_MEEPMEEP_PUZZLE_H

#include "../Puzzle.h"

namespace fbcarrerpuzzles
{
	namespace meepmeep
	{
		class Puzzle :
		public fbcarrerpuzzles::Puzzle
		{
		public:
			Puzzle(std::ostream* OStream = NULL, std::ostream* EStream = NULL) :
				fbcarrerpuzzles::Puzzle(OStream, EStream)
			{ }
						
			void Solve()
			{
				*this->oStream << "Meep meep!" << std::endl;
			}
		};
	}
}

#endif