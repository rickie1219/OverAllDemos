//
//  ManagerUserInfoWithNSKeyChain.h
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/8/16.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 作者：Tomous
 链接：https://www.jianshu.com/p/8bf9010ac6e5
 來源：简书
 简书著作权归作者所有，任何形式的转载都请联系作者获得授权并注明出处。
 */

/// 导入头文件
#import <Security/Security.h>

@interface ManagerUserInfoWithNSKeyChain : NSObject

///保存
+(void)addKeychainData:(id)data forKey:(NSString *)key;

///获取
+(id)getKeychainDataForKey:(NSString *)key;

///删除
+(void)deleteKeychainDataForKey:(NSString *)key;


@end
