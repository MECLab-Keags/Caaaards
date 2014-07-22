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
	
	for (NSString *shape in [SetCard validShapes]) {
		for (NSNumber *number in [SetCard validNumbers]) {
			for (NSNumber *color in [SetCard validColors]) {
				for (NSString *shading in [SetCard validShadings]) {
					SetCard *card = [[SetCard alloc] initWithShape:shape
															number:number
															 color:(SetCardColor)[color integerValue]
														   shading:shading];
					
					[self addCard:card];
				}
			}
		}
	}
	
	return self;
}

@end
