//
//  threeCardsMatchViewController.m
//  Matchismo
//
//  Created by jijuncai on 4/28/15.
//  Copyright (c) 2015 CS193p. All rights reserved.
//

#import "threeCardsMatchViewController.h"
#import "PlayingDeck.h"

@interface threeCardsMatchViewController ()

@end

@implementation threeCardsMatchViewController

- (Deck *)createDeck{
    return [[PlayingDeck alloc] init];
}

- (NSUInteger)numCards{
    return 3;
}

@end
