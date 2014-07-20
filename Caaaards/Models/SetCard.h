//
//  SetCard.h
//  Caaaards
//
//  Created by Keagan Soakell-Ho on 19/07/14.
//  Copyright (c) 2014 MtEden CodeLab. All rights reserved.
//

#import "Card.h"

@interface SetCard : Card

/*! Gets or sets the shape of the Set card */
@property (nonatomic) NSString *shape;

/*! Gets or sets the rank of the Set card */
@property (nonatomic) NSUInteger number;

/*! Gets or sets the color of the Set card */
@property (nonatomic) NSString *color;

/*! Gets or sets the shading of the Set card */
@property (nonatomic) NSString *shading;

/*! Returns a list of valid shapes allowed for a Set card. */
+ (NSArray *) validShapes;

/*! Returns a list of valid numbers allowed for a Set card. */
+ (NSArray *) validNumbers;

/*! Returns a list of valid colors allowed for a Set card. */
+ (NSArray *) validColors;

/*! Returns a list of valid shadings allowed for a Set card. */
+ (NSArray *) validShadings;

@end
