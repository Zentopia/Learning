//
//  PresentedViewController.m
//  Test
//
//  Created by Utopia on 2016/11/14.
//  Copyright © 2016年 Utopia. All rights reserved.
//

#import "PresentedViewController.h"

@interface PresentedViewController ()

@property (strong, nonatomic)UIView *subview;
@property (strong, nonatomic) NSURLSession *session;
@property (strong, nonatomic)NSURLSessionDataTask *task;
@property (strong, nonatomic)AFHTTPSessionManager *manager;

@end

@implementation PresentedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationItem];
    
    UIView __strong *view = [UIView new];
    NSLog(@"%p",&view); //0x7fff59c86848
    [self test:&view];
    
    NSString *str = @"你好";

}


-(void)test:(UIView **)view{
    NSLog(@"%p",view); // 0x7fff59c86840
}



//- (void)test{
//    
//    self.manager = [AFHTTPSessionManager manager];
//    [self.manager POST:@"" parameters:@{} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        self.view.backgroundColor = [UIColor redColor];
//    }];
//    
//    self.session = [NSURLSession sharedSession];
//    self.task = [self.session dataTaskWithURL:[NSURL URLWithString:@""]
//            completionHandler:^(NSData *data,
//                                NSURLResponse *response,
//                                NSError *error) {
//                self.view.backgroundColor = [UIColor redColor];
//            
//            }];
//
////    [self.task resume];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setNavigationItem{
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithTitle:NSLocalizedString(@"取消", nil) style:UIBarButtonItemStylePlain target:self action:@selector(leftItemAction:)];
    [self.navigationItem setLeftBarButtonItem:leftItem];
}

- (void)leftItemAction:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)dealloc{

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
