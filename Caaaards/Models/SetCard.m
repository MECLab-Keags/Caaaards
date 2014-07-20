//
//  SetCard.m
//  Caaaards
//
//  Created by Keagan Soakell-Ho on 19/07/14.
//  Copyright (c) 2014 MtEden CodeLab. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard

@synthesize shape = _shape;
@synthesize number = _number;
@synthesize color = _color;
@synthesize shading = _shading;

- (void) setShape:(NSString *)shape
{
	if (![[SetCard validShapes] containsObject:shape]) return;
	_shape = shape;
}

- (NSString *) shape
{
	return _shape ? _shape : @"?";
}

- (void) setNumber:(NSUInteger) number
{
	if (![[SetCard validNumbers] containsObject:[NSNumber numberWithUnsignedLong:number]]) return;
	_number = number;
}

- (NSUInteger) number
{
	return [[SetCard validNumbers] containsObject:[NSNumber numberWithUnsignedInteger:_number]] ? _number : NSUIntegerMax;
}

+ (NSArray *) validShapes
{
	return @[@"▲", @"●", @"■"];
}

+ (NSArray *) validNumbers
{
	return @[@1, @2, @3];
}

+ (NSArray *) validColors
{
	return @[[UIColor redColor], [UIColor purpleColor], [UIColor greenColor]]; //@[@"red", @"purple", @"green"];
}

+ (NSArray *) validShadings
{
	return @[@"solid", @"striped", @"outlined"];
}

@end
