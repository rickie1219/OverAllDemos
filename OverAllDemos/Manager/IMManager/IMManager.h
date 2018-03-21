//
//  IMManager.h
//  RuiFengPartyBuilding
//
//  Created by Rickie_Lambert on 2018/1/20.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void (^loginBlock)(BOOL success, NSString * des);

/**
 IM服务与管理
 */
@interface IMManager : NSObject

SINGLETON_FOR_HEADER(IMManager);

/**
 初始化IM
 */
-(void)initIM;


/**
 登录IM
 
 @param IMID IM账号
 @param IMPwd IM密码
 @param completion block回调
 */
-(void)IMLogin:(NSString *)IMID IMPwd:(NSString *)IMPwd completion:(loginBlock)completion;

/**
 退出IM
 */
-(void)IMLogout;


@end
