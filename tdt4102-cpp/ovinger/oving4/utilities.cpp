#include "utilities.h"

int incrementByValueNumTimes(int startValue, int increment, int numTimes)
{
	for (int i = 0; i < numTimes; i++)
		startValue += increment;

	return startValue;
}

// BEGIN: 1d
///*returverdi*/ incrementByValueNumTimesRef(/*param 1: startValue(ref), param 2: increment, param 3: numtimes*/){}
void incrementByValueNumTimesRef(int& startValue, int increment, int numTimes)
{
	for (int i = 0; i < numTimes; i++)
		startValue += increment;
}
// END: 1d

// BEGIN: 1e
///*returverdi*/ swapNumbers(/*parametre*/){}
void swapNumbers(int& num1, int& num2)
{
	int temp = num1;
	num1 = num2;
	num2 = temp;
}
// END: 1e

// BEGIN: 2b
///*returverdi*/ printStudent(/*input Student*/) {}
void printStudent(Student student)
{
	std::cout << "Name: " << student.name << " Studyprogram: " << student.studyProgram << " Age: " << student.age << std::endl;
}
// END: 2b

// BEGIN: 2c
///*returverdi*/ isInProgram(/*param 1: Student, param 2: string*/){}
bool isInProgram(Student student, string program)
{
    return student.studyProgram == program;
}
// END: 2c


// BEGIN: 3a
///*returverdi*/ randomizeString(/*param 1: antall tegn, param 2: øvre grense, param 3: nedre grense */) 
string randomizeString(int length, char upperLimit, char lowerLimit)
{
	string s;
	random_device rd;
	default_random_engine generator(rd());

	uniform_int_distribution<int> distribution(lowerLimit, upperLimit);

	for (int i = 0; i < length; i++)
	{
		s +=(char) distribution(generator);
	}
	return s;
}
// END: 3a

// BEGIN: 3c
///*returverdi*/ readInputToString(/*param 1: lengde n, param 2: øvre grense, param 3: nedre grense*/)
string readInputToString(int length, char upperLimit, char lowerLimit)
{
	std::string s;
	bool valid = false;
	while (!valid)
	{
		valid = true;

		std::cout << "type string" << std::endl;
		std::cin >> s;
		if (s.length() != length) valid = false;

		for (char c : s)
		{
			if (c > upperLimit || c < lowerLimit) valid = false;
		}
	}

	for (char c : s)
	{
		c = toupper(c);
	}

	return s;


}
// END: 3c

// BEGIN: 3d
///*returverdi*/ countChar(/*param 1: string, param 2: char*/)
int countChar(string s, char c)
{
	int occurence;
	for (char ch : s)
	{
		if (ch == c) occurence++;
	}

	return occurence;
}
// END: 3d
