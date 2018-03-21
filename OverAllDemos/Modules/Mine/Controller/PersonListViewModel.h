//
//  PersonListViewModel.h
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/3/19.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import <Foundation/Foundation.h>


#import "Person.h"
#import "Person+TestRuntimeProperty.h"

/// 列表数据模型，负责加载数据（包含网络数据/本地缓存数据）
@interface PersonListViewModel : NSObject

/// 联系人数组
@property (nonatomic) NSMutableArray <Person *> *personList;

/// 加载联系人数组
- (void)loadPerson;


@end
