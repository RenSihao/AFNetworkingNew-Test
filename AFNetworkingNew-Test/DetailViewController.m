//
//  DetailTableViewController.m
//  AFNetworkingNew-Test
//
//  Created by RenSihao on 16/1/15.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "DetailViewController.h"
#import "DetailDataController.h"
#import "DetailView.h"
#import "DetailViewModel.h"

@interface DetailViewController ()

@property (nonatomic, strong) DetailDataController *dataController; //所有的数据通过这个类来获取、处理、操作、加工
@property (nonatomic, strong) NSMutableDictionary *viewModels; //储存所有子View的ViewModel，可以是数组也可以是字典
@property (nonatomic, strong) DetailView *detailView;  //子View
@end

@implementation DetailViewController

#pragma mark - life cycle

- (instancetype)init
{
    if (self = [super init])
    {
        //
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //ViewController 基本上只需要两步
    //1、加载子View
    [self setUpSubViews];
    
    //2、生成ViewModel并给子View装配ViewModel
    [self initSubViewModels];
    
    
}

#pragma mark - public method

- (void)setType:(DetailType)type
{
    _type = type;
    switch (_type) {
        case TeamBasicInfo:
        {
            [self.dataController fetchTeamBasicInfo];
        }
            break;
        case PlayerInfo:
        {
            [self.dataController fetchPlayerInfoWithTeamID:10];
        }
            break;
        case TeamSessionInfo:
        {
            [self.dataController fetchTeamSessionInfoWithTeamID:10];
        }
            break;
        case MatchStatistical:
        {
            [self.dataController fetchMatchStatisticalWithMatchID:10];
        }
            break;
        case MatchDetailStatistical:
        {
            [self.dataController fetchMatchDetailStatisticalWithMatchID:10];
        }
            break;
        default:
            break;
    }
}

#pragma mark - private method
/**
 *  加载子View
 */
- (void)setUpSubViews
{

    [self.view addSubview:self.detailView];
}
/**
 *  通过block回调方式获取 DataController 返回的数据 生成ViewModel 然后装配给View
 */
- (void)initSubViewModels
{
    __weak typeof(self) weakSelf= self;
    
    //处理来自 DataController 回调的数据
    [self.dataController setSuccessBlock:^(id returnValue, DetailType type){
        
        switch (type) {
            case TeamBasicInfo:
            {
                //储存数据
                [weakSelf.viewModels setValue:returnValue forKey:@"TeamBasicInfo"];
                //取出数据并生成ViewModels
                DetailViewModel *viewModel = [DetailViewModel viewModelWithTeamsInfo:weakSelf.viewModels[@"TeamBasicInfo"]];
                //对应装配
                [weakSelf.detailView updateWithDetailViewModel:viewModel];
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
    }];
    
    
    [self.dataController setFailureBlock:^(id failureValue, DetailType type){
        
        //获取失败了...
        
    }];
}





#pragma mark - lazy load

- (DetailView *)detailView
{
    if (!_detailView)
    {
        _detailView = [[DetailView alloc] init];
    }
    return _detailView;
}
- (DetailDataController *)dataController
{
    if (!_dataController)
    {
        _dataController = [[DetailDataController alloc] init];
    }
    return _dataController;
}






















@end
