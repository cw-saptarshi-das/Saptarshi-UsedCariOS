//
//  CardView.m
//  Saptarshi UsedCarList
//
//  Created by Ranjit Mahadik on 12/06/24.
//

#import "CardView.h"

@implementation CardView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

-(void)setupView {
    // Customize your view here, for example, set background color
    self.backgroundColor = [UIColor greenColor];
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, self.frame.size.width-20, 40)];
    self.label.text = @"Saptarshi";
    self.label.textColor = [UIColor blackColor];
    self.label.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addSubview:self.label];
    
    CGFloat imageViewSize = 100.0;
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake((self.frame.size.width - imageViewSize) / 2, CGRectGetMaxY(self.label.frame) + 10, imageViewSize, imageViewSize)];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.imageView.image = [UIImage imageNamed:@"default_image"];
    self.label.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addSubview:self.imageView];
    
    [self setupConstraints];
}

-(void)setupConstraints {
    [NSLayoutConstraint activateConstraints:@[
        [self.label.topAnchor constraintEqualToAnchor:self.topAnchor constant:10],
        [self.label.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:10],
        [self.label.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-10],
        [self.label.heightAnchor constraintEqualToConstant:40]
    ]];

    [NSLayoutConstraint activateConstraints:@[
        [self.imageView.topAnchor constraintEqualToAnchor:self.label.bottomAnchor constant:10],
        [self.imageView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:10],
        [self.imageView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-10],
        [self.imageView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-10]
    ]];
}

-(void)setImageWithURL:(NSURL *)url {
    NSURLSessionDataTask *downloadImageTask = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Failed to load image: %@", error.localizedDescription);
            return;
        }

        UIImage *downloadedImage = [UIImage imageWithData:data];
        if (downloadedImage) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.imageView.image = downloadedImage;
            });
        }
    }];

    [downloadImageTask resume];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
