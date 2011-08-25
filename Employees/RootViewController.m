//
//  RootViewController.m
//  Employees
//
//  Created by Andrew Little on 11-08-21.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"
#import "EmployeeTableViewCell.h"
#import "Employee.h"

#define ROW_HEIGHT 92.0

@interface RootViewController (PrivateMethods) 

- (void)presentDetailView:(Employee *)theEmployee;
- (void)dismissDetailView;

@end

@implementation RootViewController


@synthesize cellNib;
@synthesize detailView;
@synthesize myTableView;
@synthesize employees;
@synthesize followMe;

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    self.cellNib = nil;
    self.detailView = nil;
    self.myTableView = nil;
    self.employees = nil;
    self.followMe = nil;
}

- (void)dealloc
{
    [myTableView release], myTableView = nil;
    [cellNib release], cellNib = nil;
    [detailView release], detailView = nil;
    [employees release], employees = nil;
    [followMe release], followMe = nil;
    
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];   
    
    //create employees array
    employees = [[NSMutableArray alloc] init];
    
    //load data from the employee plist
    NSString* employeeDataPath = [[NSBundle mainBundle] pathForResource:@"EmployeeData" ofType:@"plist"];
    NSArray* employeesAsDictionaries = [[NSArray alloc] initWithContentsOfFile:employeeDataPath];  
    
    for (NSDictionary *empDict in employeesAsDictionaries) {
        
        Employee *newEmployee = [[Employee alloc] init];
        [newEmployee populateEmployeeFrom:empDict];
        [employees addObject:newEmployee];
        
        [newEmployee release];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

/*
 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 */

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return ROW_HEIGHT;
}

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [employees count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"EmployeeCell";
    
	EmployeeTableViewCell *cell = (EmployeeTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
	if (cell == nil) {
		cell = [[[EmployeeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
		cell.frame = CGRectMake(0.0, 0.0, 320.0, ROW_HEIGHT);
	}

    //grab the appropriate employee object
    Employee *theEmployee = [employees objectAtIndex:indexPath.row];
    
    // Configure the cell.
    cell.fullName.text = theEmployee.fullName;
    cell.jobTitle.text = theEmployee.jobTitle;
    
    NSString *thumbnailFullPath = [NSString stringWithFormat:@"%@_thumb", theEmployee.imagePath];
    
    [cell.imageView setImage:[UIImage imageNamed:thumbnailFullPath]];
    
    [cell redisplay];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //grab the appropriate employee object
    Employee *theEmployee = [employees objectAtIndex:indexPath.row];
    
    [self presentDetailView:theEmployee];    
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)presentDetailView:(Employee *)theEmployee {
        
    //get the info view prepared for display
    NSArray* nibViews = [[NSBundle mainBundle] loadNibNamed:@"EmployeeDetailView"
                                                      owner:self
                                                    options:nil];
    
    self.detailView = [nibViews objectAtIndex:0];
    self.detailView.alpha = 0.0;
    [self.detailView setEmployeeFields:theEmployee];
    [self.detailView.closeButton addTarget:self action:@selector(dismissDetailView) forControlEvents:UIControlEventTouchUpInside];
    
    [self.navigationController.view addSubview:detailView];
    
    [UIView animateWithDuration:0.5
                          delay:0 
                        options:UIViewAnimationCurveEaseIn
                     animations:^{
                         self.detailView.alpha = 1.0;
                     }
                     completion:^( BOOL finished ) {
                     }];

}

- (void)dismissDetailView {

    [detailView removeFromSuperview];

    //deselect the row
    [self.myTableView deselectRowAtIndexPath:[self.myTableView indexPathForSelectedRow] animated:YES];

}

-(IBAction)onFollowMe {
    
    BOOL twitter = [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"twitter://user?screen_name=aalittle"]];
    if (twitter) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"twitter://user?screen_name=aalittle"]];
    } else {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.twitter.com/aalittle"]];
    } 
}


@end
