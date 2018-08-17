//
//  ManagerUserInfoWithNSUserDefaults.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/8/16.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "ManagerUserInfoWithNSUserDefaults.h"


/*
 作者：Tomous
 链接：https://www.jianshu.com/p/8bf9010ac6e5
 來源：简书
 简书著作权归作者所有，任何形式的转载都请联系作者获得授权并注明出处。
 */

@implementation ManagerUserInfoWithNSUserDefaults

///储存用户名
+(void)saveUserName:(NSString *)userName
{
    NSUserDefaults *name = [NSUserDefaults standardUserDefaults];
    [name setObject:userName forKey:@"userName"];
}


+(NSString *)getUserName
{
    NSUserDefaults *name = [NSUserDefaults standardUserDefaults];
    NSString *str = [name objectForKey:@"userName"];
    return str;
}


///储存用户密码
+(void)savePassWD:(NSString *)passWD
{
    NSUserDefaults *passWord = [NSUserDefaults standardUserDefaults];
    [passWord setObject:passWD forKey:@"passWord"];
}


+(NSString *)passWD
{
    NSUserDefaults *passWord = [NSUserDefaults standardUserDefaults];
    NSString *str = [passWord objectForKey:@"passWord"];
    return str;
}



@end
