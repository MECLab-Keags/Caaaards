//
//  PlayingCardViewController.m
//  Caaaards
//
//  Created by Keagan Soakell-Ho on 19/07/14.
//  Copyright (c) 2014 MtEden CodeLab. All rights reserved.
//

#import "PlayingCardViewController.h"
#import "PlayingCardDeck.h"

@interface PlayingCardViewController ()

@end

@implementation PlayingCardViewController

- (void) updateButton:(UIButton *)button withCard:(Card *)card
{
	[super updateButton:button withCard:card];
	
	[button setTitle:[self titleForCard:card] forState:UIControlStateNormal];
}

- (Deck *) initializeDeck
{
	return [[PlayingCardDeck alloc] init];
}

- (NSString *) titleForCard:(Card *) card
{
	return card.isChosen ? card.contents : @"";
}

@end
