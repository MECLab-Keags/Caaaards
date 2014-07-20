//
//  ViewController.h
//  Caaaards
//
//  Created by Keagan Soakell-Ho on 7/07/14.
//  Copyright (c) 2014 MtEden CodeLab. All rights reserved.
//
// Abstract CardGameViewController.

#import <UIKit/UIKit.h>
#import "Deck.h"

@interface CardGameViewController : UIViewController

/*! Overridable message executed to update the specified button using the given card. */
- (void) updateButton:(UIButton *) button withCard:(Card *) card;

/*! Abstract message to initialize the deck of cards. */
- (Deck *) initializeDeck;

@end
