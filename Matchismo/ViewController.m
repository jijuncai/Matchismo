//
//  ViewController.m
//  Matchismo
//
//  Created by jijuncai on 4/8/15.
//  Copyright (c) 2015 CS193p. All rights reserved.
//

#import "ViewController.h"
#import "PlayingDeck.h"
#import "CardMatchingGame.h"

@interface ViewController ()

// private properties
@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *progressLabel;
@property (nonatomic) NSUInteger numCard;

@end

@implementation ViewController

- (CardMatchingGame *)game{
    if(!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck] matchnumber:[self numCards]];
    return _game;
}

- (NSUInteger)numCards{ //abstract
    return 0;
}

- (Deck *)createDeck{ // abstract
    return nil;
}

- (IBAction)touchCardButton:(UIButton *)sender{
    NSUInteger chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
}

- (IBAction)redeal:(UIBarButtonItem *)sender {
    _game = nil; // lazy reset a new game
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d",0]; // set default
    self.progressLabel.text = @"Progress Stats"; // set default
    [self updateUI];
}

- (void)updateUI{
    for (UIButton *cardButton in self.cardButtons) {
        NSUInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    [self.scoreLabel setText:[NSString stringWithFormat:@"Score: %ld", (long)self.game.score]];
    if (self.game.resultString) self.progressLabel.text = self.game.resultString; // check nil
}

- (NSString *)titleForCard:(Card *)card{
    return card.isChosen ? card.contents : @"";
}

- (UIImage *)backgroundImageForCard:(Card *)card{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}

@end
