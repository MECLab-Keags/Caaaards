//
//  Deck.h
//  Caaaards
//
//  Created by Keagan Soakell-Ho on 7/07/14.
//  Copyright (c) 2014 MtEden CodeLab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card;
- (void)addCard:(Card *)card atTop:(BOOL)atTop;

- (Card *)drawRandomCard;

@end
