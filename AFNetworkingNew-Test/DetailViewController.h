//
//  DetailTableViewController.h
//  AFNetworkingNew-Test
//
//  Created by RenSihao on 16/1/15.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, DetailType){
  
    TeamBasicInfo = 0,     //球队基本信息
    PlayerInfo,            //球员信息
    TeamSessionInfo,       //球队赛程信息
    MatchStatistical,      //比赛技术统计
    MatchDetailStatistical //比赛总技术统计
    
};

@interface DetailViewController : UITableViewController

@property (nonatomic, assign) DetailType type; 
@end
