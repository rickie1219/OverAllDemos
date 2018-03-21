//
//  TestGCDViewController.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/3/15.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "TestGCDViewController.h"

@interface TestGCDViewController ()
{
    UIButton *btnTestQueue;
    UIButton *btnTestGCD;
    
    UILabel *lblShowGCD;
    UILabel *lblShowQueue;
    int flag;
}

@end

@implementation TestGCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置标记为1；
    flag = 1;
    
    btnTestGCD = [UIButton buttonWithType:UIButtonTypeCustom];
    btnTestGCD.frame = CGRectMake((self.view.frame.size.width - 280)/2, 80, 280, 50);
    [btnTestGCD setTitle:@"Test GCD" forState:UIControlStateNormal];
    btnTestGCD.backgroundColor = [UIColor orangeColor];
    [btnTestGCD addTarget:self action:@selector(testGCD06) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnTestGCD];
    
    
    btnTestQueue = [UIButton buttonWithType:UIButtonTypeCustom];
    btnTestQueue.frame = CGRectMake((self.view.frame.size.width - 280)/2, CGRectGetMaxY(btnTestGCD.frame)+20, 280, 50);
    [btnTestQueue setTitle:@"Test NSOperation" forState:UIControlStateNormal];
    btnTestQueue.backgroundColor = [UIColor cyanColor];
    [btnTestQueue addTarget:self action:@selector(testNSOperation) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnTestQueue];
    
    
    lblShowGCD = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(btnTestQueue.frame), CGRectGetMaxY(btnTestQueue.frame)+20, btnTestQueue.frame.size.width, 180)];
    lblShowGCD.backgroundColor = [UIColor lightGrayColor];
    lblShowGCD.numberOfLines = 0;
    [self.view addSubview:lblShowGCD];
    
    lblShowQueue = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(lblShowGCD.frame), CGRectGetMaxY(lblShowGCD.frame)+20, lblShowGCD.frame.size.width, 180)];
    lblShowQueue.backgroundColor = [UIColor lightGrayColor];
    lblShowQueue.numberOfLines = 0;
    [self.view addSubview:lblShowQueue];
}


#pragma mark - 一.GCD
- (void)testGCD01
{
    /*
     semaphore
     英 [ˈseməfɔ:(r)]   美 [ˈsɛməˌfɔr, -ˌfor]
     n.
     臂板信号系统，（铁道）臂板信号装置
     vt.& vi.
     发出信号，打旗语
     */
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (int i = 1; i < 10000; i++) {
            // just for delay
        }
        NSLog(@"dispatch_semaphore send");
//        NSString *str = @"dispatch_semaphore send";
//        lblShowGCD.text = [NSString stringWithFormat:@"%@ and %@\n", lblShowGCD.text, str];
        // 这个方法必须要在另一个线程中调用.
        dispatch_semaphore_signal(semaphore);
    });
    
    NSLog(@"waiting...");
//    NSString *strWait = @"waiting...";
//    lblShowGCD.text = [NSString stringWithFormat:@"%@ and %@\n", lblShowGCD.text, strWait];
    // 这个方法一定不能在主线程中调用,因为一不小心就会阻塞当前线程,造成主线程卡死.
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
}

#pragma mark - 二.NSBlockOperation
- (void)testNSOperation
{
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    NSBlockOperation *operation1 = [NSBlockOperation blockOperationWithBlock:^{
       
        for (int i = 1; i < 10000; i++) {
            // just for delay
        }
        NSLog(@"operation1 is finished");
        
        // 在线程里加入UI的操作，会造成延时
//        NSString *str = @"operation1 is finished";
//        lblShowQueue.text = [NSString stringWithFormat:@"%@ and %@\n", lblShowQueue.text, str];
    }];
    
    NSBlockOperation *operation2 = [NSBlockOperation blockOperationWithBlock:^{
        
        for (int i = 1; i < 10000; i++) {
            // just for delay
        }
        
        NSLog(@"operation2 is finished");
        // 在线程里加入UI的操作，会造成延时
//        NSString *str = @"operation2 is finished";
//        lblShowQueue.text = [NSString stringWithFormat:@"%@ and %@\n", lblShowQueue.text, str];
    }];
    
    [operation1 addDependency:operation2];
    [queue addOperation:operation1];
    [queue addOperation:operation2];
    
    // 可以看出operation1添加依赖之后,operation2首先打印完毕,然后打印operation1.
    
}

