#include "utilities.h"
#include <random>

// BEGIN: 5a
int randomWithLimits(int lowerLimit, int upperLimit)
{
    std::random_device rd;
    std::default_random_engine generator(rd());

    std::uniform_int_distribution<int> distribution(lowerLimit, upperLimit);

    return distribution(generator);
}
// END: 5a