//
//  GameType1ViewController.m
//  Dos
//
//  Created by Arman Aydemir on 7/25/14.
//  Copyright (c) 2014 Arman Aydemir. All rights reserved.
//

#import "GameType1ViewController.h"

@interface GameType1ViewController ()

@end

@implementation GameType1ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
    self.blueButton.backgroundColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:250/255.0 alpha:1.0];
    self.redButton.backgroundColor = [UIColor redColor];
    self.blueButton.titleLabel.font = [UIFont systemFontOfSize: 36];
    self.redButton.titleLabel.font = [UIFont systemFontOfSize: 36];
    self.HighScoreLabel.text = [NSString stringWithFormat:@"%li", (long)[[NSUserDefaults standardUserDefaults] integerForKey:@"Highscore1"]];
    self.retry.hidden = true;
    self.menuButton.hidden = true;
    self.stopCounter = true;
    self.stopFader = true;
    self.blueButton.adjustsImageWhenDisabled = true;
    self.redButton.adjustsImageWhenDisabled = true;
    [self.retry setTitle:@"Retry" forState:UIControlStateNormal];
    [self.menuButton setTitle:@"Menu" forState:UIControlStateNormal];
    [self.retry addTarget:self action:@selector(didRetry) forControlEvents:UIControlEventTouchUpInside];
    [self.blueButton addTarget:self action:@selector(didTapBlue) forControlEvents:UIControlEventTouchUpInside];
    [self.redButton addTarget:self action:@selector(didTapRed) forControlEvents:UIControlEventTouchUpInside];
    [self animateProgressView2];
    [self reset];}


-(void)updateProgressBar
{
    if(self.time >= 1.0f)
    {
        [self.timer invalidate];
        [self failer];
    }
    else
    {
        self.time += 0.01f;
        if (self.stopCounter){
            [self.timerView setProgress:self.time animated:YES];}
    }
}

-(void)animateProgressView2
{
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval: 0.1f target: self selector: @selector(updateProgressBar)
                                                userInfo: nil repeats: YES];
}

- (void)reset
{
    [self preferredStatusBarStyle];
    self.retry.hidden = true;
    self.menuButton.hidden = true;
    self.stopCounter = true;
    self.stopFader = true;
    self.blueButton.backgroundColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:250/255.0 alpha:1.0];
    self.redButton.backgroundColor = [UIColor redColor];
    [self whiteBlack];
    [self changeNum];
    [self streakText];
    self.blueCol1 = 100;
    self.blueCol2 = 100;
    self.blueCol3 = 250;
    
    self.redCol1 = 250;
    self.redCol2 = 0;
    self.redCol3 = 0;
}

