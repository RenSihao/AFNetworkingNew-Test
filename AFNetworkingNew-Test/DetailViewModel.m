//
//  DetailViewModel.m
//  AFNetworkingNew-Test
//
//  Created by RenSihao on 16/1/15.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "DetailViewModel.h"
#import "TeamModel.h"

@implementation DetailViewModel

+ (instancetype)viewModelWithTeamsInfo:(NSArray *)teamsInfo
{
    DetailViewModel *viewModel = [[DetailViewModel alloc] init];
    
    //取出第一只球队的信息
    TeamModel *teamModel = teamsInfo[0];
    viewModel.teamName = teamModel.teamName;
    viewModel.city = teamModel.city;
    
    return viewModel;
}

@end
