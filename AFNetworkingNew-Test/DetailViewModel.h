//
//  DetailViewModel.h
//  AFNetworkingNew-Test
//
//  Created by RenSihao on 16/1/15.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DetailViewModel : NSObject

@property (nonatomic, strong) NSString *teamName;
@property (nonatomic, strong) NSString *city;

//... 这里主要添加的是所对应View可能会根据数据的不同，从而动态变化的一些属性
//... 也可以添加一些关于View界面有关的逻辑方法，例如cell的高度计算之类的

/**
 *  工厂方法创建ViewModel
 *
 *  @param teamsInfo <#teamsInfo description#>
 *
 *  @return <#return value description#>
 */
+ (instancetype)viewModelWithTeamsInfo:(NSArray *)teamsInfo;

@end
