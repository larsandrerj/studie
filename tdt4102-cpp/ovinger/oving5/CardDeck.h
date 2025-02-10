#pragma once
#include "Card.h"

// BEGIN: 3a
class CardDeck
{
    private:
    void swap(int i, int j);

    public:
    std::vector<Card> cards;

    CardDeck();

    void print();

    void shuffle();

    Card drawCard();

};
// END: 3a
