//
//  SDSliderField.m
//  SDForms
//
//  Created by Rafal Kwiatkowski on 26.08.2014.
//  Copyright (c) 2014 Snowdog sp. z o.o. All rights reserved.
//

#import "SDSliderField.h"
#import "SDSliderCell.h"

@interface SDSliderField ()

@end

@implementation SDSliderField

- (id)init
{
    self = [super init];
    if (self) {
        self.min = 0.0;
        self.max = 10.0;
        self.step = 1.0;
    }
    return self;
}

- (void)registerCellsInTableView:(UITableView *)tableView
{
    [tableView registerNib:[UINib nibWithNibName:kSliderCell bundle:nil] forCellReuseIdentifier:kSliderCell];
    self.reuseIdentifiers = @[kSliderCell];
    self.cellHeights = @[@88.0];
}

- (SDFormCell *)cellForTableView:(UITableView *)tableView atIndex:(NSUInteger)index
{
    SDFormCell *cell = [super cellForTableView:tableView atIndex:index];
    
    if ([cell isKindOfClass:[SDSliderCell class]]) {
        SDSliderCell *sliderCell = (SDSliderCell *)cell;
        sliderCell.slider.minimumValue = self.min;
        sliderCell.slider.maximumValue = self.max;
    }
    
    return cell;
}

@end