//
//  ViewController.m
//  JFDataTransger
//
//  Created by huangpengfei on 2018/5/24.
//  Copyright © 2018年 huangpengfei. All rights reserved.
//

#define KScreenW  [UIScreen mainScreen].bounds.size.width
#define KScreenH  [UIScreen mainScreen].bounds.size.height

#import "ViewController.h"
#import "JFKeyChainViewController.h"
#import "JFPasteboardViewController.h"
#import "JFDocumentInteractioViewController.h"
#import "JFSocketViewController.h"
@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray<NSString *> *dataArr;

@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.dataArr addObject:@"Pasteboard"];
    [self.dataArr addObject:@"JFKeyChainStore"];
    [self.dataArr addObject:@"UIDocumentInteractionController"];
    [self.dataArr addObject:@"local socket"];
//    [self.dataArr addObject:@""];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KScreenW, KScreenH) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 44;
    self.tableView.separatorColor = [UIColor blackColor];
    [self.view addSubview:self.tableView];
    
}

#pragma mark --UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        NSString *str = [self.dataArr objectAtIndex:indexPath.row];
        cell.textLabel.text = str;
    }
    return cell;
}

#pragma mark --UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:{
            JFPasteboardViewController *pastebordVC = [[JFPasteboardViewController alloc] init];
            [self.navigationController pushViewController:pastebordVC animated:YES];
        }
            
            break;
        case 1:{
            JFKeyChainViewController *keychainVC = [[JFKeyChainViewController alloc] init];
            [self.navigationController pushViewController:keychainVC animated:YES];
        }
            
            break;
        case 2:{
            JFDocumentInteractioViewController *documentVC = [[JFDocumentInteractioViewController alloc] init];
            [self.navigationController pushViewController:documentVC animated:YES];
        }
            
            break;
        case 3:{
            JFSocketViewController *socketVC = [[JFSocketViewController alloc] init];
            [self.navigationController pushViewController:socketVC animated:YES];
        }
            break;
        default:
            break;
    }
}

- (NSMutableArray<NSString *> *)dataArr{
    if(!_dataArr){
        _dataArr = [NSMutableArray arrayWithCapacity:5];
    }
    return _dataArr;
}
@end
