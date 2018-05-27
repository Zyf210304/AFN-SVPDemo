//
//  YFNetBaseManager.m
//  MonkeyKing
//
//  Created by 亚飞 on 2018/5/23.
//  Copyright © 2018年 paimwin123. All rights reserved.
//

#import "YFNetBaseManager.h"
#import "AFNetworking.h"
#import <SVProgressHUD.h>


static NSString *ServerAddress = @"http://app.mhw001.com/version-1/";

@interface YFNetBaseManager ()

@property (nonatomic ,strong) AFHTTPSessionManager *sessionManager;

@end

@implementation YFNetBaseManager





- (void)postWithPortName:(NSString *)name parameters:(NSDictionary *)parameters hud:(HUDStyle)HUDStyle success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success failure:(void (^)(NSURLSessionDataTask * _Nonnull, NSError * _Nonnull))failure {

    [self setHUDState:HUDStyle];

    NSString *urlStr = [ServerAddress stringByAppendingString:name];
    urlStr=[urlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];


    [self.sessionManager POST:urlStr parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (HUDStyle != HUDStyle_hidden) {
            [SVProgressHUD dismiss];
        }
        success(task, responseObject);
        NSLog(@"thread = %@",[NSThread currentThread]);

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (HUDStyle != HUDStyle_hidden) {
            [SVProgressHUD dismiss];
        }
        NSLog(@"Error = %@",error);
        failure(task, error);
    }];

}

- (void)getWithPortName:(NSString *)name parameters:(NSDictionary *)parameters hud:(HUDStyle)HUDStyle success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success failure:(void (^)(NSURLSessionDataTask * _Nonnull, NSError * _Nonnull))failure {

    [self setHUDState:HUDStyle];

    NSString *urlStr = [ServerAddress stringByAppendingString:name];
    urlStr=[urlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];


    [self.sessionManager GET:urlStr parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (HUDStyle != HUDStyle_hidden) {
            [SVProgressHUD dismiss];
        }
        success(task, responseObject);
        NSLog(@"thread = %@",[NSThread currentThread]);

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (HUDStyle != HUDStyle_hidden) {
            [SVProgressHUD dismiss];
        }
        NSLog(@"Error = %@",error);
        failure(task, error);
    }];

}

- (void)deleteWithPortName:(NSString *)name parameters:(NSDictionary *)parameters hud:(HUDStyle)HUDStyle success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success failure:(void (^)(NSURLSessionDataTask * _Nonnull, NSError * _Nonnull))failure {

    [self setHUDState:HUDStyle];

    NSString *urlStr = [ServerAddress stringByAppendingString:name];
    urlStr=[urlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];

    [self.sessionManager DELETE:urlStr parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (HUDStyle != HUDStyle_hidden) {
            [SVProgressHUD dismiss];
        }
        success(task, responseObject);
        NSLog(@"thread = %@",[NSThread currentThread]);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (HUDStyle != HUDStyle_hidden) {
            [SVProgressHUD dismiss];
        }
        NSLog(@"Error = %@",error);
        failure(task, error);
    }];

}


#pragma mark    Singleton

+ (instancetype)sharedConnect{

    return [[super alloc] init];
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{

    static YFNetBaseManager *netConnect = nil;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        netConnect = [super allocWithZone:zone];
        netConnect.sessionManager = [AFHTTPSessionManager manager];
        //        netConnect.sessionManager.requestSerializer = [AFHTTPRequestSerializer serializer];
        netConnect.sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/plain",@"text/html", nil];
        netConnect.sessionManager.requestSerializer.timeoutInterval = 50;
    });

    return netConnect;
}

#pragma mark     SVProgressHUD
- (void)setHUDState:(HUDStyle)HUDStyle {
    if (HUDStyle == HUDStyle_hidden) {
        return;
    }
    if (HUDStyle == HUDStyle_normal) {
        [SVProgressHUD showWithStatus:@"载入中..."];
    }
    if (HUDStyle == HUDStyle_noTilte) {
        [SVProgressHUD show];
    }
}
@end
