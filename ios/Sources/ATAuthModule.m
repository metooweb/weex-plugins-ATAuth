//
//  ATAuthModule.m
//  WeexPluginTemp
//
//  Created by  on 17/3/14.
//  Copyright © 2017年 . All rights reserved.
//

#import "ATAuthModule.h"
#import <WeexPluginLoader/WeexPluginLoader.h>
#import <ATAuthSDK/ATAuthSDK.h>

@implementation ATAuthModule

WX_PlUGIN_EXPORT_MODULE(ATAuth, ATAuthModule)


WX_EXPORT_METHOD(@selector(checkGatewayVerifyEnable:))
WX_EXPORT_METHOD(@selector(getAuthToken:callback:))

- (BOOL)checkGatewayVerifyEnable:(NSString *)phoneNumber
{
    
    return [TXCommonAuthHandler checkGatewayVerifyEnable:phoneNumber];
}


- (void)getAuthToken:(NSDictionary * _Nonnull)options callback:(WXModuleCallback)callback
{
    
    [TXCommonAuthHandler getAccessCodeWithComplete:^(NSDictionary * resultDic) {
        NSString *resultCode = [resultDic valueForKey:@"resultCode"];
        NSString *accessCode = [resultDic valueForKey:@"accessCode"];
        //NSString *msg = [resultDic valueForKey:@"msg"];
        if (resultCode.length > 0 && [resultCode isEqualToString:@"6666"]  && accessCode.length > 0) {
            // 3.成功，请求业务服务端API，进行认证
            callback(@{@"result":@"success",@"data":accessCode});
        }else {
            // 4.失败，切换到业务方其他的认证方法
            callback(@{@"result":@"failed",@"data":resultDic});
        }
        
    }];
    
    
}



@end
