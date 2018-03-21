//
//  ShareManager.h
//  RuiFengPartyBuilding
//
//  Created by Rickie_Lambert on 2018/1/20.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 分享 相关服务
 */
@interface ShareManager : NSObject

//单例
SINGLETON_FOR_HEADER(ShareManager)


/**
 展示分享页面
 */
- (void)showShareView;

@end
