//
//  ViewController.h
//  Saptarshi UsedCarList
//
//  Created by Ranjit Mahadik on 12/06/24.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (nonatomic,strong) NSMutableArray *stocks;
@property (nonatomic,assign) NSInteger currentPage;
@property (nonatomic, assign) BOOL isLoadingMoreData;

@end

