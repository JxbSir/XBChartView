# XBChartView
自己封装的横向柱形统计图，自动匹配最近符合的一项居中显示

#具体代码

引用：

'#import "XBChartView.h"'

'#import "XBChartCellModel.h"'

代码：

NSMutableArray* arr = [NSMutableArray array];

    XBChartView* chart = [[XBChartView alloc] initWithFrame:CGRectMake(0, 40, 375, 200)];
    
    for(int i = 31;i >=0;i--)
    
    {
    
        XBChartCellModel* item = [[XBChartCellModel alloc]init];
        
        item.title = [NSString stringWithFormat:@"3-%d",i];
        
        item.numOfShip = arc4random() % 100;
        
        item.numOfOrder = arc4random() % 100;
        
        item.numOfSale = arc4random() % 100;
        
        [arr addObject:item];
        
    }
    
    chart.tbDataSource = arr;
    
    [self.view addSubview:chart];
    

#例图

![](https://raw.githubusercontent.com/JxbSir/XBChartView/master/screenshot.gif)  
