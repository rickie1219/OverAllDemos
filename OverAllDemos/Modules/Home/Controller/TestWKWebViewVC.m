//
//  TestWKWebViewVC.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/8/21.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "TestWKWebViewVC.h"

#import <WebKit/WebKit.h>
#import <AVFoundation/AVFoundation.h>
#import "WKWebViewJavascriptBridge.h"
#import "SDWebView.h"

@interface TestWKWebViewVC ()<WKNavigationDelegate,WKUIDelegate>

@property (strong, nonatomic) SDWebView *sdWKWebView;
@property (strong, nonatomic) UIProgressView *progressView;
@property WKWebViewJavascriptBridge *webViewBridge;

@end

@implementation TestWKWebViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 调用js的按钮
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"native调用js" style:UIBarButtonItemStylePlain target:self action:@selector(rightClick)];
    // 加个提示按钮
    UIBarButtonItem *btnItemShowMsg = [[UIBarButtonItem alloc]initWithTitle:@"提示" style:UIBarButtonItemStylePlain target:self action:@selector(btnItemShowMsgClick)];
    // 导航栏右边多个按钮
    self.navigationItem.rightBarButtonItems = @[rightItem, btnItemShowMsg];
    
    
    
    // 初始化WKWebView
    [self initWKWebView];
    
    _webViewBridge = [WKWebViewJavascriptBridge bridgeForWebView:self.sdWKWebView];
    [_webViewBridge setWebViewDelegate:self.sdWKWebView];
    
    [self registerNativeFunctions];
    
    [self initProgressView];
    
    [self.sdWKWebView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)initWKWebView
{
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
    configuration.userContentController = [WKUserContentController new];
    
    WKPreferences *preferences = [WKPreferences new];
    preferences.javaScriptCanOpenWindowsAutomatically = YES;
    preferences.minimumFontSize = 30.0;
    configuration.preferences = preferences;
    
    // 判断是否是iPhone X的导航栏
    CGFloat navH = 44;
    if (812 == [UIScreen mainScreen].bounds.size.height) {
        navH = navH + 44;
    } else {
        navH = navH + 20;
    }
    
    
    SDWebView *webView = [[SDWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-navH) configuration:configuration];
    self.sdWKWebView = webView;
    //如果是本地html，用下面方法：
    NSString *urlStr = [[NSBundle mainBundle] pathForResource:@"indexForTestWKWithOCandJS.html" ofType:nil];
    NSString *localHtml = [NSString stringWithContentsOfFile:urlStr encoding:NSUTF8StringEncoding error:nil];
    NSURL *fileURL = [NSURL fileURLWithPath:urlStr];
    [webView loadHTMLString:localHtml baseURL:fileURL];
    //如果是网址，用下面的方法：
    //    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://tbk.xxtapp.cn/test/unitActivity/hybrid.html?s=2"]]];
    webView.UIDelegate = self;
    [self.view addSubview:webView];
}

- (void)initProgressView
{
    CGFloat wkScreenWidth = [[UIScreen mainScreen] bounds].size.width;
    UIProgressView *progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 0, wkScreenWidth, 2)];
    progressView.tintColor = [UIColor redColor];
    progressView.trackTintColor = [UIColor lightGrayColor];
    [self.view addSubview:progressView];
    self.progressView = progressView;
}

- (void)rightClick
{
    //    // 如果不需要参数，不需要回调，使用这个
    //    [_webViewBridge callHandler:@"testJSFunction"];
    //    // 如果需要参数，不需要回调，使用这个
    //    [_webViewBridge callHandler:@"testJSFunction" data:@"一个字符串"];
    // 如果既需要参数，又需要回调，使用这个
    [_webViewBridge callHandler:@"testJSFunction" data:@"native调用js成功" responseCallback:^(id responseData) {
        NSLog(@"调用完JS后的回调：%@",responseData);
    }];
}

- (void)btnItemShowMsgClick
{
    NSString *strMsg = [NSString stringWithFormat:@"利用WKWebView\n1、实现js交互，js调用native,native调用js\n2、实现WebView中的图片浏览功能。点击可以放大。\n3、实现图片长按进行保存功能。\n4、实现了webview中的文字长按copy功能。"];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提醒" message:strMsg preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"-------OK");
    }]];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)dealloc
{
    NSLog(@"%s",__FUNCTION__);
    [self.sdWKWebView removeObserver:self forKeyPath:@"estimatedProgress"];
}

#pragma mark - private method
- (void)registerNativeFunctions
{
    [self registTestOneFunction];
}

- (void)registTestOneFunction
{
    [_webViewBridge registerHandler:@"testOCFunction" handler:^(id data, WVJBResponseCallback responseCallback) {
        // data 的类型与 JS中传的参数有关
        NSDictionary *tempDic =  [self JSONStringToDictionaryWithData:data];;
        // 在这里执行分享的操作
        NSString *title = [tempDic objectForKey:@"title"];
        NSString *content = [tempDic objectForKey:@"content"];
        NSString *url = [tempDic objectForKey:@"url"];
        // 将分享的结果返回到JS中
        NSString *result = [NSString stringWithFormat:@"js调用native成功成功:\ntitle=%@\n,content=%@\n,url=%@",title,content,url];
        responseCallback(result);
    }];
}

- (NSDictionary *)JSONStringToDictionaryWithData:(NSString *)data
{
    NSError * error;
    NSData * dadd = [data dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:dadd options:NSJSONReadingMutableContainers error:&error];
    return dict;
}

#pragma mark - KVO
// 计算wkWebView进度条
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (object == self.sdWKWebView && [keyPath isEqualToString:@"estimatedProgress"]) {
        CGFloat newprogress = [[change objectForKey:NSKeyValueChangeNewKey] doubleValue];
        if (newprogress == 1) {
            [self.progressView setProgress:1.0 animated:YES];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                self.progressView.hidden = YES;
                [self.progressView setProgress:0 animated:NO];
            });
            
        } else {
            self.progressView.hidden = NO;
            [self.progressView setProgress:newprogress animated:YES];
        }
    }
}

#pragma mark - WKNavigationDelegate


#pragma mark - WKUIDelegate
- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提醒" message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        completionHandler();
    }]];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
