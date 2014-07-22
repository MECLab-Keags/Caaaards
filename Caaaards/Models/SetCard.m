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
@synthesize shading = _shading;

- (instancetype) initWithShape:(NSString *)shape number:(NSNumber *)number color:(SetCardColor)color shading:(NSString *)shading
{
	self = [super init];
	if (!self) return self;
	
	self.shape = shape;
	self.number = [number unsignedIntegerValue];
	self.color = color;
	self.shading = shading;
	
	return self;
}

- (NSString *) contents
{
	return [NSString stringWithFormat:@"%lu%@", (unsigned long)self.number, self.shape];
}

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

- (void) setColor:(SetCardColor)color
{
	if ([[SetCard validColors] containsObject:@(color)]) {
		_color = color;
	}
}

- (void) setShading:(NSString *)shading
{
	if (![[SetCard validShadings] containsObject:shading]) return;
	_shading = shading;
}

NSString *const ShadingOutlinedKey = @"outline";
NSString *const ShadingSolidKey = @"solid";
NSString *const ShadingShadedKey = @"shaded";


+ (NSArray *) validShapes
{
	return @[@"▲", @"●", @"■"];
}

+ (NSArray *) validColors
{
	return @[@(RedSetCardColor), @(GreenSetCardColor), @(PurpleSetCardColor)];
}

+ (NSArray *) validNumbers
{
	return @[@1, @2, @3];
}

+ (NSArray *) validShadings
{
	return @[ShadingOutlinedKey, ShadingShadedKey, ShadingSolidKey];
}

@end
