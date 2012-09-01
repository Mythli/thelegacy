#include "Puzzle.h"

int main(int argc, char **argv) {
	try
	{
		//fbcarrerpuzzles::tPuzzle puzzle(new fbcarrerpuzzles::breathalyzer::Puzzle(argc, argv));
		//puzzle->Solve();
	}
	catch(const std::exception& ex)
	{
		// Write exception message to the error output stream
		std::cerr << ex.what() << std::endl;
		std::cerr << "Uncatched Exception. The application will now exit..." << std::endl;
		// Exit with failure code
		exit(EXIT_FAILURE);
	}
	
	// Exit with success code
	return EXIT_SUCCESS;
}
