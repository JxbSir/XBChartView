//
//  PSSSummaryChartCell.h
//  PSS
//
//  Created by Peter on 15/4/3.
//  Copyright (c) 2015年 Peter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSSSummaryCellModel.h"

#define chartCellTitleHeight    20
#define chartCellHeight         60
#define chartViewWidth          200


@interface PSSSummaryChartCell : UITableViewCell

- (void)setChartValue:(CGFloat)basic item:(PSSSummaryCellModel*)item;
@end
