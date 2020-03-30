//
//  GroupCell.h
//  QQGroup
//
//  Created by 谢鑫 on 2019/5/25.
//  Copyright © 2019 Shae. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FriendModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface GroupCell : UITableViewCell
@property (nonatomic,strong)UIImageView  *avatarImageView;
@property (nonatomic,strong)UILabel *titleLabel;
@property (nonatomic,strong)UILabel *subtitleLabel;

-(void)updateWithFriendModel:(FriendModel *)model;
@end

NS_ASSUME_NONNULL_END
