//
//  AppDelegate.m
//  FizzBuzz
//
//  Created by Dan Clawson on 3/22/15.
//  Copyright (c) 2015 Slacker Tools. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    for (int x = 1; x < 101; x++) {
        BOOL buzzed = [self isBuzzed:x];
        BOOL fizzed = [self isFizzed:x];
        
        if (buzzed && !fizzed) {
            NSLog(@"Buzz");
        } else if (fizzed && !buzzed) {
            NSLog(@"Fizz");
        } else if (buzzed && fizzed) {
            NSLog(@"FizzBuzz");
        } else {
            NSLog(@"%d", x);
        }
    }
    
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

- (BOOL) isBuzzed: (NSInteger) input {
    // If a number is a multiple of 3 or contains the digit 3 return true, otherwise return false
    
    if (input % 3 == 0) {
        return TRUE;
    } else if ([self checkForDigitAsCharInString:input charToFind:'3']) {
        return TRUE;
    } else {
        return FALSE;
    }
}


- (BOOL) isFizzed: (NSInteger) input {
    // If a number is a multiple of 5 or contains the digit 5 return true, otherwise return false
    
    BOOL digitCheck = [self checkForDigitAsCharInString:input charToFind:'5'];
    
    if (input % 5 == 0) {
        return TRUE;
    } else if (digitCheck) {
        return TRUE;
    } else {
        return FALSE;
    }
}

- (BOOL) checkForDigitAsCharInString: (NSInteger) input
             charToFind: (char) checkItem {
    
    // Convert integer input to its string representation
    NSString *inputAsString = [@(input) stringValue];
    
    // Flag for a positive match
    BOOL found = FALSE;
    
    for (NSInteger i = 0; i < inputAsString.length; i++) {
        char sample = [inputAsString characterAtIndex:i];

        if (sample == checkItem) {
            found = TRUE;
            
            // Shortcut this loop, we found it and can stop looking
            i = inputAsString.length;
        }
    }
    
    return found;
}
@end
