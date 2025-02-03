#include "test.h"

void testCallByValue()
{
	int v0 = 5;
	int increment = 2;
	int iterations = 10;
	int result = incrementByValueNumTimes(v0, increment, iterations);
	cout << "v0: " << v0 << " increment: " << increment
		 << " iterations: " << iterations << " result: " << result << '\n';
}

void testCallByReference()
{
	// BEGIN: 1d

	int v0 = 5;
	int increment = 2;
	int iterations = 10;
	int result = v0;
	incrementByValueNumTimesRef(result, increment, iterations);
	cout << "v0: " << v0 << " increment: " << increment
		 << " iterations: " << iterations << " result: " << result << '\n';
	// END: 1d

}


void testString(){
	// 3b OG 3e gjøres inne i her
	// BEGIN: 3e
	string grades = randomizeString(8, 'F', 'A');

	std::vector<int> gradeCount(6);

	for (int i = 0; i < 6; i++)
	{
		gradeCount[i] = countChar(grades, 'A' + i);
	}

	double avg;

	for (int i = 0; i < 6; i++)
	{
		avg += gradeCount[i] * (6 - i);
	}

	avg /= 6;

	std::cout << "Snitt: " << avg << std::endl;

	// END: 3e
}