//
//  JFKeyChainStore.h
//  XMPPOC
//
//  Created by huangpengfei on 2018/5/22.
//  Copyright © 2018年 huangpengfei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JFKeyChainStore : NSObject<NSKeyedArchiverDelegate,NSKeyedUnarchiverDelegate>

+ (BOOL)addData:(id)data forService:(NSString *)service;

+ (id)queryDataWithService:(NSString *)service;

+ (NSMutableDictionary *)keyChainQueryDictionaryWithService:(NSString *)service;

+ (BOOL)updataData:(id)data forService:(NSString *)service;

+(BOOL)deleteDataWithService:(NSString *)service;
@end
