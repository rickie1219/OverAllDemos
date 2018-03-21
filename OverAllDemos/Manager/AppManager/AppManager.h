//
//  AppManager.h
//  RuiFengPartyBuilding
//
//  Created by Rickie_Lambert on 2018/1/20.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 包含应用层的相关服务
 */
@interface AppManager : NSObject

#pragma mark ————— APP启动接口 —————
+(void)appStart;

#pragma mark ————— FPS 监测 —————
+(void)showFPS;

@end
