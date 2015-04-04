//
//  XBChartCell.h
//  PSS
//
//  Created by Peter on 15/4/3.
//  Copyright (c) 2015年 Peter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XBChartCellModel.h"

#define chartCellTitleHeight    20
#define chartCellHeight         60
#define chartViewWidth          200


@interface XBChartCell : UITableViewCell

- (void)setChartValue:(CGFloat)basic item:(XBChartCellModel*)item;
@end
