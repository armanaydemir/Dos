//
//  GameType1ViewController.h
//  Dos
//
//  Created by Arman Aydemir on 7/25/14.
//  Copyright (c) 2014 Arman Aydemir. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameType1ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *streakLabel;

@property (weak, nonatomic) IBOutlet UIButton *blueButton;

@property (weak, nonatomic) IBOutlet UIButton *redButton;

@property (weak, nonatomic) IBOutlet UIButton *retry;

@property (weak, nonatomic) IBOutlet UIButton *menuButton;

@property (weak, nonatomic) IBOutlet UIProgressView *timerView;

@property (weak, nonatomic) IBOutlet UILabel *HighScoreLabel;

@property (weak, nonatomic) NSTimer *timer;

@property (weak, nonatomic) NSTimer *timerFade;

@property (nonatomic) BOOL stopCounter;

@property (nonatomic) float time;

@property (nonatomic) NSInteger redCol1;

@property (nonatomic) NSInteger redCol2;

@property (nonatomic) NSInteger redCol3;

@property (nonatomic) NSInteger blueCol1;

@property (nonatomic) NSInteger blueCol2;

@property (nonatomic) NSInteger blueCol3;

@property (nonatomic) BOOL stopFader;

@property (weak, nonatomic) NSDate *startDate;

@property (nonatomic) NSInteger streak;

@end
