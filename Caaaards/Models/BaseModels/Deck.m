//
//  Deck.m
//  Caaaards
//
//  Created by Keagan Soakell-Ho on 7/07/14.
//  Copyright (c) 2014 MtEden CodeLab. All rights reserved.
//

#import "Deck.h"
#import "Card.h"

@interface Deck()

@property (strong, nonatomic) NSMutableArray *cards;

@end

@implementation Deck

- (NSMutableArray *)cards
{
    if (!_cards)
        _cards = [[NSMutableArray alloc] init];
    
    return _cards;
}

// Adds the given card to the bottom of the deck.
- (void) addCard:(Card *)card
{
    [self addCard:card atTop:NO];
}

// Adds the given card to the stack 
- (void) addCard:(Card *)card atTop:(BOOL)atTop
{
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    } else {
        [self.cards addObject:card];
    }
}

- (Card *) drawRandomCard
{
    if (![self.cards count]) return nil;
    
    // random index based on the number of cards in the stack.
    unsigned index = arc4random() % [self.cards count];
    
    // get the card at the random index
    Card *randomCard = self.cards[index];
    
    // remove the card from the deck
    [self.cards removeObjectAtIndex:index];
    
    return randomCard;
}

@end
