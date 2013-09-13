//
//  ViewController.m
//  STActivitiesSample
//
//  Created by Ivan Parfenchuk on 13.09.13.
//  Copyright (c) 2013 Ivan Parfenchuk. All rights reserved.
//

#import "ViewController.h"
#import "STFacebookActivity.h"
#import "STTwitterActivity.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)presentSharingViewController:(id)sender
{
    NSString * sharingText = @"Test text";
    UIActivityViewController * activityVC = [[UIActivityViewController alloc] initWithActivityItems:@[sharingText]
                                                                              applicationActivities:@[[STFacebookActivity new],
                                                                                                      [STTwitterActivity new]]];
    activityVC.excludedActivityTypes = @[UIActivityTypePostToFacebook, UIActivityTypePostToTwitter];
    [self presentViewController:activityVC animated:YES completion:nil];
}

@end
