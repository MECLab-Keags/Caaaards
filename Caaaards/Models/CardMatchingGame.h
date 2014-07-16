//
//  CardMatchingGame.h
//  Caaaards
//
//  Created by Keagan Soakell-Ho on 16/07/14.
//  Copyright (c) 2014 MtEden CodeLab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

/*! 
 Intializes an instance of a CardMatchingGame 
	with the specified number of available
	cards and deck of cards.
 */
- (instancetype) initWithCardCount:(NSUInteger)count
						 usingDeck:(Deck *)deck;

/*! Gets the current score of the card game */
@property (nonatomic, readonly) NSInteger score;

/*! Chooses a card at the specified index */
- (void) chooseCardAtIndex:(NSUInteger)index;

/*! Retrieves a card at the given index */
- (Card *) cardAtIndex:(NSUInteger)index;

@end
