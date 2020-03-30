//
//  GroupHeaderView.h
//  QQGroup
//
//  Created by 谢鑫 on 2019/5/27.
//  Copyright © 2019 Shae. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeaderButton.h"
#import "GroupModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface GroupHeaderView : UITableViewHeaderFooterView
@property (nonatomic,strong) HeaderButton *headerButton;
@property (nonatomic,assign,readonly)BOOL isOpen;
@property (nonatomic,copy)void (^openHandler)(BOOL isOpen);
-(void)updateHeaderViewWithModel:(GroupModel*)model;
@end

NS_ASSUME_NONNULL_END
