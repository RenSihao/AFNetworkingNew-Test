//
//  TeamModel.h
//  AFNetworkingNew-Test
//
//  Created by RenSihao on 16/1/15.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import <Foundation/Foundation.h>

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

@interface TeamModel : NSObject

@property (nonatomic, assign) NSInteger teamID;
@property (nonatomic, strong) NSString *teamName;
@property (nonatomic, strong) NSString *teamAllName;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *gymnasium;
@property (nonatomic, strong) NSString *coach;
@property (nonatomic, strong) NSString *logo;
@property (nonatomic, strong) NSString *info;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
