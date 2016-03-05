//
//  AppDelegate.h
//  15.01 CaseTool
//
//  Created by liuPeng on 16/3/5.
//  Copyright © 2016年 liuPeng. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (weak) IBOutlet NSTextField *textField;
@property (weak) IBOutlet NSTextField *resultsField;

- (IBAction)uppercae:(id)sender;
- (IBAction)lowercase:(id)sender;
@end

