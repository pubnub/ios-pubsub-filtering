//
//  AppDelegate.m
//  PubSubFiltering
//
//  Created by Jordan Zucker on 12/28/15.
//  Copyright © 2015 pubnub. All rights reserved.
//

#import <PubNub/PubNub.h>
#import "AppDelegate.h"

@interface AppDelegate () <PNObjectEventListener>
@property (nonatomic, strong) PubNub *client;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    PNConfiguration *filteringConfiguration = [PNConfiguration configurationWithPublishKey:@"demo-36" subscribeKey:@"demo-36"];
    filteringConfiguration.origin = @"msgfiltering-dev.pubnub.com";
    filteringConfiguration.filterExpression = @"(foo == 'bar')";
    self.client = [PubNub clientWithConfiguration:filteringConfiguration];
    [self.client addListener:self];
    [self.client subscribeToChannels:@[@"test"] withPresence:YES];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - PubNub Helpers

- (void)publishWithMatchingMetadata {
    [self.client publish:@"test" toChannel:@"test" withMetadata:@{@"foo" : @"bar"} withCompletion:^(PNPublishStatus *status) {
        NSLog(@"status: %@", status.debugDescription);
    }];
}

- (void)publishWithNotMatchingMetadata {
    [self.client publish:@"test" toChannel:@"test" withMetadata:@{@"bar" : @"foo"} withCompletion:^(PNPublishStatus *status) {
        NSLog(@"status: %@", status.debugDescription);
    }];
}

#pragma mark - PNObjectEventListener

- (void)client:(PubNub *)client didReceiveMessage:(PNMessageResult *)message {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    NSLog(@"message: %@", message.debugDescription);
}

- (void)client:(PubNub *)client didReceivePresenceEvent:(PNPresenceEventResult *)event {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    NSLog(@"event: %@", event.debugDescription);
}

- (void)client:(PubNub *)client didReceiveStatus:(PNStatus *)status {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    NSLog(@"status: %@", status.debugDescription);
}

@end
