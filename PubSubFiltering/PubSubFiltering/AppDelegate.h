//
//  AppDelegate.h
//  PubSubFiltering
//
//  Created by Jordan Zucker on 12/28/15.
//  Copyright © 2015 pubnub. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

- (void)publishWithMatchingMetadata;
- (void)publishWithNotMatchingMetadata;


@end