#pragma mark - 子线程分组任务中任务都完成了，再执行主线程,如：a任务开始执行的前提是b任务执行完成,c任务开始执行需要等a、b两个异步任务完成，即a依赖于b，c又依赖a（a->b, c->a,b）
- (void)testGCD02
{
    // 创建分组
    dispatch_group_t group = dispatch_group_create();
    // 创建队列
    dispatch_queue_t queue = dispatch_queue_create("queue", DISPATCH_QUEUE_CONCURRENT);
    // 1.往分组中添加任务
    dispatch_group_async(group, queue, ^{
        [NSThread sleepForTimeInterval:2];//模拟耗时操作
        NSLog(@"11111 %@", [NSThread currentThread]);
    });
    // 2.往分组中添加任务
    dispatch_group_async(group, queue, ^{
        [NSThread sleepForTimeInterval:1];//模拟耗时操作
        NSLog(@"22222 %@", [NSThread currentThread]);
    });
    
    // 3.往分组中添加任务
    dispatch_group_async(group, queue, ^{
        [NSThread sleepForTimeInterval:3];//模拟耗时操作
        NSLog(@"33333 %@", [NSThread currentThread]);
    });
    
    // 分组中任务完成以后，通知该Block执行, 当所有任务完成以后，再去通知主线程继续执行其他任务
    dispatch_group_notify(group, queue, ^{
        NSLog(@"Finished = %@", [NSThread currentThread]);
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"通知主线程刷新UI %@", [NSThread currentThread]);
        });
    });
    
}

#pragma mark - 然而有时我们的任务一层一层的嵌套了多个Block，这个时候，就应该使用如下代码方式：
- (void)testGCD03
{
    // 创建分组
    dispatch_group_t group = dispatch_group_create();
    // 创建队列
    dispatch_queue_t queue = dispatch_queue_create("queue", DISPATCH_QUEUE_CONCURRENT);
    // 往分组中添加任务
    dispatch_group_async(group, queue, ^{
        void (^task)(void) = ^{
            [NSThread sleepForTimeInterval:2];//模拟耗时操作
            NSLog(@"001_task = %@", [NSThread currentThread]);
        };
        dispatch_async(dispatch_get_global_queue(0, 0), task);
        NSLog(@"001-------------%@", [NSThread currentThread]);
    });
    
    // 往分组中添加任务
    dispatch_group_async(group, queue, ^{
        void (^task)(void) = ^{
            [NSThread sleepForTimeInterval:1];// 模拟耗时操作
            NSLog(@"002_task = %@", [NSThread currentThread]);
        };
        dispatch_async(dispatch_get_global_queue(0, 0), task);
        NSLog(@"002-------------%@", [NSThread currentThread]);
    });
    
    // 分组中任务完成以后，通知该block执行
    dispatch_group_notify(group, queue, ^{
        
        NSLog(@"Finished--------%@", [NSThread currentThread]);
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"通知主线程刷新UI ----- %@", [NSThread currentThread]);
        });
    });
    
    /*
     根据执行结果可以看出，当主线程执行的时候，然而其他两个任务中并没有真正的完成，因为另外两个任务中嵌套了子任务，那问题来了，其他两个任务还没有完成就执行主线程
     001-------------<NSThread: 0x170265d80>{number = 15, name = (null)}
     002-------------<NSThread: 0x170265d80>{number = 15, name = (null)}
     Finished--------<NSThread: 0x170279c80>{number = 16, name = (null)}
     通知主线程刷新UI ----- <NSThread: 0x17006a940>{number = 1, name = main}
     002_task = <NSThread: 0x176274480>{number = 12, name = (null)}
     001_task = <NSThread: 0x170265d80>{number = 15, name = (null)}

     */
}


#pragma mark - group提供了dispatch_group_enter()与dispatch_group_leave()方法来组合运用
- (void)testGCD04
{
    /*
     但是我们需要的是其他两个任务完成才需要执行主线程，别急，group给我们提供了dispatch_group_enter()与dispatch_group_leave()方法来组合运用，值得注意的是，这两个方法一定需要成对使用，要不然有时间又出现一些莫名其妙的bug问题。
     */
    
    // 创建分组
    dispatch_group_t group = dispatch_group_create();
    // 创建队列
    dispatch_queue_t queue = dispatch_queue_create("queue", DISPATCH_QUEUE_CONCURRENT);
    
    // 1.往分组中添加任务
    // 先进入分组中
    dispatch_group_enter(group);
    dispatch_group_async(group, queue, ^{
        // 创建block子任务
        void (^task)(void) = ^{
            [NSThread sleepForTimeInterval:3];// 模拟耗时操作
            NSLog(@"111111111 %@", [NSThread currentThread]);
            // 离开分组任务
            dispatch_group_leave(group);
        };
        
        dispatch_async(dispatch_get_global_queue(0, 0), task);
        NSLog(@"1111-------------%@", [NSThread currentThread]);
    });
    
    // 2.往分组中添加任务
    // 先进入分组中
    dispatch_group_enter(group);
    dispatch_group_async(group, queue, ^{
        // 创建子任务
        void (^task)(void) = ^{
            [NSThread sleepForTimeInterval:1];
            NSLog(@"22222222 %@", [NSThread currentThread]);
            // 离开分组任务
            dispatch_group_leave(group);
        };
        
        dispatch_async(dispatch_get_global_queue(0, 0), task);
        NSLog(@"2222-----------%@", [NSThread currentThread]);
    });
    
    // 分组任务都完成以后，通知该block执行
    dispatch_group_notify(group, queue, ^{
        NSLog(@"Finished-------%@", [NSThread currentThread]);
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"通知主线程刷新UI...%@", [NSThread currentThread]);
        });
    });
    
    /*
     运行结果
     1111-------------<NSThread: 0x171669580>{number = 7, name = (null)}
     2222-----------<NSThread: 0x171669580>{number = 7, name = (null)}
     22222222 <NSThread: 0x171663e00>{number = 8, name = (null)}
     111111111 <NSThread: 0x171669580>{number = 7, name = (null)}
     Finished-------<NSThread: 0x171669580>{number = 7, name = (null)}
     通知主线程刷新UI...<NSThread: 0x170078d80>{number = 1, name = main}
     */
    
}


