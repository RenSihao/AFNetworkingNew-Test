//
//  DetailDataController.h
//  AFNetworkingNew-Test
//
//  Created by RenSihao on 16/1/15.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DetailViewController.h"


typedef void(^SuccessFetchBlock)(id returnValue, DetailType type);
typedef void(^FailureFetchBlock)(id failureValue, DetailType type);


@interface DetailDataController : NSObject


@property (nonatomic, copy) SuccessFetchBlock successBlock;
@property (nonatomic, copy) FailureFetchBlock failureBlock;

@property (nonatomic, strong) NSMutableArray *teamsInfo; //存放所有球队基本信息
@property (nonatomic, strong) NSMutableArray *playersInfo; //存放所有球员信息


/**
 *  获取球队基本信息
 */
- (void)fetchTeamBasicInfo;
/**
 *  获取球员信息
 *
 *  @param teamID 球队ID
 */
- (void)fetchPlayerInfoWithTeamID:(int)teamID;
/**
 *  获取球队赛程信息
 *
 *  @param teamID 球队ID
 */
- (void)fetchTeamSessionInfoWithTeamID:(int)teamID;
/**
 *  获取单场比赛技术统计
 *
 *  @param matchID 比赛ID
 */
- (void)fetchMatchStatisticalWithMatchID:(int)matchID;
/**
 *  获取单场比赛总技术统计
 *
 *  @param matchID 比赛ID
 */
- (void)fetchMatchDetailStatisticalWithMatchID:(int)matchID;
/**
 *  发起网络请求
 *
 *  @param parameters 请求的信息种类模块
 *  @param parameters 请求的附加参数
 */
- (void)fetchDataWithType:(DetailType)type parametersDic:(NSDictionary *)parametersDic;


@end
