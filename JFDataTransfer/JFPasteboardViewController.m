//
//  JFPasteboardViewController.m
//  JFDataTransger
//
//  Created by huangpengfei on 2018/5/24.
//  Copyright © 2018年 huangpengfei. All rights reserved.
//

#import "JFPasteboardViewController.h"
#import "Masonry.h"
@interface JFPasteboardViewController ()
@property (nonatomic, strong) UILabel *textLabel;
@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UIButton *btn;
@end

@implementation JFPasteboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [[UIButton alloc] init];
    [btn setTitle:@"paste" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    self.btn = btn;
    [self.view addSubview:btn];
    
    UILabel *lable = [[UILabel alloc] init];
    lable.font = [UIFont systemFontOfSize:14.0f];
    lable.text = @"test";
    lable.layer.borderColor = [UIColor blackColor].CGColor;
    lable.layer.borderWidth = 0.5f;
    lable.numberOfLines = 0;
    self.textLabel = lable;
    [self.view addSubview:lable];
    
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.layer.borderColor = [UIColor blackColor].CGColor;
    imgView.layer.borderWidth = 0.5f;
    self.imgView = imgView;
    [self.view addSubview:imgView];
}

- (void)viewDidLayoutSubviews{
    
    CGFloat width = (KScreenW - 20)* 0.5;
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(64);
        make.width.mas_equalTo(width);
        make.height.mas_equalTo(300);
    }];
    
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(64);
        make.width.mas_equalTo(width);
        make.height.mas_equalTo(300);
    }];
    
    [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-50);
        make.centerX.mas_equalTo(0);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(50);
    }];
}

- (void)btnClick{
    UIPasteboard *pasteBorard = [UIPasteboard generalPasteboard];
    self.imgView.image  = [pasteBorard image];
    self.textLabel.text  = [pasteBorard string];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
