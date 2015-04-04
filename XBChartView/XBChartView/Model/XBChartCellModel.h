//
//  XBChartCellModel.h
//  PSS
//
//  Created by Peter on 15/4/4.
//  Copyright (c) 2015年 Peter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XBChartCellModel : NSObject
@property(nonatomic,assign)double   numOfShip;
@property(nonatomic,assign)double   numOfOrder;
@property(nonatomic,assign)double   numOfSale;
@property(nonatomic,copy)NSString   *title;
@end
