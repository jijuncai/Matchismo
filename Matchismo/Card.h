//
//  Card.h
//  Matchismo
//
//  Created by jijuncai on 4/8/15.
//  Copyright (c) 2015 CS193p. All rights reserved.
//

#import <Foundation/Foundation.h>
// class card
@interface Card : NSObject

// public properties
@property (strong, nonatomic) NSString *contents;
@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;

// public method
- (int)match:(NSArray *)otherCards;

@end
