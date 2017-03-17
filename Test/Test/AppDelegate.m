//
//  AppDelegate.m
//  Test
//
//  Created by Utopia on 2016/10/25.
//  Copyright © 2016年 Utopia. All rights reserved.
//

#import "AppDelegate.h"
#import "UTNavigationController.h"
#import "UTTabBarController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "ImageHelper.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self createKeyWindow];
    [self loadViewControllers];
    [self simulateFor];
    [self print];
//    [self test];
    
    
    return YES;
}

- (void)simulateFor{
    NSInteger i;
    i ^= i;
    
L4: i++;
    
    if (i < 10) goto L4;
    
    
}

- (void)test{
    
  
    for (NSInteger i = 0; i<20; i++) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            //            [arrayMU addObject:a];
            //            [WYBtn testMMM:arrayMU];
            NSArray *aar =  [ImageHelper test:[NSString stringWithFormat:@"%ld", i]];
//            NSLog(@"%@",aar);
        });
    }
}

- (void)print{
    
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:100];
    NSString *filePath = [[self getPath] stringByAppendingPathComponent:@"utopia.text"];
    
    [[NSFileManager defaultManager]createFileAtPath:filePath contents:nil attributes:nil];
    NSFileHandle* fileHandle = [NSFileHandle fileHandleForWritingAtPath:filePath];
    
    NSLog(@"%@", filePath);
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (NSInteger i = 1; i < 54; i++) {
            
            NSString *str = [NSString stringWithFormat:@"课时 %ld \n", i];
            [fileHandle writeData:[str dataUsingEncoding:NSUTF8StringEncoding]];//这样就相当于按-a方式写入
            [fileHandle seekToEndOfFile];//将读写指针设置在文件末尾
        }
    });

    
    // 数组写入文件执行的方法
//    [array writeToFile:filePath atomically:YES];
    
    
    NSString *resultStr = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"resultStr is %@", resultStr);
    
    // 从文件中读取数据数组的方法
//    NSArray *resultArr = [NSArray arrayWithContentsOfFile:filePath];
//    NSLog(@"%@", resultArr[1]);
    
    
}

- (NSString *)getPath{
    // 获取Documents目录
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    
    // 获取tmp目录
    NSString *tmpPath = NSTemporaryDirectory();
    
    // 获取Library目录
    NSString *libPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
    
    // 获取Library/Caches目录
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    
    // 获取Library/Preferences目录
    NSString *prePath = [NSSearchPathForDirectoriesInDomains(NSPreferencePanesDirectory, NSUserDomainMask, YES) lastObject];
    //通常情况下，Preferences由系统维护，我们很少去操作TA
    
    // 获取应用程序包的路径
    NSString *path = [NSBundle mainBundle].resourcePath;
    
    return docPath;
}

- (void)createKeyWindow{
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
}

- (void)loadViewControllers{
    UTViewController *firstViewController = [[FirstViewController alloc] init];
    UIViewController *firstNavigationController = [[UTNavigationController alloc]
                                                   initWithRootViewController:firstViewController];
    
    UTViewController *secondViewController = [[SecondViewController alloc] init];
    UIViewController *secondNavigationController = [[UTNavigationController alloc]
                                                    initWithRootViewController:secondViewController];
    
    UTViewController *thirdViewController = [[ThirdViewController alloc] init];
    UIViewController *thirdNavigationController = [[UTNavigationController alloc]initWithRootViewController:thirdViewController];
    
    UTTabBarController *tabBarController = [[UTTabBarController alloc] init];
    
    [self customizeTabBarForController:tabBarController];
    
    [tabBarController setViewControllers:@[
                                           firstNavigationController,
                                           secondNavigationController,
                                           thirdNavigationController,
                                           ]];
  
    self.window.rootViewController = tabBarController;
    
}

- (void)customizeTabBarForController:(UTTabBarController *)tabBarController {
    
    NSDictionary *dict1 = @{
                            CYLTabBarItemTitle : NSLocalizedString(@"First", nil),
                            CYLTabBarItemImage : @"bus_situation_deselect",
                            CYLTabBarItemSelectedImage : @"bus_situation_select",
                            };
    NSDictionary *dict2 = @{
                            CYLTabBarItemTitle : NSLocalizedString(@"Second", nil),
                            CYLTabBarItemImage : @"order_deselect",
                            CYLTabBarItemSelectedImage : @"order_select",
                            };
    
    NSDictionary *dict3 = @{
                            CYLTabBarItemTitle : NSLocalizedString(@"Third", nil),
                            CYLTabBarItemImage : @"res_manage_deselect",
                            CYLTabBarItemSelectedImage : @"res_manage_select",
                            };
    
    NSArray *tabBarItemsAttributes = @[ dict1, dict2, dict3];
    tabBarController.tabBarItemsAttributes = tabBarItemsAttributes;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"Test"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
