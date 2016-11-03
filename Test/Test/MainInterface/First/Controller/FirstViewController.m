//
//  FirstViewController.m
//  Test
//
//  Created by Utopia on 2016/11/3.
//  Copyright © 2016年 Utopia. All rights reserved.
//

#import "FirstViewController.h"
#import "FirstTableViewCell.h"

@interface FirstViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic)UITableView *tableView;
@property (strong, nonatomic)NSMutableArray *tableViewData;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createView];
    [self setAutolayout];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createView{
    self.title = @"First";
    [self.view addSubview:self.tableView];
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}

- (void)setAutolayout{
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (NSMutableArray *)tableViewData{
    if (!_tableViewData) {
        _tableViewData = [NSMutableArray arrayWithObjects:
                          @{
                            @"title": @"ReactiveCocoa"
                            },
                         nil];
        [_tableView registerClass:[FirstTableViewCell class] forCellReuseIdentifier:FirstTableViewCell.tc_identifier];
    }
    
    return _tableViewData;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [FirstTableViewCell cellSize].height;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.tableViewData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:FirstTableViewCell.tc_identifier];
    [cell loadData:self.tableViewData[indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
