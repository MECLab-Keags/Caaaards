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

- (instancetype) initWithShape:(NSString *)shape number:(NSNumber *)number color:(UIColor *)color shading:(NSString *)shading
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

- (void) setColor:(UIColor *)color
{
	for (NSString *colorKey in [SetCard validColors]) {
		UIColor *validColor = [[SetCard validColors] objectForKey:colorKey];
		if ([validColor isEqual:color]) {
			_color = color;
			break;
		}
	}
}

- (void) setShading:(NSString *)shading
{
	if (![[SetCard validShadings] containsObject:shading]) return;
	_shading = shading;
}

static const NSString *COLOR_RED_KEY = @"red";
static const NSString *COLOR_PURPLE_KEY = @"purple";
static const NSString *COLOR_GREEN_KEY	= @"green";

NSString *const ShadingOutlinedKey = @"outline";
NSString *const ShadingSolidKey = @"solid";
NSString *const ShadingShadedKey = @"shaded";


+ (NSArray *) validShapes
{
	return @[@"▲", @"●", @"■"];
}

+ (NSArray *) validNumbers
{
	return @[@1, @2, @3];
}

+ (NSDictionary *) validColors
{
	return @{ COLOR_RED_KEY:[UIColor redColor],
			  COLOR_PURPLE_KEY:[UIColor purpleColor],
			  COLOR_GREEN_KEY:[UIColor greenColor] };
}

+ (NSArray *) validShadings
{
	return @[ShadingOutlinedKey, ShadingShadedKey, ShadingSolidKey];
}

@end
