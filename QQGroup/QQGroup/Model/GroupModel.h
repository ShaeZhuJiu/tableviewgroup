//
//  GroupModel.h
//  QQGroup
//
//  Created by 谢鑫 on 2019/5/25.
//  Copyright © 2019 Shae. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GroupModel : NSObject

@property (nonatomic,copy)NSArray *friends;
@property (nonatomic,copy)NSString *online;
@property (nonatomic,copy)NSArray *title;
@property (nonatomic,assign)BOOL isOpen;
+(instancetype)modelWithDict:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
