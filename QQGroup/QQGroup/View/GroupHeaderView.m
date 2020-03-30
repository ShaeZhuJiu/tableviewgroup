//
//  GroupHeaderView.m
//  QQGroup
//
//  Created by 谢鑫 on 2019/5/27.
//  Copyright © 2019 Shae. All rights reserved.
//

#import "GroupHeaderView.h"

@implementation GroupHeaderView

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithReuseIdentifier:reuseIdentifier];
    if(self){
        [self setHeaderButton:[HeaderButton buttonWithTarget:self action:@selector(headerButtonClicked:)]];
        [self.contentView addSubview:self.headerButton];
    }
    return self;
}
-(void)updateHeaderViewWithModel:(GroupModel *)model{
    [self.headerButton setTitle:[NSString stringWithFormat:@"%@ (%@)",model.title,model.online] forState:UIControlStateNormal];
    if(model.isOpen){
        [self.headerButton.imageView setTransform:CGAffineTransformMakeRotation(M_PI_2)];
    }
    else{
        [self.headerButton.imageView setTransform:CGAffineTransformIdentity];
    }
    _isOpen=!model.isOpen;
}
#pragma mark -Actions -
-(void)headerButtonClicked:(HeaderButton*)sender{
    self.openHandler(!_isOpen);
}
@end
