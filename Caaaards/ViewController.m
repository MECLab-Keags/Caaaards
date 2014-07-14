//
//  ViewController.m
//  Caaaards
//
//  Created by Keagan Soakell-Ho on 7/07/14.
//  Copyright (c) 2014 MtEden CodeLab. All rights reserved.
//

#import "ViewController.h"
#import "Models/PlayingCard.h"
#import "Models/PlayingCardDeck.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;

@property (nonatomic) BOOL isFaceShowing;
@property (nonatomic) int flipsCount;

@property (strong, nonatomic) PlayingCardDeck *deck;

@end

@implementation ViewController

- (PlayingCardDeck *)deck
{
    if (!_deck)
        _deck = [[PlayingCardDeck alloc] init];
    
    return _deck;
}

- (void)setFlipsCount:(int)flipsCount
{
    _flipsCount = flipsCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", flipsCount];
}

- (IBAction)touchCardButton:(UIButton *)sender
{
    if (self.isFaceShowing == YES) {
        [sender setTitle:@"" forState:UIControlStateNormal];
        [sender setBackgroundImage:[UIImage imageNamed:@"CardBack_Blue"]
                          forState:UIControlStateNormal];
        
        self.isFaceShowing = NO;
    } else {
        Card *card = [self.deck drawRandomCard];
        PlayingCard *randomCard = (PlayingCard *) card;
        
        [sender setTitle:randomCard.contents forState:UIControlStateNormal];
        [sender setBackgroundImage:nil
                          forState:UIControlStateNormal];
        
        self.isFaceShowing = YES;
        self.flipsCount++;
    }
}

@end