- (void)failer
{
    if (self.view.backgroundColor == [UIColor whiteColor]) {
        self.retry.tintColor = [UIColor blackColor];
    }else{
        self.retry.tintColor = [UIColor whiteColor];
        
    }
    if (self.streak >= [[NSUserDefaults standardUserDefaults] integerForKey:@"Highscore1"]){
        [[NSUserDefaults standardUserDefaults] setInteger:self.streak forKey:@"Highscore1"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        self.HighScoreLabel.text = [NSString stringWithFormat:@"%li", (long)[[NSUserDefaults standardUserDefaults] integerForKey:@"Highscore1"]];
    }
    self.stopCounter = false;
    self.retry.hidden = false;
    self.menuButton.hidden = false;
    self.stopFader = false;
    self.streak = 0;
    [self animateRetry];
}

- (void)whiteBlack
{
    int t = arc4random() % 2;
    if (t == 0) {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
        self.view.backgroundColor = [UIColor whiteColor];
        self.streakLabel.textColor = [UIColor blackColor];
        self.blueButton.tintColor = [UIColor whiteColor];
        self.redButton.tintColor = [UIColor whiteColor];
        self.HighScoreLabel.textColor = [UIColor blackColor];
    } else {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
        self.view.backgroundColor = [UIColor blackColor];
        self.streakLabel.textColor = [UIColor whiteColor];
        self.blueButton.tintColor = [UIColor blackColor];
        self.redButton.tintColor = [UIColor blackColor];
        self.HighScoreLabel.textColor = [UIColor whiteColor];
    }
}

- (void)changeNum
{
    
    int b = arc4random() % 26;
    int r = arc4random() % 26;
    
    int b1 = arc4random() % 2;
    int b2 = arc4random() % 2;
    
    if (b1 == 0){
        b = b * -1;
    }
    if (b2 == 0){
        r = r * -1;
    }
    while (b == r){
        r = arc4random() % 26;
        b2 = arc4random() % 2;
        if (b2 == 0){
            r = r * -1;
        }
    }
    
    NSString *blueString = [NSString stringWithFormat:@"%i", b];
    NSString *redString = [NSString stringWithFormat:@"%i", r];
    [self.blueButton setTitle:blueString forState:UIControlStateNormal];
    [self.redButton setTitle:redString forState:UIControlStateNormal];
}

- (void)streakText
{
    self.streakLabel.text = [NSString stringWithFormat:@"Points: %li", (long)self.streak];
}


- (void)didTapBlue
{
    if ([self.retry isHidden ])
    {
        BOOL backgroundIsWhite = self.view.backgroundColor == [UIColor whiteColor];
        BOOL isLarger = [self.blueButton.titleLabel.text integerValue] > [self.redButton.titleLabel.text integerValue];
        if ((backgroundIsWhite && isLarger) || (!backgroundIsWhite && !isLarger)){
            self.streak++;
        }
        [self reset];
    }
}

- (void)didTapRed
{
    if ([self.retry isHidden ])
    {
        BOOL backgroundIsWhite = self.view.backgroundColor == [UIColor whiteColor];
        BOOL isLarger = [self.redButton.titleLabel.text integerValue] > [self.blueButton.titleLabel.text integerValue];
        if ((backgroundIsWhite && isLarger) || (!backgroundIsWhite && !isLarger)){
            self.streak++;
        }
        [self reset];
    }
}

- (void)didRetry{
    self.streak = 0;
    self.stopFader = true;
    [self reset];
}


- (void)animateRetry{
    [self.timerFade invalidate];
    self.timerFade = [NSTimer scheduledTimerWithTimeInterval: 0.05f target: self selector: @selector(updateFader)
                                                    userInfo: nil repeats: YES];
}

- (void)updateFader{
    if (!self.stopFader){
        
        self.blueCol1 = [self colorChanger:self.blueCol1 :0];
        self.blueCol2 = [self colorChanger:self.blueCol2 :0];
        self.blueCol3 = [self colorChanger:self.blueCol3 :1];
        self.redCol1 = [self colorChanger:self.redCol1 :1];
        self.redCol2 = [self colorChanger:self.redCol2 :2];
        self.redCol3 = [self colorChanger:self.redCol3 :2];
        
        self.blueButton.backgroundColor = [UIColor colorWithRed:self.blueCol1/255.0 green:self.blueCol2/255.0 blue:self.blueCol3/255.0 alpha:1.0];
        self.redButton.backgroundColor = [UIColor colorWithRed:self.redCol1/255.0 green:self.redCol2/255.0 blue:self.redCol3/255.0 alpha:1.0];
    }
}

- (NSInteger)colorChanger:(NSInteger)col :(NSInteger)tro{
    BOOL backgroundIsWhite = self.view.backgroundColor == [UIColor whiteColor];
    if (backgroundIsWhite){
        if (tro == 0) {
            return col + ((255-100)/75.0);
        }else if (tro == 1){
            return col + ((255-250)/75.0);
        }else{
            return col + (255/75.0);
        }
    }else{
        if (tro == 0) {
            return col - (100/75.0);
        }else if (tro == 1){
            return col - (250/75.0);
        }else {
            return col;
        }
    }
}


@end
