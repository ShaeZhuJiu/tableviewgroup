//
//  GroupModel.m
//  QQGroup
//
//  Created by 谢鑫 on 2019/5/25.
//  Copyright © 2019 Shae. All rights reserved.
//

#import "GroupModel.h"
#import "FriendModel.h"
@implementation GroupModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
}

- (void)setFriends:(NSArray *)friends{
    NSMutableArray *tempArray=[NSMutableArray array];
    for(NSDictionary *dataDict in friends){
        FriendModel *model=[[FriendModel alloc]init];
        [model setValuesForKeysWithDictionary:dataDict];
        [tempArray addObject:model];
    }
    _friends=[tempArray copy];
}
+(instancetype)modelWithDict:(NSDictionary *)dict{
    GroupModel *model=[[GroupModel alloc] init];
    [model setValuesForKeysWithDictionary:dict];
    return model;
}
@end
