//
//  ManagerUserInfoWithNSUserDefaults.h
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

@interface ManagerUserInfoWithNSUserDefaults : NSObject

///保存用户名
+(void)saveUserName:(NSString *)userName;

///获取用户名
+(NSString *)getUserName;

///保存用户密码
+(void)savePassWD:(NSString *)passWD;

///获取用户密码
+(NSString *)passWD;

@end
