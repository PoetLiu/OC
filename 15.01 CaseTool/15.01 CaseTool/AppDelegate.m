//
//  AppDelegate.m
//  15.01 CaseTool
//
//  Created by liuPeng on 16/3/5.
//  Copyright © 2016年 liuPeng. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (id) init
{
    if (nil != (self = [super init])) {
        NSLog(@"init:text %@ / results %@", _textField, _resultsField);
    }
    return (self);
}
- (void) awakeFromNib
{
    NSLog(@"awake: text %@ / results %@", _textField, _resultsField);
    [_textField setStringValue:@"Enter text here"];
    [_resultsField setStringValue:@"Results"];
}
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)uppercae:(id)sender {
    NSString *original  = [_textField stringValue];
    NSString *uppercase = [original uppercaseString];
    [_resultsField setStringValue:uppercase];
}

- (IBAction)lowercase:(id)sender {
    NSString *orignal = [_textField stringValue];
    NSString *lowercase = [orignal lowercaseString];
    [_resultsField setStringValue:lowercase];
}
@end
