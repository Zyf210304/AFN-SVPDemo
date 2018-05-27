//
//  YFNetBaseManager.h
//  MonkeyKing
//
//  Created by 亚飞 on 2018/5/23.
//  Copyright © 2018年 paimwin123. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef enum {
    HUDStyle_hidden,
    HUDStyle_normal,
    HUDStyle_noTilte,
}HUDStyle;

@interface YFNetBaseManager : NSObject


+ (instancetype _Nullable )sharedConnect;


/**
 post 请求

 @param name 接口名称
 @param parameters 参数
 @param HUDStyle HUD样式
 @param success 成功返回
 @param failure 失败返回
 */
- (void)postWithPortName:(NSString *_Nullable)name
              parameters:(NSDictionary *_Nullable)parameters
                     hud:(HUDStyle)HUDStyle
                 success:(nullable void (^)(NSURLSessionDataTask * _Nonnull operation, id _Nullable responseObject))success
                 failure:(nullable void (^)(NSURLSessionDataTask * _Nonnull operation, NSError * _Nonnull error))failure;

/**
 get 请求

 @param name 接口名称
 @param parameters 参数
 @param HUDStyle HUD样式
 @param success 成功返回
 @param failure 失败返回
 */
- (void)getWithPortName:(NSString *_Nullable)name
              parameters:(NSDictionary *_Nullable)parameters
                     hud:(HUDStyle)HUDStyle
                 success:(nullable void (^)(NSURLSessionDataTask * _Nonnull operation, id _Nullable responseObject))success
                 failure:(nullable void (^)(NSURLSessionDataTask * _Nonnull operation, NSError * _Nonnull error))failure;

/**
delete 请求

 @param name 接口名称
 @param parameters 参数
 @param HUDStyle HUD样式
 @param success 成功返回
 @param failure 失败返回
 */
- (void)deleteWithPortName:(NSString *_Nullable)name
              parameters:(NSDictionary *_Nullable)parameters
                     hud:(HUDStyle)HUDStyle
                 success:(nullable void (^)(NSURLSessionDataTask * _Nonnull operation, id _Nullable responseObject))success
                 failure:(nullable void (^)(NSURLSessionDataTask * _Nonnull operation, NSError * _Nonnull error))failure;


@end
