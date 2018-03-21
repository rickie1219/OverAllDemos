//
//  FontAndColorMacros.h
//  RuiFengPartyBuilding
//
//  Created by Rickie_Lambert on 2018/1/19.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#ifndef FontAndColorMacros_h
#define FontAndColorMacros_h




// 导航栏的颜色
#define cNavBgColor             [UIColor colorWithHexString:@"00AE68"]
#define cNavBgFontColor         [UIColor colorWithHexString:@"ffffff"]
#define cItemTitleColorSelected [UIColor colorWithHexString:@"F6000C"]
#define cItemTitleColor         [UIColor colorWithHexString:@"646464"]

//默认页面背景色
#define cViewBgColor            [UIColor colorWithHexString:@"f2f2f2"]

//#define cNavigationBgColor      [UIColor colorWithRed:207/255.0 green:0/255.0 blue:14/255.0 alpha:1.0]
#define cNavigationBgColor      [UIColor colorWithRed:239/255.0 green:65/255.0 blue:17/255.0 alpha:1.0]
//#define cNavigationBgColor      [UIColor colorWithRed:252/255.0 green:76/255.0 blue:127/255.0 alpha:1.0]

// 主题色     #FC4C7F  252,76,127   #FD4D80  253,77,128
#define kMainMenuColor          [UIColor colorWithRed:252/255.0 green:76/255.0 blue:127/255.0 alpha:1.0]

// 颜色定义
// tabBar未选中的标题颜色  #8a8a8a   138，138，138
#define kTabBarDefaultColor     [UIColor colorWithRed:138/255.0 green:138/255.0 blue:138/255.0 alpha:1.0]
// tabBar选中的标题颜色   #ef4111  239，65，17
#define kTabBarSelectedColor    [UIColor colorWithRed:239/255.0 green:65/255.0 blue:17/255.0 alpha:1.0]
//#define kTabBarSelectedColor    [UIColor colorWithRed:252/255.0 green:76/255.0 blue:127/255.0 alpha:1.0]

// 灰色的背景色
#define kViewBgDefaultColor     [UIColor colorWithRed:83/255.0 green:83/255.0 blue:83/255.0 alpha:1.0]


// 透明色
#define kClearColor             [UIColor clearColor]
// 白色
#define kWhiteColor             [UIColor whiteColor]
// 黑色
#define kBlackColor             [UIColor blackColor]
// 灰色(常规)
#define kGrayColor              [UIColor grayColor]
// 浅灰色
#define kGray2Color             [UIColor lightGrayColor]
// 蓝色
#define kBlueColor              [UIColor blueColor]
// 红色
#define kRedColor               [UIColor redColor]
// 随机色 //随机色生成
#define kRandomColor            KRGBColor(arc4random_uniform(256)/255.0,arc4random_uniform(256)/255.0,arc4random_uniform(256)/255.0)

//字体
// 加粗了的字体大小
#define BOLDSYSTEMFONT(FONTSIZE)    [UIFont boldSystemFontOfSize:FONTSIZE]
// 正常字体的大小
#define SYSTEMFONT(FONTSIZE)        [UIFont systemFontOfSize:FONTSIZE]
// 字体类型和字体大小
#define FONT(NAME, FONTSIZE)        [UIFont fontWithName:(NAME) size:(FONTSIZE)]




#endif /* FontAndColorMacros_h */
