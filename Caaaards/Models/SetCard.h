//
//  SetCard.h
//  Caaaards
//
//  Created by Keagan Soakell-Ho on 19/07/14.
//  Copyright (c) 2014 MtEden CodeLab. All rights reserved.
//

#import "Card.h"

@interface SetCard : Card

typedef NS_ENUM(NSInteger, SetCardColor)
{
	RedSetCardColor,
	GreenSetCardColor,
	PurpleSetCardColor
};

/*! Initializes and instance of SetCard with the given shape, number, color and shading. */
- (instancetype) initWithShape:(NSString *)shape number:(NSNumber *)number color:(SetCardColor)color shading:(NSString *)shading;

/*! Gets or sets the shape of the Set card */
@property (nonatomic) NSString *shape;

/*! Gets or sets the rank of the Set card */
@property (nonatomic) NSUInteger number;

/*! Gets or sets the color of the Set card */
@property (nonatomic) SetCardColor color;

/*! Gets or sets the shading of the Set card */
@property (nonatomic) NSString *shading;

/*! Key for the Outline shading */
extern NSString *const ShadingOutlinedKey;
/*! Key for the Solid shading */
extern NSString *const ShadingSolidKey;
/*! Key for the Shaded shading */
extern NSString *const ShadingShadedKey;

/*! Returns a list of valid shapes allowed for a Set card. */
+ (NSArray *) validShapes;

/*! Returns a list of valid numbers allowed for a Set card. */
+ (NSArray *) validNumbers;

/*! Returns a list of valid colors allowed for a Set card. */
+ (NSArray *) validColors;

/*! Returns a list of valid shadings allowed for a Set card. */
+ (NSArray *) validShadings;

@end
