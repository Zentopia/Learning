//
//  FirstViewController.m
//  Test
//
//  Created by Utopia on 2016/11/3.
//  Copyright © 2016年 Utopia. All rights reserved.
//

#import "FirstViewController.h"
#import "FirstTableViewCell.h"
#import "ReactiveCocoaViewController.h"
#import "UTLocationSearchViewController.h"
#import "PresentedViewController.h"
#import <objc/runtime.h>
#import "OFGetSubclassesHelper.h"
#import "EOCPerson.h"
#import <objc/runtime.h>

static void *EOCMyAlertViewKey = "EOCMyAlertViewKey";
static void *EOCMyAlertViewBackKey = "EOCMyAlertViewBackKey";


@interface FirstViewController ()<UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate>

@property (strong, nonatomic)UITableView *tableView;
@property (strong, nonatomic)NSMutableArray *tableViewData;
@property (strong, nonatomic)NSMutableArray *titleArray;

@end

@implementation FirstViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self createView];
    [self setAutolayout];
    [self testRetainString];
    
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void)testRetainString{
    NSMutableString *someName = [NSMutableString stringWithString:@"Apple"];
    
    EOCPerson *person = [EOCPerson new];
    person.firstName = someName;
    [someName setString:@"Google"];
//    someName = [NSMutableString stringWithString:@"Google"];
    
    NSMutableDictionary *dic = [@{@"key": @"value"} mutableCopy];
    person.testDic = dic;
    
    [dic setValue:@"newValue" forKey:@"key"];
    
    NSArray *ad = [@[@"s", @"ss"]mutableCopy];
}

- (void)getSubClass{
    NSLog(@"%@", [OFGetSubclassesHelper getAllSubclassesOfClass:[UIViewController class]]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createView{
    [self.view addSubview:self.tableView];
}

- (void)initData{
    self.title = @"First";
    self.titleArray = [NSMutableArray arrayWithObjects:@"ReactiveCocoa", @"LocationSearch", @"PresentNavigationController", @"运行时获取某个类的全部子类", @"Associated Objects", nil];
    [self reloadTableViewDataWithTitleArray:self.titleArray];
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        [_tableView registerClass:[FirstTableViewCell class] forCellReuseIdentifier:[FirstTableViewCell tc_identifier]];
    }
    return _tableView;
}

- (void)setAutolayout{
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)reloadTableViewDataWithTitleArray:(NSMutableArray *)titleArray{
    
    NSMutableArray *tmpArray = [NSMutableArray arrayWithCapacity:100];
    for (NSInteger i = 0; i < titleArray.count; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        FirstTableViewCellConfigItem *item = [FirstTableViewCellConfigItem new];
        item.indexPath = indexPath;
        item.title = titleArray[i];
        [tmpArray addObject:item];
    }
    self.tableViewData = tmpArray;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [FirstTableViewCell cellSize].height;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.tableViewData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    FirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[FirstTableViewCell tc_identifier] forIndexPath:indexPath];
    [cell loadData:self.tableViewData[indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
            [self.navigationController pushViewController:[ReactiveCocoaViewController new] animated:YES];
            break;
        case 1:
            [self.navigationController pushViewController:[UTLocationSearchViewController new] animated:YES];
            break;
        case 2:
            [self presentViewController];
            break;
        case 3:
            [self getSubClass];
        case 4:
            [self associatedObjects];
        default:
            break;
    }
}

- (void)associatedObjects{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Question" message:@"What do you what to do?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Continue", nil];
    
    void(^block)(NSInteger) = ^(NSInteger buttonIndex){
        if (buttonIndex == 0) {
            //do cancel
        }else{
            //do continue
        }
    };
    
    objc_setAssociatedObject(alert, EOCMyAlertViewKey, block, OBJC_ASSOCIATION_COPY);
    objc_setAssociatedObject(block, EOCMyAlertViewBackKey, alert, OBJC_ASSOCIATION_ASSIGN);
    
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    void(^block)(NSInteger) = objc_getAssociatedObject(alertView, EOCMyAlertViewKey);
    block(buttonIndex);
    
    UIAlertView *getAlertView = objc_getAssociatedObject(block, EOCMyAlertViewBackKey);
    
}

- (void)presentViewController{
    PresentedViewController *vc = [PresentedViewController new];
    vc.view.backgroundColor = [UIColor whiteColor];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:^{
        
    }];
}

+ (NSArray *)getAllSubclassesOfClass:(Class)aClass{
    Class *classCache = NULL;
    
    //获取已在运行时注册的全部 Class数目
    int numOfClasses = objc_getClassList(NULL, 0);
    
    //
    NSMutableArray *classArray = [NSMutableArray array];
    
    if (numOfClasses > 0) {
        classCache = (Class *)malloc(sizeof(Class) * numOfClasses);
        numOfClasses = objc_getClassList(classCache, numOfClasses);
        for (int i = 0; i < numOfClasses; ++i) {
            Class currentClass = classCache[i];
            if (currentClass) {
                if ([self isClass:currentClass subclassOfClass:aClass]) {
                    //在获取含大量子类的父类的全部子类时，下面这行代码是CPU的性能瓶颈
                        [classArray addObject:currentClass];
                }
            }
        }
        free(classCache);

    }
    return [NSArray arrayWithArray:classArray];

}

+ (BOOL)isClass:(const Class)subclass subclassOfClass:(const Class)aClass
 {
          if (!subclass || !aClass || subclass == aClass)
              {
                     return NO;
                 }
          Class tempClass = subclass;
         while (tempClass && tempClass != aClass)
              {
                    //这里不能使用isSubclassOfClass:，因为tempClass不一定为NSObject。
                    tempClass = class_getSuperclass(tempClass);
                }
        BOOL isSubclass = (tempClass == aClass);
         return isSubclass;
}

- (void)dealloc{
    NSLog(@"FirstViewController dealloc");
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
