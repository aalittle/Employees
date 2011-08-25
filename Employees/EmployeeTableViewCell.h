//
//  EmployeeTableViewCell.h
//  Employees
//
//  Created by Andrew Little on 11-08-21.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface EmployeeTableViewCell : UITableViewCell {

    UIImageView *imageFrameView;
    UIImageView *imageView;
    UILabel     *fullName;
    UILabel     *jobTitle;
}

@property (nonatomic, retain) UIImageView *imageFrameView;
@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, retain) UILabel     *fullName;
@property (nonatomic, retain) UILabel     *jobTitle;

-(void)redisplay;

@end
