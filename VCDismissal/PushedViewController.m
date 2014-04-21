//
//  PushedViewController.m
//  VCDismissal
//
//  Created by Adedayo Olumide on 4/20/14.
//  Copyright (c) 2014 Adedayo Olumide. All rights reserved.
//

#import "PushedViewController.h"
#import "PresentedViewControllerTwo.h"

@interface PushedViewController ()

@end

@implementation PushedViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = NO;
    self.title = @"Pushed View Controller";
    DLog(@"view did load");
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dismissAllViewControllers) name:DISMISS_NOTIFICATION object:nil];
    
    NSLog(@"view controlller stack %@",self.navigationController.viewControllers);
}

- (IBAction)presentButtonTapped:(id)sender {
    DLog(@"present button tapped");
    
    if ([self isPresentedTwoInStack]) {
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        PresentedViewControllerTwo *presentedVCTwo = [[UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil] instantiateViewControllerWithIdentifier:@"PresentedViewControllerTwo"];
        UINavigationController *navigationRef = [[UINavigationController alloc] initWithRootViewController:presentedVCTwo];
        navigationRef.navigationBarHidden = NO;
        [self.navigationController presentViewController:navigationRef animated:YES completion:nil];
    }
}

- (BOOL)isPresentedTwoInStack {
    
    for (UIViewController *controller in self.navigationController.viewControllers) {
        if ([controller isKindOfClass:[PresentedViewControllerTwo class]]) {
            return YES;
        }
    }
    return NO;
}

- (void)dismissAllViewControllers {
    DLog(@"dismissing...");
    [self.navigationController popViewControllerAnimated:NO];
}


//Is it modal?
- (BOOL)isModal {
    return self.presentingViewController.presentedViewController == self
    || self.navigationController.presentingViewController.presentedViewController == self.navigationController
    || [self.tabBarController.presentingViewController isKindOfClass:[UITabBarController class]];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
