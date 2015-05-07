//
//  PlayingDeck.m
//  Matchismo
//
//  Created by jijuncai on 4/8/15.
//  Copyright (c) 2015 CS193p. All rights reserved.
//

#import "PlayingDeck.h"
#import "PlayingCard.h"

@implementation PlayingDeck

// override init of Deck class
- (instancetype)init
{
    self = [super init]; //super's desingnated initializer
    if (self) {
        for (NSString *suit in [PlayingCard validSuits]) {
            for (NSUInteger rank = 1; rank <= [PlayingCard maxRank]; rank++) {
                PlayingCard *card = [[PlayingCard alloc] init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card];
            }
        }
    }
    return self;
}

@end
