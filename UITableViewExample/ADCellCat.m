//
//  ADCellCat.m
//  UITableViewExample
//
//  Created by Armando Di Cianno on 1/22/14.
//  Copyright (c) 2014 Armando Di Cianno. All rights reserved.
//

#import "ADCellCat.h"

@implementation ADCellCat

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        UIView *backgroundView = [[UIView alloc] init];
        backgroundView.backgroundColor = [UIColor redColor];
        if (style == UITableViewStyleGrouped)
        {
            backgroundView.layer.cornerRadius = 7;
            backgroundView.layer.masksToBounds = YES;
        }
        [self setSelectedBackgroundView:backgroundView];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
