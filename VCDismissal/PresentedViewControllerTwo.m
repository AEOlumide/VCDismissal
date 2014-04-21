//
//  PresentedViewControllerTwo.m
//  VCDismissal
//
//  Created by Adedayo Olumide on 4/20/14.
//  Copyright (c) 2014 Adedayo Olumide. All rights reserved.
//

#import "PresentedViewControllerTwo.h"
#import "PushedViewController.h"

@interface PresentedViewControllerTwo ()

@end

@implementation PresentedViewControllerTwo

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Destination";
    DLog(@"view did load");

}

- (IBAction)dismissButtonTapped:(id)sender {
    DLog(@"Dismiss Button tapped");
    [[NSNotificationCenter defaultCenter] postNotificationName:DISMISS_NOTIFICATION object:self];
    [self dismissViewControllerAnimated:YES completion:nil];
    DLog(@"dismissing...");
}

- (IBAction)pushButtonTapped:(id)sender {
    PushedViewController *pushedVC = [[UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil] instantiateViewControllerWithIdentifier:@"PushedViewController"];

    [self.navigationController pushViewController:pushedVC animated:YES];
}
@end
