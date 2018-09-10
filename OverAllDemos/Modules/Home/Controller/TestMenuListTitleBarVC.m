//
//  TestMenuListTitleBarVC.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/9/10.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//


/**
 
 网易接口:
 [
 {
 "URL":"http://c.3g.163.com/nc/article/headline/T1348647909107/0-140.html",
 "dicKey":"T1348647909107",
 "type":"0"
 },
 {
 "URL":"http://c.3g.163.com/nc/article/list/T1348648517839/0-20.html",
 "dicKey":"T1348648517839",
 "type":"1"
 },
 {
 "URL":"http://c.3g.163.com/nc/article/list/T1348649079062/0-20.html",
 "dicKey":"T1348649079062",
 "type":"2"
 },
 {
 "URL":"http://c.3g.163.com/nc/article/list/T1348648756099/0-20.html",
 "dicKey":"T1348648756099",
 "type":"3"
 },
 {
 "URL":"http://c.3g.163.com/nc/article/list/T1348649580692/0-20.html",
 "dicKey":"T1348649580692",
 "type":"4"
 }
 ]
 
 
 网易新闻的亲注意一下, 野哥的5个接口不是连续的, 我标注了一下,
 [
 {
 "URL":"http://c.3g.163.com/nc/article/headline/T1348647909107/0-140.html",  — 热点
 "dicKey":"T1348647909107",
 "type":"0"
 },
 {
 "URL":"http://c.3g.163.com/nc/article/list/T1348648517839/0-20.html", — 娱乐
 "dicKey":"T1348648517839",
 "type":"1"
 },
 {
 "URL":"http://c.3g.163.com/nc/article/list/T1348649079062/0-20.html", — 体育
 "dicKey":"T1348649079062",
 "type":"2"
 },
 {
 "URL":"http://c.3g.163.com/nc/article/list/T1348648756099/0-20.html", — 财经
 "dicKey":"T1348648756099",
 "type":"3"
 },
 {
 "URL":"http://c.3g.163.com/nc/article/list/T1348649580692/0-20.html",  — 科技
 "dicKey":"T1348649580692",
 "type":"4"
 }
 ]
 
 
 1、基类 新建立的viewController和一些新的类，
 
 1、如何看一个新的类
 
 1、先看他得初始化方法
 
 iOS 大神的博客
 http://onevcat.com/#blog 喵神博客
 http://www.cnblogs.com/wendingding/ 文顶顶博客
 http://www.cnblogs.com/kenshincui/ cui神博客
 http://segmentfault.com/a/1190000002435233 唐巧
 
 视频教程网站
 http://edu.csdn.net/courses/o230_s287 csdn 学院 ， 有部分免费的视频不错
 http://open.163.com/movie/2015/2/S/4/MAIKHN60A_MAIOV9HS4.html 斯坦福大学公开课
 http://www.imooc.com/course/list?c=ios 幕客网
 
 */

#import "TestMenuListTitleBarVC.h"

@interface TestMenuListTitleBarVC ()

@end

@implementation TestMenuListTitleBarVC


- (void)viewDidLoad {
    [super viewDidLoad];
    
}


@end
