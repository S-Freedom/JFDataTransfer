//
//  Person.h
//  XMPPOC
//
//  Created by huangpengfei on 2018/5/3.
//  Copyright © 2018年 huangpengfei. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface Person : NSObject <NSCopying,NSMutableCopying,NSCoding>

@property(copy, nonatomic) NSString *name;
@property(strong, nonatomic) NSString *addr;
@property(assign, nonatomic) NSUInteger age;
@property(assign, nonatomic) BOOL sex;

- (void)eat;
- (void)walkWithSpeed:(float)speed;
- (Boolean)isChildWithAge:(NSInteger)age;
@end
