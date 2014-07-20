//
//  ViewController.m
//  Caaaards
//
//  Created by Keagan Soakell-Ho on 7/07/14.
//  Copyright (c) 2014 MtEden CodeLab. All rights reserved.
//

#import "CardGameViewController.h"
#import "Models/PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@property (nonatomic) BOOL isFaceShowing;
@property (strong, nonatomic) CardMatchingGame *game;

@end

@implementation CardGameViewController

- (IBAction)touchDealButton
{
	self.game = nil;
	[self updateUI];
}

- (IBAction)touchCardButton:(UIButton *)sender
{
    NSUInteger chooseButtonIndex = [self.cardButtons indexOfObject:sender];
	
	// choose the card using the index of the sender within the outlet collection.
	[self.game chooseCardAtIndex:chooseButtonIndex];
	
	[self updateUI];
}

- (void) updateUI
{
	// iterate over all the buttons and set the title and background imaged based on it's state.
	for (UIButton *cardButton in self.cardButtons) {
		NSUInteger index = [self.cardButtons indexOfObject:cardButton];
		Card *card = [self.game cardAtIndex:index];
		
		if (card.isMatched) {
			cardButton.enabled = NO;
			cardButton.alpha = 0.75;
		}
		
		[self updateButton:cardButton withCard:card];
		[cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
	}
	self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", (long)self.game.score];
}

- (void) updateButton:(UIButton *)button withCard:(Card *)card
{
	// nothing to do here, should be overridden by the subclass.
}

// Abstract method, to be overridden by the subclass
- (Deck *) initializeDeck
{
	return nil;
}

- (CardMatchingGame *) game
{
	if (!_game)
		_game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
												  usingDeck:[self initializeDeck]];
	return _game;
}

- (UIImage *) backgroundImageForCard:(Card *) card
{
	return card.isChosen ? nil : [UIImage imageNamed:@"CardBack_Blue"];
}

@end
