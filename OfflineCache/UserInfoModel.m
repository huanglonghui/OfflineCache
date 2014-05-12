//
//  UserInfoModel.m
//  OfflineCache
//
//  Created by 黄龙辉 on 14-5-12.
//  Copyright (c) 2014年 黄龙辉. All rights reserved.
//

#import "UserInfoModel.h"

@implementation UserInfoModel

- (id)initWithCoder:(NSCoder *)aDecoder{
    
    if ([super init]) {
        
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.address = [aDecoder decodeObjectForKey:@"address"];
        self.phoneNumber = [aDecoder decodeObjectForKey:@"phoneNumber"];
    }

    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.address forKey:@"address"];
    [aCoder encodeObject:self.phoneNumber forKey:@"phoneNumber"];
}

@end
