//
//  DetailView.m
//  AFNetworkingNew-Test
//
//  Created by RenSihao on 16/1/15.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "DetailView.h"
#import "DetailViewModel.h"

@interface DetailView ()

@property (nonatomic, strong) UILabel         *titleLab;
@property (nonatomic, strong) UITextView      *contentTextView;
@property (nonatomic, strong) DetailViewModel *viewModel;
@end

@implementation DetailView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self addSubview:self.titleLab];
        [self addSubview:self.contentTextView];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}


#pragma mark - publick method

- (void)updateWithDetailViewModel:(DetailViewModel *)detailViewModel
{
    _viewModel = detailViewModel;
    
    self.titleLab.text = _viewModel.teamName;
    self.contentTextView.text = _viewModel.city;
    
}


#pragma mark - lazy load

- (UILabel *)titleLab
{
    if (!_titleLab)
    {
        _titleLab = [UILabel new];
        _titleLab.frame = CGRectMake(10, 10, 100, 40);
        _titleLab.backgroundColor = [UIColor orangeColor];
    }
    return _titleLab;
}
- (UITextView *)contentTextView
{
    if (!_contentTextView)
    {
        _contentTextView = [UITextView new];
        _contentTextView.frame = CGRectMake(10, 100, 100, 40);
        _contentTextView.backgroundColor = [UIColor grayColor];
    }
    return _contentTextView;
}






@end
