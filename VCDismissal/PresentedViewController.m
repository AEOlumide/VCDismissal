//
//  PresentedViewController.m
//  VCDismissal
//
//  Created by Adedayo Olumide on 4/20/14.
//  Copyright (c) 2014 Adedayo Olumide. All rights reserved.
//

#import "PresentedViewController.h"
#import "PushedViewController.h"

@interface PresentedViewController ()
@property (nonatomic, assign) BOOL receiveDismissdNotif;
@end

@implementation PresentedViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    DLog(@"view loaded");
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dismissAllViewControllers) name:DISMISS_NOTIFICATION object:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (self.receiveDismissdNotif) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (IBAction)pushButtonTapped:(id)sender {
    DLog(@"push button tapped");
    PushedViewController *pushedVC = [[UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil] instantiateViewControllerWithIdentifier:@"PushedViewController"];
    [self.navigationController pushViewController:pushedVC animated:YES];
}

- (IBAction)dismissButtonTapped:(id)sender {
    DLog(@"dismiss button tapped");
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)dismissAllViewControllers {
    DLog(@"dismissing...");
//    [self dismissViewControllerAnimated:YES completion:nil];
    self.receiveDismissdNotif = YES;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
