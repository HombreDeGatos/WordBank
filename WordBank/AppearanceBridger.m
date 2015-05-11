//
//  AppearanceBridger.h
//  WordBank
//
//  Created by Jared Katzman on 5/11/15.
//  Copyright (c) 2015 deGatos. All rights reserved.
//

// AppearanceBridger.m
#import "AppearanceBridger.h"

@implementation AppearanceBridger {
    // Private instance variables
}

+ (void)setUITextFieldAppearance {
    [UITextField appearanceWhenContainedIn:[UISearchBar class],  nil].leftView = nil;
}

@end