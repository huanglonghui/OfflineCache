//
//  UserInfoModel.h
//  OfflineCache
//
//  Created by 黄龙辉 on 14-5-12.
//  Copyright (c) 2014年 黄龙辉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfoModel : NSObject

@property(nonatomic, strong) NSString *name;

@property(nonatomic, strong) NSString *phoneNumber;

@property(nonatomic, strong) NSString *address;

- (void)encodeWithCoder:(NSCoder *)aCoder;

- (id)initWithCoder:(NSCoder *)aDecoder;

@end
