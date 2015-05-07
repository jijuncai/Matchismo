//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by jijuncai on 4/16/15.
//  Copyright (c) 2015 CS193p. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject

// add numCard for switch match mode
- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck matchnumber:(NSUInteger) numCard;
- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;

// public properties
@property (nonatomic, readonly) NSInteger score;
@property (nonatomic, strong) NSString *resultString;
@property (nonatomic) NSUInteger numCard;

@end
