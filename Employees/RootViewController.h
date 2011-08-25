//
//  RootViewController.h
//  Employees
//
//  Created by Andrew Little on 11-08-21.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EmployeeDetailView.h"

@interface RootViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {

    UITableView *myTableView;
    UINib *cellNib;
    EmployeeDetailView *detailView;
    NSMutableArray *employees;
    
    UIButton *followMe;
}

@property (nonatomic, retain) IBOutlet UITableView *myTableView;
@property (nonatomic, retain) UINib *cellNib;
@property (nonatomic, retain) IBOutlet EmployeeDetailView *detailView;
@property (nonatomic, retain) NSMutableArray *employees;
@property (nonatomic, retain) IBOutlet UIButton *followMe;

@end
