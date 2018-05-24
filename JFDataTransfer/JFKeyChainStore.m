//
//  JFKeyChainStore.m
//  XMPPOC
//
//  Created by huangpengfei on 2018/5/22.
//  Copyright © 2018年 huangpengfei. All rights reserved.
//

#import "JFKeyChainStore.h"
#import "Person.h"
@implementation JFKeyChainStore

+(NSMutableDictionary *)shareKeyChain:(NSMutableDictionary *)dic{
    NSString *perfix = [[[NSBundle mainBundle]infoDictionary]objectForKey:@"AppIdentifierPrefix"];
    NSString *groupString = [NSString stringWithFormat:@"%@com.jf.JFDataTransfer",perfix];
//    NSLog(@"perfix : %@",perfix);
    NSLog(@"groupString : %@",groupString);
    [dic setObject:groupString forKey:(id)kSecAttrAccessGroup];
    return dic;
}

+ (BOOL)addData:(id)data forService:(NSString *)service{
    NSMutableDictionary *dic = [self keyChainQueryDictionaryWithService:service];
    SecItemDelete((CFDictionaryRef)dic);
    [dic setObject:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:(id)kSecValueData];
    OSStatus status = SecItemAdd((CFDictionaryRef)dic, NULL);
    if(status == noErr){
        NSLog(@"存储成功");
        return YES;
    }
    return NO;
}

+ (id)queryDataWithService:(NSString *)service{
    
    id result;
    NSMutableDictionary *keyChainQuery = [self keyChainQueryDictionaryWithService:service];
    [keyChainQuery setObject:(id)kCFBooleanTrue forKey:(id)kSecReturnData];
    [keyChainQuery setObject:(id)kSecMatchLimitOne forKey:(id)kSecMatchLimit];
    CFDataRef keyData = NULL;
    if(SecItemCopyMatching((CFDictionaryRef)keyChainQuery, (CFTypeRef *)&keyData) == noErr){
        @try{
            result = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge NSData *)keyData];
        }
        @catch(NSException *exception){
            NSLog(@"not find");
        }
        @finally{
            
        }
    }
    if(keyData){
        CFRelease(keyData);
    }
    return result;
}

+ (NSMutableDictionary *)keyChainQueryDictionaryWithService:(NSString *)service{
    NSMutableDictionary *keyChainQueryDictaionary = [[NSMutableDictionary alloc]init];
    [keyChainQueryDictaionary setObject:(id)kSecClassGenericPassword forKey:(id)kSecClass];
    [keyChainQueryDictaionary setObject:service forKey:(id)kSecAttrService];
    [keyChainQueryDictaionary setObject:service forKey:(id)kSecAttrAccount];
    keyChainQueryDictaionary = [self shareKeyChain:keyChainQueryDictaionary];
    return keyChainQueryDictaionary;
}

+ (BOOL)updataData:(id)data forService:(NSString *)service{
    
    NSMutableDictionary *dic = [self keyChainQueryDictionaryWithService:service];
    if(!dic){
        return  NO;
    }
    
    NSMutableDictionary *upDic = [NSMutableDictionary dictionaryWithCapacity:10];
    [upDic setObject:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:(id)kSecValueData];
    OSStatus status = SecItemUpdate((CFDictionaryRef)dic, (CFDictionaryRef)upDic);
    if(status == errSecSuccess){
        NSLog(@"更新成功");
        return YES;
    }
    return NO;
}

+(BOOL)deleteDataWithService:(NSString *)service{
    
    NSMutableDictionary *dic = [self keyChainQueryDictionaryWithService:service];
    if(!dic){
        return  NO;
    }
    OSStatus status =  SecItemDelete((CFDictionaryRef)dic);
    if(status == noErr){
        NSLog(@"删除成功");
        return YES;
    }
    return NO;
}

#pragma mark NSKeyedArchiverDelegate

// substitution
- (nullable id)archiver:(NSKeyedArchiver *)archiver willEncodeObject:(id)object{
    NSLog(@"%s",__func__);
    return nil;
}

- (void)archiver:(NSKeyedArchiver *)archiver didEncodeObject:(nullable id)object{
    NSLog(@"%s",__func__);
    
}

// notification
- (void)archiver:(NSKeyedArchiver *)archiver willReplaceObject:(nullable id)object withObject:(nullable id)newObject{
    NSLog(@"%s",__func__);
    
}

- (void)archiverWillFinish:(NSKeyedArchiver *)archiver{
    NSLog(@"%s",__func__);
    
}

- (void)archiverDidFinish:(NSKeyedArchiver *)archiver{
    NSLog(@"%s",__func__);
    
}

@end
