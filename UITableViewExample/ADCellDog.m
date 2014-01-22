//
//  ADCellDog.m
//  UITableViewExample
//
//  Created by Armando Di Cianno on 1/22/14.
//  Copyright (c) 2014 Armando Di Cianno. All rights reserved.
//

#import "ADCellDog.h"


@interface ADCellDog ()

@property (nonatomic, assign) BOOL didSetupConstraints;
@property NSMutableArray *constraints;

@end

@implementation ADCellDog
{
    // see the method definitions below for why we override these variables
    UIImageView *_imageView;
    UILabel *_textLabel;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        // allow a unique selection color
        UIView *backgroundView = [[UIView alloc] init];
        backgroundView.backgroundColor = [UIColor blueColor];
        if (style == UITableViewStyleGrouped)
        {
            backgroundView.layer.cornerRadius = 7;
            backgroundView.layer.masksToBounds = YES;
        }
        [self setSelectedBackgroundView:backgroundView];

        _imageView = [UIImageView new];
        [self.contentView addSubview:_imageView];
        _textLabel = [UILabel new];
        [self.contentView addSubview:_textLabel];
        
        [self makeConstraints];
    }
    return self;
}

// We *manually* override imageView and textLabel, for 2 reasons:
// * UITableViewCell super class **really** likes to monkey with them
// * they are good names - reuse!
- (UIImageView *)imageView
{
    return _imageView;
}
- (void)setImageView:(UIImageView *)imageView
{
    _imageView = imageView;
}

- (UILabel *)textLabel
{
    return _textLabel;
}
- (void)setTextLabel:(UILabel *)textLabel
{
    _textLabel = textLabel;
}

- (void)makeConstraints
{
    // Auto-layout via VFL is ok, but libraries like Masonry are really handy, too
    
    // layout some inner elements of the contentView
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.textLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.constraints = [NSMutableArray new];
    NSMutableDictionary *views = [NSMutableDictionary new];
    
    views[@"i"] = self.imageView;
    views[@"t"] = self.textLabel;
    NSString *hConstraint = @"H:|-[t]-[i(<=40)]-|";
    [self.constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:hConstraint
                                                                                  options:0
                                                                                  metrics:nil
                                                                                    views:views]];
    [self.constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[i]|"
                                                                                  options:0
                                                                                  metrics:nil
                                                                                    views:views]];
    [self.constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[t]|"
                                                                                  options:0
                                                                                  metrics:nil
                                                                                    views:views]];
}

- (void)updateConstraints
{
    [super updateConstraints];
    
    if (self.didSetupConstraints) return;
    [self makeConstraints];
    [self.contentView addConstraints:self.constraints];
    self.didSetupConstraints = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
