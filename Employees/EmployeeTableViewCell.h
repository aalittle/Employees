//
//  EmployeeTableViewCell.h
//  Employees
//
//  Created by Andrew Little on 11-08-21.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface EmployeeTableViewCell : UITableViewCell {

    UIImageView *imageView;
    UILabel     *fullName;
    UILabel     *jobTitle;
}

@property (nonatomic, retain) IBOutlet UIImageView *imageView;
@property (nonatomic, retain) IBOutlet UILabel     *fullName;
@property (nonatomic, retain) IBOutlet UILabel     *jobTitle;


+ (UINib *)nib;
+ (NSString *)nibName;

+ (NSString *)cellIdentifier;
+ (id)cellForTableView:(UITableView *)tableView fromNib:(UINib *)nib;

@end
