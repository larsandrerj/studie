#include "Card.h"

// BEGIN: 1c
std::string suitToString(Suit suit)
{
    return SuitToStringMap.at(suit);
}
// END: 1c

// BEGIN: 1d
std::string rankToString(Rank r)
{
    return rankToStringMap.at(r);
}
// END: 1d

// BEGIN: 2b
Card::Card(Suit suit, Rank rank)
{
    this->s = suit;
    this->r = rank;
}
// END: 2b

// BEGIN: 2c
Suit Card::getSuit()
{
    return this->s;
}

// END: 2c

// BEGIN: 2d
Rank Card::getRank()
{
    return this->r;
}

// END: 2d

// BEGIN: 2e
std::string Card::toString()
{
    return rankToString(Card::getRank()) + " of " + suitToString(Card::getSuit());
}
// END: 2e