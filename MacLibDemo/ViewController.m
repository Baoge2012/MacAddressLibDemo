//
//  ViewController.m
//  MacLibDemo
//
//  Created by Mingbao on 9/23/16.
//  Copyright © 2016 mb. All rights reserved.
//

#import "ViewController.h"
#import "MBMac.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *macButton;

@property (strong, nonatomic) MBMac *mac;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _mac = [[MBMac alloc] initWithHost: nil];
    [_macButton addTarget: self action: @selector(onTap) forControlEvents: UIControlEventTouchUpInside];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onTap
{
    _macButton.enabled = NO;
    __weak typeof(self) weakSelf = self;
    [_mac addCompleteCallback:^(MBMac *mac, NSString *macAddr, NSTimeInterval time) {
        [weakSelf.macButton setTitle: macAddr forState: UIControlStateNormal];
        weakSelf.macButton.enabled = YES;
    }];
    [_mac addFailedCallback:^(MBMac *mac, NSError *error) {
        [weakSelf.macButton setTitle: @"没有获取到Mac地址" forState: UIControlStateNormal];
        weakSelf.macButton.enabled = YES;
        
    }];
    [_mac sync];
}



@end
