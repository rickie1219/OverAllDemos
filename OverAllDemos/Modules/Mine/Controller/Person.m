//
//  Person.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/3/15.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "Person.h"

@implementation Person

- (NSString *)description
{
    NSArray *keys = @[@"name", @"age"];
    
    return [self dictionaryWithValuesForKeys:keys].description;
}

- (NSString *)debugDescription
{
    NSArray *keys = @[@"name", @"age"];
    return [NSString stringWithFormat:@"<class:%@ isa:%p\n keys and values:%@", [self class], self, [self dictionaryWithValuesForKeys:keys].description];
}


- (Person *)run
{
    NSLog(@"%s", __FUNCTION__);
    NSLog(@"run....");
    return self;
}

- (Person *)eat
{
    NSLog(@"%s", __FUNCTION__);
    NSLog(@"eat....");
    return self;
}


- (Person *(^)())runBlock
{
    return ^ {
        NSLog(@"runBlock....");
        return self;
    };
}

- (Person *(^)())eatBlock
{
    return ^ {
        NSLog(@"eatBlock.....");
        return self;
    };
}

- (Person *(^)(NSString *))eatBlockParameter
{
    return ^ (NSString *food) {
        NSLog(@"eat food .... %@", food);
        return self;
    };
}

- (Person *(^)(double))runBlockParamerter
{
    return ^ (double distance) {
        NSLog(@"run distance .... %.2f", distance);
        return self;
    };
}

@end
