#include "CardDeck.h"

// BEGIN: 3b
CardDeck::CardDeck()
{   
    int ranks[]{2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14};
    int suits[]{1, 2, 3, 4};

    for (int r : ranks)
    {
        for (int s : suits)
        {
            this->cards.push_back(Card{static_cast<Suit>(s), static_cast<Rank>(r)});
        }
    }
}
// END: 3b

// BEGIN: 3c
void CardDeck::swap(int i, int j)
{
    Card temp = cards.at(i);
    cards.at(i) = cards.at(j);
    cards.at(j) = temp;
}

// END: 3c

// BEGIN: 3d
void CardDeck::print()
{
    for (Card c : cards)
    {
        std::cout << c.toString() << std::endl;
    }
}
// END: 3d

// BEGIN: 3e

void CardDeck::shuffle()
{
    std::random_device rd;
    std::default_random_engine generator(rd());

    std::uniform_int_distribution<int> distribution(1, 52);

    for (int i = 0; i < 1000; i++)
    {
        this->swap(distribution(generator), distribution(generator));
    }
}

// END: 3e

// BEGIN: 3f
Card CardDeck::drawCard()
{
    Card c = cards.back();
    cards.pop_back();
    return c;
}
// END: 3f
