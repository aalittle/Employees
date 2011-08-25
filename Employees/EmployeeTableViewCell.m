//
//  EmployeeTableViewCell.m
//  Employees
//
//  Created by Andrew Little on 11-08-21.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EmployeeTableViewCell.h"


@implementation EmployeeTableViewCell

@synthesize fullName;
@synthesize jobTitle;
@synthesize imageView;
@synthesize imageFrameView;

- (void)dealloc
{
    [fullName release], fullName = nil;
    [jobTitle release], jobTitle = nil;
    [imageView release], imageView = nil;
    [imageFrameView release], imageFrameView = nil;
    
    [super dealloc];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.backgroundView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_background_beige"]] autorelease];
        self.selectedBackgroundView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_background_beige_selected"]] autorelease];
        //self.opaque = YES;
        
        //frame image
        self.imageFrameView = [[UIImageView alloc] 
                               initWithImage:[UIImage imageNamed:@"launcher-frame"]];
        self.imageFrameView.frame = CGRectMake(2.0, 9.0, 80.0, 84.0);
        self.imageFrameView.contentMode = UIViewContentModeScaleAspectFill;
        self.imageFrameView.opaque = YES;
        [self.contentView addSubview:imageFrameView];
        
        //employee image
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(8.0, 11.0, 68.0, 68.0)];
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
        self.imageView.opaque = YES;
        self.imageView.clipsToBounds = YES;
        [self.contentView addSubview:imageView];
        
        //employee name
        self.fullName = [[UILabel alloc] initWithFrame:CGRectMake(97.0, 20.0, 196.0, 30.0)];
        self.fullName.textColor = [UIColor colorWithRed:14.0/255.0 green:101.0/255.0 blue:177.0/255.0 alpha:1.0];
        self.fullName.shadowColor = [UIColor whiteColor];
        self.fullName.shadowOffset = CGSizeMake(0.0, 1.0);
        self.fullName.backgroundColor = [UIColor clearColor];
        self.fullName.font = [UIFont fontWithName:@"Helvetica-Bold" size:22.0];
        self.fullName.textAlignment = UITextAlignmentLeft;
        [self.contentView addSubview:fullName];
        
        //employee title
        self.jobTitle = [[UILabel alloc] initWithFrame:CGRectMake(97.0, 42.0, 196.0, 30.0)];
        self.jobTitle.textColor = [UIColor colorWithRed:60.0/255.0 green:60.0/255.0 blue:60.0/255.0 alpha:1.0];
        self.jobTitle.backgroundColor = [UIColor clearColor];
        self.jobTitle.shadowColor = [UIColor whiteColor];
        self.jobTitle.shadowOffset = CGSizeMake(0.0, 1.0);
        self.jobTitle.font = [UIFont fontWithName:@"Helvetica-Bold" size:14.0];
        self.jobTitle.textAlignment = UITextAlignmentLeft;
        [self.contentView addSubview:jobTitle];
    }
    return self;
}

-(void)redisplay {
    
    [self setNeedsDisplay];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
