//
//  DetailDataController.m
//  AFNetworkingNew-Test
//
//  Created by RenSihao on 16/1/15.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "DetailDataController.h"
#import "TeamModel.h"
#import "PlayerModel.h"

@interface DetailDataController ()


@end

@implementation DetailDataController

- (instancetype)init
{
    if (self = [super init])
    {
        //
        
    }
    return self;
}

/**
 *  获取球队基本信息
 */
- (void)fetchTeamBasicInfo
{
    
    return [self fetchDataWithType:TeamBasicInfo parametersDic:nil];
}
/**
 *  获取球员信息
 *
 *  @param teamID 球队ID
 */
- (void)fetchPlayerInfoWithTeamID:(int)teamID
{
    return [self fetchDataWithType:PlayerInfo parametersDic:@{@"team_id":@(teamID)}];
}
/**
 *  获取球队赛程信息
 *
 *  @param teamID 球队ID
 */
- (void)fetchTeamSessionInfoWithTeamID:(int)teamID
{
    return [self fetchDataWithType:TeamSessionInfo parametersDic:@{@"team_id":@(teamID)}];
}
/**
 *  获取单场比赛技术统计
 *
 *  @param matchID 比赛ID
 */
- (void)fetchMatchStatisticalWithMatchID:(int)matchID
{
    return [self fetchDataWithType:MatchStatistical parametersDic:@{@"match_id":@(matchID)}];
}
/**
 *  获取单场比赛总技术统计
 *
 *  @param matchID 比赛ID
 */
- (void)fetchMatchDetailStatisticalWithMatchID:(int)matchID
{
    return [self fetchDataWithType:MatchStatistical parametersDic:@{@"match_id":@(matchID)}];
}
/**
 *  发起网络请求
 *
 *  @param parameters 请求的信息种类模块
 *  @param parameters 请求的附加参数
 */
- (void)fetchDataWithType:(DetailType)type parametersDic:(NSDictionary *)parametersDic
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setObject:APP_KEY forKey:@"key"];
    
    NSString *urlString = [NSString string];
    
    NSString *teamID = [NSString string];
    NSString *matchID = [NSString string];
    
    if (parametersDic)
    {
        teamID = [parametersDic objectForKey:@"team_id"];
        matchID = [parametersDic objectForKey:@"match_id"];
        
        if (teamID.length > 0)
        {
            [parameters setValue:teamID forKey:@"team_id"];
            //球员信息
            if (type == PlayerInfo)
            {
                urlString = @"http://v.juhe.cn/cba/playersInfo.php";
            }
            //球队赛程信息
            if (type == TeamSessionInfo)
            {
                urlString = @"http://v.juhe.cn/cba/schedule.php";
            }
        }
        if (matchID.length > 0)
        {
            [parameters setValue:matchID forKey:@"match_id"];
            //比赛技术统计
            if (type == MatchStatistical)
            {
                urlString = @"http://v.juhe.cn/cba/technical_statistics.php";
            }
            //比赛总技术统计
            if (type == MatchDetailStatistical)
            {
                urlString = @"http://v.juhe.cn/cba/technical_statistics_all.php";
            }
        }
        
    }
    //球队基本信息
    else
    {
        urlString = @"http://v.juhe.cn/cba/teamList.php";
    }
    
    //发起请求
    [manager GET:urlString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        //
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //
        
        NSLog(@"json==>%@", responseObject);
        
        NSArray *result = [responseObject valueForKey:@"result"];
        
        switch (type) {
            case TeamBasicInfo:
            {
                //遍历数组，每一个元素都是一个字典，都可以生成一个TeamModel
                [result enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    
                    TeamModel *model = [[TeamModel alloc] initWithDictionary:obj];
                    [self.teamsInfo addObject:model];
                }];
                //回调上层，一个已经封装好的数组，每一个元素都是一个TeamModel
                if (self.successBlock)
                {
                    self.successBlock(self.teamsInfo, TeamBasicInfo);
                }
            }
                break;
            case PlayerInfo:
            {
                
            }
                break;
            case TeamSessionInfo:
            {
                
            }
                break;
            case MatchStatistical:
            {
                
            }
                break;
            case MatchDetailStatistical:
            {
                
            }
                break;
                
            default:
                break;
        }
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //
        
        NSLog(@"error==>%@", error);
        //回调block
        
    }];
    
}


- (NSMutableArray *)teamsInfo
{
    if (!_teamsInfo)
    {
        _teamsInfo = [NSMutableArray array];
    }
    return _teamsInfo;
}









@end