#pragma mark - 同步、异步操作加入到串行和并行队列里面，执行的顺序和特点：
#pragma mark - 1.同步操作不管加入到何种队列，只会在主线程按顺序执行
- (void)testGCD05
{
    dispatch_queue_t q_serial = dispatch_queue_create("my_serial_queue", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t q_concurrent = dispatch_queue_create("my_concurrent_queue", DISPATCH_QUEUE_CONCURRENT);
    for (int i = 0; i < 5; ++i) {
        dispatch_sync(q_serial, ^{
            NSLog(@"串行队列里的同步任务 %@ %d", [NSThread currentThread], i);
        });
    }
    for (int i = 0; i < 5; ++i) {
        dispatch_sync(q_concurrent, ^{
            NSLog(@"并行队列里的同步任务 %@ %d", [NSThread currentThread], i);
        });
    }
    
    /*
     串行队列里的同步任务 <NSThread: 0x174079c80>{number = 1, name = main} 0
     串行队列里的同步任务 <NSThread: 0x174079c80>{number = 1, name = main} 1
     串行队列里的同步任务 <NSThread: 0x174079c80>{number = 1, name = main} 2
     串行队列里的同步任务 <NSThread: 0x174079c80>{number = 1, name = main} 3
     串行队列里的同步任务 <NSThread: 0x174079c80>{number = 1, name = main} 4
     并行队列里的同步任务 <NSThread: 0x174079c80>{number = 1, name = main} 0
     并行队列里的同步任务 <NSThread: 0x174079c80>{number = 1, name = main} 1
     并行队列里的同步任务 <NSThread: 0x174079c80>{number = 1, name = main} 2
     并行队列里的同步任务 <NSThread: 0x174079c80>{number = 1, name = main} 3
     并行队列里的同步任务 <NSThread: 0x174079c80>{number = 1, name = main} 4
     */
}

#pragma mark - 2.异步操作只在非主线程的线程执行，在串行队列中异步操作会在新建的线程中按顺序执行。
- (void)testGCD06
{
    dispatch_queue_t q_serial = dispatch_queue_create("my_serial_queue", DISPATCH_QUEUE_SERIAL);
    for(int i = 0; i < 5; ++i){
        dispatch_async(q_serial, ^{
            NSLog(@"串行队列 -- 异步任务 %@ %d", [NSThread currentThread], i);
        });
    }
    
    
    dispatch_queue_t q_concurrent = dispatch_queue_create("my_concurrent_queue", DISPATCH_QUEUE_CONCURRENT);
    for(int i = 0; i < 5; ++i){
        dispatch_async(q_concurrent, ^{
            NSLog(@"并行队列 -- 异步任务 %@ %d", [NSThread currentThread], i);
        });
    }
    
    /*
     串行队列 -- 异步任务 <NSThread: 0x175e765c0>{number = 6, name = (null)} 0
     串行队列 -- 异步任务 <NSThread: 0x175e765c0>{number = 6, name = (null)} 1
     串行队列 -- 异步任务 <NSThread: 0x175e765c0>{number = 6, name = (null)} 2
     串行队列 -- 异步任务 <NSThread: 0x175e765c0>{number = 6, name = (null)} 3
     串行队列 -- 异步任务 <NSThread: 0x175e765c0>{number = 6, name = (null)} 4
     并行队列 -- 异步任务 <NSThread: 0x17067d980>{number = 10, name = (null)} 0
     并行队列 -- 异步任务 <NSThread: 0x17067d980>{number = 10, name = (null)} 1
     并行队列 -- 异步任务 <NSThread: 0x17067d980>{number = 10, name = (null)} 2
     并行队列 -- 异步任务 <NSThread: 0x170868940>{number = 9, name = (null)} 3
     并行队列 -- 异步任务 <NSThread: 0x175e765c0>{number = 6, name = (null)} 4
     */
}

#pragma mark - 3.异步操作，并行队列
- (void)testGCD07
{
    
    dispatch_queue_t q_concurrent = dispatch_queue_create("my_concurrent_queue", DISPATCH_QUEUE_CONCURRENT);
    for (int i = 0; i < 5; ++i) {
        dispatch_async(q_concurrent, ^{
            NSLog(@"并行队列 -- 异步任务 %@ %d", [NSThread currentThread], i);
        });
    }
    
    
}

@end
