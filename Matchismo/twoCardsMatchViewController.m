//
//  twoCardsMatchViewController.m
//  Matchismo
//
//  Created by jijuncai on 4/28/15.
//  Copyright (c) 2015 CS193p. All rights reserved.
//

#import "twoCardsMatchViewController.h"
#import "PlayingDeck.h"

@interface twoCardsMatchViewController ()

@end

@implementation twoCardsMatchViewController

- (Deck *)createDeck{
    return [[PlayingDeck alloc] init];
}

- (NSUInteger)numCards{
    return 2;
}

@end
