//
//  Card.m
//  Matchismo
//
//  Created by jijuncai on 4/8/15.
//  Copyright (c) 2015 CS193p. All rights reserved.
//

#import "Card.h"

@implementation Card

// implementation of match method
- (int)match:(NSArray *)otherCards
{
    int score = 0;
    // try to find match card in an array of cards and score it
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
    return score;
}

@end
