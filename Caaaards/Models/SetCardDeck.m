//
//  SetCardDeck.m
//  Caaaards
//
//  Created by Keagan Soakell-Ho on 19/07/14.
//  Copyright (c) 2014 MtEden CodeLab. All rights reserved.
//

#import "SetCardDeck.h"
#import "SetCard.h"

@implementation SetCardDeck

- (instancetype) init
{
	self = [super init];
	if (!self) return self;
	
	NSArray *matrix = @[[SetCard validShapes], [SetCard validNumbers], [SetCard validColors], [SetCard validShadings]];
	
	
	
	return self;
}

@end
