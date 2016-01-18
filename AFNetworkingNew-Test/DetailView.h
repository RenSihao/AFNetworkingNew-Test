//
//  DetailView.h
//  AFNetworkingNew-Test
//
//  Created by RenSihao on 16/1/15.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewModel;

/**
 View 只需要做好两件事
 1、定义好接收ViewModel的接口（用来更新自身UI展示）
 2、定义好自身对外的回调（类似UI触摸、按钮点击），我这里选择block方式
 */

typedef void(^DetailBlock)(id returnValue);

@interface DetailView : UIView

@property (nonatomic, copy) DetailBlock block; 

/**
 *  接收ViewModel
 *
 *  @param detailViewModel 来自外界的ViewModel
 */
- (void)updateWithDetailViewModel:(DetailViewModel *)detailViewModel;
@end
