//
//  ViewController.m
//  PubSubFiltering
//
//  Created by Jordan Zucker on 12/28/15.
//  Copyright © 2015 pubnub. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, weak) IBOutlet UIButton *publishMatchingButton;
@property (nonatomic, weak) IBOutlet UIButton *publishNotMatchingButton;
- (IBAction)publishNotMatchingButtonTapped:(id)sender;
- (IBAction)publishMatchingButtonTapped:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI Actions

- (IBAction)publishMatchingButtonTapped:(id)sender {
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [delegate publishWithMatchingMetadata];
}

- (IBAction)publishNotMatchingButtonTapped:(id)sender {
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [delegate publishWithNotMatchingMetadata];
}

@end
