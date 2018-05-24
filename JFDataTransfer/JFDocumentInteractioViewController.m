//
//  JFDocumentInteractioViewController.m
//  JFDataTransger
//
//  Created by huangpengfei on 2018/5/24.
//  Copyright © 2018年 huangpengfei. All rights reserved.
//

#import "JFDocumentInteractioViewController.h"

@interface JFDocumentInteractioViewController () <UIDocumentInteractionControllerDelegate>
@property (nonatomic, strong) UIDocumentInteractionController *document;
@end

@implementation JFDocumentInteractioViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"111" ofType:@"pdf"];
    NSURL *url = [NSURL fileURLWithPath:path];
    self.document = [UIDocumentInteractionController interactionControllerWithURL:url];
    self.document.delegate = self;
    //    [self.document presentOpenInMenuFromRect:self.view.bounds inView:self.view animated:YES];
    [self.document presentOptionsMenuFromRect:self.view.bounds inView:self.view animated:YES];
}


#pragma mark UIDocumentInteractionControllerDelegate
- (UIViewController *)documentInteractionControllerViewControllerForPreview:(UIDocumentInteractionController *)controller{
    NSLog(@"%s",__func__);
    return self;
}

- (CGRect)documentInteractionControllerRectForPreview:(UIDocumentInteractionController *)controller{
    NSLog(@"%s",__func__);
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    return CGRectMake(0, height - 300, width, 300);
}

- (nullable UIView *)documentInteractionControllerViewForPreview:(UIDocumentInteractionController *)controller{
    NSLog(@"%s",__func__);
    return self.view;
}

- (void)documentInteractionControllerWillBeginPreview:(UIDocumentInteractionController *)controller{
    
    NSLog(@"%s",__func__);
}

- (void)documentInteractionControllerDidEndPreview:(UIDocumentInteractionController *)controller{
    
    NSLog(@"%s",__func__);
}

- (void)documentInteractionControllerWillPresentOptionsMenu:(UIDocumentInteractionController *)controller{
    
    NSLog(@"%s",__func__);
}

- (void)documentInteractionControllerDidDismissOptionsMenu:(UIDocumentInteractionController *)controller{
    
    NSLog(@"%s",__func__);
}

- (void)documentInteractionControllerWillPresentOpenInMenu:(UIDocumentInteractionController *)controller{
    
    NSLog(@"%s",__func__);
}

- (void)documentInteractionControllerDidDismissOpenInMenu:(UIDocumentInteractionController *)controller{
    
    NSLog(@"%s",__func__);
}

- (void)documentInteractionController:(UIDocumentInteractionController *)controller willBeginSendingToApplication:(nullable NSString *)application{
    NSLog(@"%s",__func__);
    
}

- (void)documentInteractionController:(UIDocumentInteractionController *)controller didEndSendingToApplication:(nullable NSString *)application{
    NSLog(@"%s",__func__);
    
}

@end
