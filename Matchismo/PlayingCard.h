//
//  PlayingCard.h
//  Matchismo
//
//  Created by jijuncai on 4/8/15.
//  Copyright (c) 2015 CS193p. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "Card.h"

// class playingcard
@interface PlayingCard : Card

// public properties
@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

// public static methods
+ (NSArray *)validSuits;
//+ (NSArray *)validRanks;
+ (NSUInteger)maxRank;

@end
