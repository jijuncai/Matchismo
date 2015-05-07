//
//  Deck.m
//  Matchismo
//
//  Created by jijuncai on 4/8/15.
//  Copyright (c) 2015 CS193p. All rights reserved.
//

#import "Deck.h"

@interface Deck()

@property (strong, nonatomic) NSMutableArray *cards; // of Card

@end

@implementation Deck

// create an mutable array of cards
- (NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

// add card at top of an array
-(void)addCard:(Card*)card atTop:(BOOL)atTop{
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    } else {
        [self.cards addObject:card];
    }
}

// add card at no top position
- (void)addCard:(Card *)card
{
    [self addCard:card atTop:NO];
}

// draw a random card from cards
- (Card *)drawRandomCard {
    Card *randomCard = nil;
    
    // ensure it has cards
    if ([self.cards count]) {
        unsigned index = arc4random() % [self.cards count];
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    return randomCard;
}

@end
