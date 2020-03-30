//
//  MainViewController.m
//  QQGroup
//
//  Created by 谢鑫 on 2019/5/25.
//  Copyright © 2019 Shae. All rights reserved.
//

#import "MainViewController.h"
#import "GroupCell.h"
#import "GroupModel.h"
#import "FriendModel.h"
#import "GroupHeaderView.h"
@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSArray *groupArray;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"QQ分组"];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self setTableView:[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain]];
    [self.tableView setDataSource:self];
    [self.tableView setDelegate:self];
    [self.tableView registerClass:[GroupCell class] forCellReuseIdentifier:@"GroupCell"];
    [self.tableView registerClass:[GroupHeaderView class] forHeaderFooterViewReuseIdentifier:@"HeaderView"];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.view addSubview:self.tableView];
}
-(NSArray *)groupArray{
    if(!_groupArray){
        NSString *path=[[NSBundle mainBundle]pathForResource:@"qq_group" ofType:@"plist"];
        NSArray *groupArrayFile=[NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *tempArray=[NSMutableArray array];
        for(NSDictionary *dic in groupArrayFile){
            GroupModel *model=[GroupModel modelWithDict:dic];
            [tempArray addObject:model];
        }
        _groupArray=[tempArray copy];
    }
    return _groupArray;
}

#pragma mark -Table view delegate -
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    GroupHeaderView *headerView=[tableView dequeueReusableHeaderFooterViewWithIdentifier:@"HeaderView"];
    GroupModel *groupModel=self.groupArray[section];
    [headerView updateHeaderViewWithModel:groupModel];
    [headerView setOpenHandler:^(BOOL isOpen) {
        groupModel.isOpen=!groupModel.isOpen;
        [tableView reloadData];
        
    }];
    return headerView;
}
#pragma mark -Table view data Source -
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.groupArray.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    GroupModel *model=self.groupArray[section];
    return model.isOpen? model.friends.count:0;
}
-(UITableViewCell *)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GroupCell *cell= [tableView dequeueReusableCellWithIdentifier:@"GroupCell"];
    GroupModel *groupModel=self.groupArray[indexPath.section];
    [cell updateWithFriendModel:groupModel.friends[indexPath.row]];
    return cell ;
}


@end
