//
//  SetCardGameViewController.m
//  Caaaards
//
//  Created by Keagan Soakell-Ho on 20/07/14.
//  Copyright (c) 2014 MtEden CodeLab. All rights reserved.
//

#import "SetCardGameViewController.h"
#import "SetCardDeck.h"

@interface SetCardGameViewController ()

@end

@implementation SetCardGameViewController

- (Deck *) initializeDeck
{
	return [[SetCardDeck alloc] init];
}

@end
