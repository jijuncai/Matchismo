//
//  ViewController.h
//  Matchismo
//
//  Created by jijuncai on 4/8/15.
//  Copyright (c) 2015 CS193p. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"

@interface ViewController : UIViewController

- (Deck *)createDeck; // abstract
- (NSUInteger)numCards; // abstract

@end

