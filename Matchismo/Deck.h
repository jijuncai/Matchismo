//
//  Deck.h
//  Matchismo
//
//  Created by jijuncai on 4/8/15.
//  Copyright (c) 2015 CS193p. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

// class deck
@interface Deck : NSObject

// public methods
-(Card*)drawRandomCard;
-(void)addCard:(Card*)card atTop:(BOOL)atTop;
-(void)addCard:(Card*)card;

@end
