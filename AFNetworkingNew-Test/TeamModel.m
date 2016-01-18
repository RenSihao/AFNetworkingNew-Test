//
//  TeamModel.m
//  AFNetworkingNew-Test
//
//  Created by RenSihao on 16/1/15.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "TeamModel.h"
/**
 error_code 	int 	返回码
 reason 	string 	返回原因
 result 	string 	返回内容
 
 team_id 	int 	球队ID
 team_name 	string 	球队名
 all_name 	string 	球队全名
 city 	string 	球队主场所在城市
 gymnasium 	string 	球馆
 coach 	string 	教练
 logo 	string 	球队logo地址
 info 	string 	简介
 */

/**
 "team_id": 18,
 "team_name": "青岛雄鹰",
 "all_name": "青岛双星雄鹰",
 "city": "青岛",
 "gymnasium": "国信体育馆",
 "coach": "巩晓彬",
 "logo": "http://www.cba.gov.cn/cbastats/adm/cbadata/pic/201012714280.jpg",
 "info": ""
 */

@implementation TeamModel

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init])
    {
        _teamID = [[dict valueForKey:@"team_id"] integerValue];
        _teamName = [dict valueForKey:@"team_name"];
        _teamAllName = [dict valueForKey:@"all_name"];
        _city = [dict valueForKey:@"city"];
        _gymnasium = [dict valueForKey:@"gymnasium"];
        _coach = [dict valueForKey:@"coach"];
        _logo = [dict valueForKey:@"logo"];
        _info = [dict valueForKey:@"info"];
    }
    return self;
}

@end
