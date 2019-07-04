//
//  ViewController.m
//  ExchangeMethodDemo
//
//  Created by Jamesholy on 2019/7/4.
//  Copyright © 2019 Jamesholy. All rights reserved.
//

#import "ViewController.h"
#import "TestModel.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    TestModel *model = [TestModel new];
    [model instanceMethod];
    [TestModel classMethod];
}


@end
