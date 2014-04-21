//
//  RootViewController.m
//  VCDismissal
//
//  Created by Adedayo Olumide on 4/20/14.
//  Copyright (c) 2014 Adedayo Olumide. All rights reserved.
//

#import "RootViewController.h"
#import "PresentedViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    DLog(@"view did load");
}

- (IBAction)presentButtonTapped:(id)sender {
    DLog(@"present button tapped");
    
    PresentedViewController *presentedVC = [[UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil] instantiateViewControllerWithIdentifier:@"PresentedViewController"];
    UINavigationController *navigationRef = [[UINavigationController alloc] initWithRootViewController:presentedVC];
    navigationRef.navigationBarHidden = YES;
    [self.navigationController presentViewController:navigationRef animated:YES completion:nil];
}

@end
