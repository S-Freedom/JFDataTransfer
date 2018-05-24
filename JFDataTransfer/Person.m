//
//  Person.m
//  XMPPOC
//
//  Created by huangpengfei on 2018/5/3.
//  Copyright © 2018年 huangpengfei. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)eat{
    NSLog(@"eating...");
}

- (void)walkWithSpeed:(float)speed{
    NSLog(@"正在以%f速度行走",speed);
}

- (Boolean)isChildWithAge:(NSInteger)age{
    BOOL flag = NO;
    if(age >= 18){
        flag = YES;
    }
    NSString *str = flag ? @"已经":@"没有";
    NSLog(@"%@成年",str);
    return flag;
}

- (id)copyWithZone:(NSZone *)zone{
    
    Person *person = [[[self class] allocWithZone:zone] init];
    person.name = self.name;
    return  self;
}

- (id)mutableCopyWithZone:(NSZone *)zone{
    Person *person = [[[self class] allocWithZone:zone] init];
    person.name = self.name;
    return  self;
}

#pragma mark NSCoding编码协议，一个对象实现了NSCoding协议方法，才能被转换成为二进制数据。
//编码方法，当对象被编码成二进制数据时调用。
-(void)encodeWithCoder:(NSCoder *)aCoder {
    //在编码方法中，需要对对象的每一个属性进行编码。
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeInteger:_age forKey:@"age"];
    [aCoder encodeBool:_sex forKey:@"sex"];
}

//解码方法，当把二进制数据转成对象时调用。
-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    //如果父类也遵守NSCoding协议，那么需要写self = [super initWithCoder]
    self = [super init];
    if (self) {
        _name = [[aDecoder decodeObjectForKey:@"name"] copy];
        _age = [aDecoder decodeIntegerForKey:@"age"];
        _sex = [aDecoder decodeBoolForKey:@"sex"];
    }
    return self;
}

//description  NSLog输出时显示的内容
-(NSString *)description {
    return [NSString stringWithFormat:@"姓名:%@,年龄:%ld,性别:%@",_name,(long)_age,_sex?@"男":@"女"];
}

@end
