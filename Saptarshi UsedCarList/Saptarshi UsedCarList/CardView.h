//
//  CardView.h
//  Saptarshi UsedCarList
//
//  Created by Ranjit Mahadik on 12/06/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CardView : UIView
@property (nonatomic,strong) UILabel *label;
@property (nonatomic, strong) UIImageView *imageView;

-(void) setImageWithURL: (NSURL *)url;

@end

NS_ASSUME_NONNULL_END
