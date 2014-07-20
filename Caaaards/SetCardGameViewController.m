//
//  SetCardGameViewController.m
//  Caaaards
//
//  Created by Keagan Soakell-Ho on 20/07/14.
//  Copyright (c) 2014 MtEden CodeLab. All rights reserved.
//

#import "SetCardGameViewController.h"
#import "SetCardDeck.h"
#import "SetCard.h"

@interface SetCardGameViewController ()

@end

@implementation SetCardGameViewController

- (Deck *) initializeDeck
{
	return [[SetCardDeck alloc] init];
}

- (void) updateButton:(UIButton *)button withCard:(Card *)card
{
	[super updateButton:button withCard:card];
	
	if (![card isKindOfClass:[SetCard class]]) return;
	
	if (!card.isChosen) {
		NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:@""
																				  attributes:@{ NSFontAttributeName:[UIFont preferredFontForTextStyle:UIFontTextStyleBody]}];
		[button setAttributedTitle:title forState:UIControlStateNormal];
		return;
	}
	
	SetCard *setCard = (SetCard *)card;
	NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:setCard.contents];
	
	if ([setCard.shading isEqualToString:ShadingSolidKey]) {
		// Solid Sharding: Set just the forgroud color on the text.
		[title addAttribute:NSForegroundColorAttributeName
					  value:setCard.color
					  range:NSMakeRange(0, [title length])];
		
	} else if ([setCard.shading isEqualToString:ShadingOutlinedKey]){
		// Shaded shading: Set a semi-transparent background color on the text.
		[title addAttributes:@{ NSBackgroundColorAttributeName:[setCard.color colorWithAlphaComponent:0.75],
								NSFontAttributeName:[UIFont systemFontOfSize:25.0],}
					   range:NSMakeRange(0, [title length])];
		
	} else if ([setCard.shading isEqualToString:ShadingShadedKey]) {
		// Shaded Outlined: Set the outline;
		[title addAttributes:@{ NSStrokeColorAttributeName:setCard.color,
								NSStrokeWidthAttributeName:@3 }
					   range:NSMakeRange(0, [title length])];
	}
	[button setAttributedTitle:title forState:UIControlStateNormal];
}

@end
