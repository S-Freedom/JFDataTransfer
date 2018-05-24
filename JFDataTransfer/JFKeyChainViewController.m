//
//  JFKeyChainViewController.m
//  JFDataTransger
//
//  Created by huangpengfei on 2018/5/24.
//  Copyright © 2018年 huangpengfei. All rights reserved.
//

#import "JFKeyChainViewController.h"
#import "Person.h"
#import "JFKeyChainStore.h"
@interface JFKeyChainViewController ()

@end

@implementation JFKeyChainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    Person *p = [[Person alloc] init];
    p.name = @"hah";
    p.age = 261;
    p.sex = YES;
    [JFKeyChainStore addData:p forService:@"jeff"];
    Person *per = [JFKeyChainStore queryDataWithService:@"jeff"];
    NSLog(@"per %@",[per description]);
    
    p.name = @"xix111SDFSFSDFSisdfsdfdsfdf";
    p.age = 2322229;
    [JFKeyChainStore updataData:p forService:@"jeff"];
    Person *per2 = [JFKeyChainStore queryDataWithService:@"jeff"];
    NSLog(@"per2 %@",[per2 description]);
    
//    [JFKeyChainStore deleteDataWithService:@"jeff"];
//    
//    Person *per3 = [JFKeyChainStore queryDataWithService:@"jeff"];
//    NSLog(@"per3 %@",[per3 description]);
}

@end
