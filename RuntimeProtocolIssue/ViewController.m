//
//  ViewController.m
//  RuntimeProtocolIssue
//
//  Created by DaidoujiChen on 2015/4/30.
//  Copyright (c) 2015年 DaidoujiChen. All rights reserved.
//

#import "ViewController.h"

#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self registerClass:@"Daidouji"];
    [self protocolInClass:NSClassFromString(@"Daidouji")];
}

- (void)registerClass:(NSString *)className {
    Class superclass = (Class)objc_getClass("UIViewController");
    Class newClass = objc_allocateClassPair(superclass, [className UTF8String], 0);
    Protocol *newProtocol = objc_allocateProtocol([@"ViewController" UTF8String]);
    objc_registerProtocol(newProtocol);
    class_addProtocol(newClass, newProtocol);
    objc_registerClassPair(newClass);
}

- (void)protocolInClass:(Class)cls {
    unsigned count;
    __unsafe_unretained Protocol **protocols = class_copyProtocolList(cls, &count);
    if (count) {
        NSLog(@"%@", [NSString stringWithUTF8String:protocol_getName(protocols[0])]);
    }
    free(protocols);
}

@end
