//
//  UTLocationSearchViewController.m
//  Test
//
//  Created by Utopia on 2016/11/11.
//  Copyright © 2016年 Utopia. All rights reserved.
//

#import "UTLocationSearchViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import <AddressBook/AddressBook.h>
#import "LocationSearchTableViewCell.h"

@interface UTLocationSearchViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic)MKMapView *mapView;
@property (strong, nonatomic)MKLocalSearch *localSearch;
@property (strong, nonatomic)MKLocalSearchRequest *localSearchRequest;
@property (strong, nonatomic)UITableView *tableView;
@property (strong, nonatomic)NSMutableArray *tableViewData;

@property CLLocationCoordinate2D coords;

@end

@implementation UTLocationSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createView];
    [self setAutolayout];
    
    [self setupCoordsUsingAddress:@"江南大道"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createView{
    [self.view addSubview:self.tableView];
}

- (void)setAutolayout{
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[LocationSearchTableViewCell class] forCellReuseIdentifier:[LocationSearchTableViewCell tc_identifier]];
    }
    return _tableView;
}

- (void)setupCoordsUsingAddress:(NSString *)address{
    CLGeocoder *geocoder = [[CLGeocoder alloc]init];
    [geocoder geocodeAddressString:address completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@", error);
        } else if (placemarks && placemarks.count){
            [self reloadTableViewDataWithPlacemarks:placemarks];
        }
    }];
}

- (void)issueLocalSearchLookup:(NSString *)searchString usingPlacemarksArray:(NSArray *)placemarks{
    CLPlacemark *placemark = placemarks[0];
    CLLocation *location = placemark.location;
    
    self.coords = location.coordinate;
    
    MKCoordinateSpan span = MKCoordinateSpanMake(0.6250, 0.6250);
    MKCoordinateRegion region = MKCoordinateRegionMake(self.coords, span);
    
    [self.mapView setRegion:region animated:NO];
    
    self.localSearchRequest = [[MKLocalSearchRequest alloc]init];
    self.localSearchRequest.region = region;
    self.localSearchRequest.naturalLanguageQuery = searchString;
    
    self.localSearch = [[MKLocalSearch alloc] initWithRequest:self.localSearchRequest];
    
    [self.localSearch startWithCompletionHandler:^(MKLocalSearchResponse * _Nullable response, NSError * _Nullable error) {
        if(error){
            
            NSLog(@"localSearch startWithCompletionHandlerFailed!  Error: %@", error);
            return;
            
        } else {
            
            // We are here because we have data!  Yay..  a whole 10 records of it too *flex*
            // Do whatever with it here...
            
            for(MKMapItem *mapItem in response.mapItems){
                
                // Show pins, pix, w/e...
                
                NSLog(@"Name for result: = %@", mapItem.name);
                // Other properties includes: phoneNumber, placemark, url, etc.
                // More info here: https://developer.apple.com/library/ios/#documentation/MapKit/Reference/MKLocalSearch/Reference/Reference.html#//apple_ref/doc/uid/TP40012893
            }
            
            MKCoordinateSpan span = MKCoordinateSpanMake(0.2, 0.2);
            MKCoordinateRegion region = MKCoordinateRegionMake(self.coords, span);
            [self.mapView setRegion:region animated:NO];  
        }
    }];
}

#pragma mark - UITableViewDelegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UTSingleLabelTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[UTSingleLabelTableViewCell tc_identifier] forIndexPath:indexPath];
    [cell loadData:self.tableViewData[indexPath.row]];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.tableViewData.count;
}

- (void)reloadTableViewDataWithPlacemarks:(NSArray *)placemarks{
    self.tableViewData = [NSMutableArray arrayWithCapacity:100];
    
    for (CLPlacemark *placemark in placemarks) {
        NSString *addressName = [NSString stringWithFormat:@"%@ %@", placemark.name, placemark.administrativeArea];
        [self.tableViewData addObject:addressName];
    }
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
