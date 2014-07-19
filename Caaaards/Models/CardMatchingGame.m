//
//  CardMatchingGame.m
//  Caaaards
//
//  Created by Keagan Soakell-Ho on 16/07/14.
//  Copyright (c) 2014 MtEden CodeLab. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()

@property (nonatomic, readwrite) NSInteger score;
@property (strong, nonatomic) NSMutableArray *cards;

@end

@implementation CardMatchingGame

static const int COST_TO_CHOOSE = 1;
static const int MATCH_BONUS = 4;
static const int MISMATCH_PENALTY = 2;


- (instancetype) initWithCardCount:(NSUInteger)count
						 usingDeck:(Deck *)deck
{
	self = [super init];
	if (!self) return self;
	
	for (int i = 0; i < count; i++) {
		Card *randomCard = [deck drawRandomCard];
		if (randomCard) {
			[self.cards addObject:randomCard];
		} else {
			self = nil;
			break;
		}
	}
	
	return self;
}

- (NSMutableArray *) cards
{
	if (!_cards) _cards = [[NSMutableArray alloc] init];
	return _cards;
}

- (void) chooseCardAtIndex:(NSUInteger)index
{
	Card *card = [self cardAtIndex:index];
	if (card.isMatched)
		return;
	
	if (card.isChosen) {
		// toggle card from chosen to not chosen
		card.chosen = NO;
		return;
	}
	
	for (Card *otherCard in self.cards) {
		if (otherCard.isChosen && !otherCard.isMatched) {
			NSInteger matchScore = [card match:@[otherCard]];
			if (matchScore) {
				self.score += matchScore * MATCH_BONUS;
				card.matched = otherCard.matched = YES;
			} else {
				self.score -= MISMATCH_PENALTY;
				otherCard.chosen = NO;
			}
			break;
		}
	}
	
	card.chosen = YES;
	self.score -= COST_TO_CHOOSE;
}

- (Card *) cardAtIndex:(NSUInteger)index
{
	return [self.cards count] > index ? self.cards[index] : nil;
}

@end
