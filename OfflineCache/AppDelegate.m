//
//  AppDelegate.m
//  OfflineCache
//
//  Created by 黄龙辉 on 14-5-12.
//  Copyright (c) 2014年 黄龙辉. All rights reserved.
//

#import "AppDelegate.h"
#import "UserInfoModel.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    //缓存文件夹
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cacheDirectory = [paths objectAtIndex:0];
    NSString *fullCacheDirectory = [cacheDirectory stringByAppendingPathComponent:@"OfflineCache"];
    //创建可缓存的模型
    UserInfoModel *userInfo = [[UserInfoModel alloc] init];
    userInfo.name = @"huanglonguui";
    userInfo.phoneNumber = @"1234567890";
    userInfo.address = @"fujian Province";
    //归档到文件  需要遵守NSCoding协议
    BOOL archive = [NSKeyedArchiver archiveRootObject:userInfo toFile:fullCacheDirectory];
    //取修改时间
    NSTimeInterval modifyTime = [[[[NSFileManager defaultManager] attributesOfItemAtPath:fullCacheDirectory error:nil] fileModificationDate] timeIntervalSinceNow];
    
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:modifyTime];
    
    NSLog(@"%@", date);
    
    if (archive) {
        //反归档
        id userInfoFromfile = [NSKeyedUnarchiver unarchiveObjectWithFile:fullCacheDirectory];
        NSLog(@"%@", [userInfoFromfile name]);
    }
    
    NSLog(@"verison:%@", [AppDelegate appVersion]);
    
    [self.window makeKeyAndVisible];
    return YES;
}

//从plist取到版本号
+ (NSString *)appVersion{
    
    CFStringRef versStr = (CFStringRef)CFBundleGetValueForInfoDictionaryKey(CFBundleGetMainBundle(), kCFBundleVersionKey);
    
    NSString *version = [NSString stringWithUTF8String:CFStringGetCStringPtr(versStr, kCFStringEncodingMacRoman)];
    
    return version;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
