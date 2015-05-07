//
//  PlayingCard.m
//  Matchismo
//
//  Created by jijuncai on 4/8/15.
//  Copyright (c) 2015 CS193p. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (int)match:(NSArray *)otherCards{
    int score = 0;
    if ([otherCards count] == 1) {
        
        PlayingCard *otherCard = [otherCards firstObject];
        if (otherCard.rank == self.rank) {
            score = 4;
        } else if ([otherCard.suit isEqualToString:self.suit]){
            score = 1;
        }
    }
    
    if ([otherCards count] > 1) { // mutiple cards match mode to get score
        NSUInteger rankMatchCount = 0;
        NSUInteger suitMatchCount = 0;
        
        // create a mutable array to collect all cards(include self card) that will be matched
        NSMutableArray *compareCards = [[NSMutableArray alloc] init];
        compareCards[0] = self;
        for (Card *card in otherCards){
            [compareCards addObject:card];
        }
        
        // two for loop to compare cards each other and get the number of rank and suit matches
        NSUInteger compareCardsCount = [compareCards count];
        for (int i = 1; i < compareCardsCount; i++) {
            for (int j = 1; j < [compareCards count]; j++) {
                PlayingCard *otherCard = (PlayingCard *)compareCards[j];
                PlayingCard *firstCard = (PlayingCard *)[compareCards firstObject];
                if (otherCard.rank == firstCard.rank) rankMatchCount++;
                else if ([otherCard.suit isEqualToString:firstCard.suit]) suitMatchCount++;
            }
            [compareCards removeObjectAtIndex:0];
        }
        
        // get score through their number of matches
        if (rankMatchCount == 3 || suitMatchCount == 3) score = 5;
        else if(rankMatchCount == 1 && suitMatchCount == 1) score = 2;
    }
    return score;
}

// override contents property of card for use
- (NSString *)contents{
    NSArray *rankStrings = [PlayingCard validRanks];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

// implementations of public methods
+ (NSArray *)validSuits{
    return @[@"♥",@"♦",@"♠",@"♣"];
}

+ (NSArray *)validRanks{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}


+ (NSUInteger)maxRank {
    return [[self validRanks] count]-1;
}

@synthesize suit = _suit; // must have because we provide setter AND getter

// setter for suit
- (void)setSuit:(NSString *)suit{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

// getter for suit
- (NSString *)suit{
    return _suit ? _suit : @"?";
}

// setter for rank
- (void)setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

@end
