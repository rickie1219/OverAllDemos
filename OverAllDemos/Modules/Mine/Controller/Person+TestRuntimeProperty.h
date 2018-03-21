//
//  Person+TestRuntimeProperty.h
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/3/15.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "Person.h"

@interface Person (TestRuntimeProperty)

/** 扩展一个属性： 爱好 */
@property (nonatomic, copy) NSString *hobby;

@end
