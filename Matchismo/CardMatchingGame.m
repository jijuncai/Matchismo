//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by jijuncai on 4/16/15.
//  Copyright (c) 2015 CS193p. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()

@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards;

@end

@implementation CardMatchingGame

- (NSMutableArray *)cards{
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck matchnumber:(NSUInteger) numCard{
    self = [super init];
    if (self) {
        self.numCard = numCard;
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            }else{
                self = nil;
                break;
            }
            
        }
    }
    return self;
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

// insure two cards match mode at least
- (NSUInteger)numCard{
    if (!_numCard) {
        _numCard = 2;
    }
    return _numCard;
}

- (void)chooseCardAtIndex:(NSUInteger)index{
    Card *card = [self cardAtIndex:index]; // current card
    self.resultString = [NSString stringWithFormat:@"%@", card.contents]; // current card
    
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
            self.resultString = @"";
        } else {
            // mutable array to collect all cards(not include self card) that will be matched
            NSMutableArray *othercards = [NSMutableArray array];
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) [othercards addObject:otherCard];
            }
            
            if ([othercards count] == self.numCard - 1) { // check match mode
                int matchScore = [card match:othercards];
                
                if (matchScore) { // get matched score, disable matched cards and show info
                    self.score += matchScore * MATCH_BONUS;
                    card.matched = YES;
                    NSString *otherCardsContents = @"";
                    for (Card *otherCard in othercards) {
                        otherCard.matched = YES;
                        otherCardsContents = [otherCardsContents stringByAppendingFormat:@"%@", otherCard.contents];
                    }
                    self.resultString = [NSString stringWithFormat:@"Matched %@ %@ for score: %d", card.contents, otherCardsContents, matchScore * MATCH_BONUS];
                }
                
                else { // give mismatched penalty, face down compared cards and show them
                    self.score -= MISMATCH_PENALTY;
                    for (Card *otherCard in othercards){
                        otherCard.chosen = NO;
                    }
                    self.resultString = [NSString stringWithFormat:@"Mismatch! Penalty of %d", MISMATCH_PENALTY];
                }
            }
            self.score -= COST_TO_CHOOSE; // deduct 1 score of cost to choose
            card.chosen = YES; // face up the current card
        }
    }
}

- (Card *)cardAtIndex:(NSUInteger)index{
    return (index<[self.cards count]) ? self.cards[index] : nil;
}

@end
