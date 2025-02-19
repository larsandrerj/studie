#include "FileUtils.h"


void writeUserInputToFile(const std::string &path)
{
	// BEGIN: 1a
	std::filesystem::path file_path{path};

	std::ofstream output_stream{file_path};

	while (true)
	{
		std::string input;
		std::cin >> input;

		if (input == "quit") break;

		output_stream << input << std::endl;
	}
	// END: 1a
}


void addLineNumbers(const std::string &filename)
{
	// BEGIN: 1b
	if (!std::filesystem::exists(filename)) return;

	std::ifstream input_stream{filename};

	if (input_stream.fail()) return;

	std::string line;
	std::string output;
	int i = 1;

	while (std::getline(input_stream, line))
	{
		output += line + " " + std::to_string(i) + ".\n";
		i++;
	}

	std::ofstream output_stream{filename + ".linum"};
	output_stream << output << std::endl;
	// END: 1b
}