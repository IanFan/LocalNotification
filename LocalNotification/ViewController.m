//
//  ViewController.m
//  LocalNotification
//
//  Created by Ian Fan on 27/12/2013.
//  Copyright (c) 2013 Ian Fan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - LocalNotification

-(void)setLocalNotificaitonWithFireDate:(NSDate*)fireDate alertBody:(NSString*)alertBody {
  NSDictionary *infoDict = [NSDictionary dictionaryWithObject:@"someValue" forKey:@"someKey"];
  NSString *alertAction = @"View";
  
  UILocalNotification* localNotification = [[UILocalNotification alloc] init];
  if (localNotification == nil) return;
  
  localNotification.userInfo = infoDict;
  localNotification.fireDate = fireDate;
  localNotification.timeZone = [NSTimeZone defaultTimeZone];
  localNotification.alertBody = alertBody;
  localNotification.alertAction = alertAction;
  localNotification.soundName = UILocalNotificationDefaultSoundName;
  localNotification.applicationIconBadgeNumber = 1;
  
  [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
}

-(void)notificationButtonTapped:(UIButton*)sender {
  NSDate *fireDate = [[NSDate date] dateByAddingTimeInterval:5];
  
  NSString *alertBody = @"Local Notification Works!";
  
  [self setLocalNotificaitonWithFireDate:fireDate alertBody:alertBody];
}

#pragma mark - Setup

-(void)setupLocalNotificaitonButton {
  CGSize winSize = self.view.frame.size;
  CGSize buttonSize = CGSizeMake(300, 50);
  
  UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  button.frame = CGRectMake(0.5*winSize.width-0.5*buttonSize.width, 0.5*winSize.height-0.5*buttonSize.height, buttonSize.width, buttonSize.height);
  [button setTitle:@"Click to trigger a Notification after 5 secs!" forState:UIControlStateNormal];
  [button addTarget:self action:@selector(notificationButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
  [button.titleLabel setFont:[UIFont fontWithName:@"Helvitica" size:20]];
  [button.titleLabel setAdjustsFontSizeToFitWidth:YES];
  
  [self.view addSubview:button];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  
   [self setupLocalNotificaitonButton];
  
  //remember add code in AppDelegate
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
