#pragma once
#include "std_lib_facilities.h"
#include <fstream>
#include <filesystem>

void writeUserInputToFile(const std::string &filename);
void addLineNumbers(const std::string &filename);