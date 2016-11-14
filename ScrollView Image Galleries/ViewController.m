//
//  ViewController.m
//  ScrollView Image Galleries
//
//  Created by carmen cheng on 2016-11-14.
//  Copyright © 2016 carmen cheng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) UIImageView *pictureImageView;
@property (nonatomic, readonly) NSArray<UIImage *> *images;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat imageXPosition = 0;
    
    CGFloat scrollViewWidth = CGRectGetWidth(self.view.frame);
    CGFloat scrollViewHeight = CGRectGetHeight(self.scrollView.frame);
    
    for (UIImage *image in self.images) {
        UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
        
        imageView.frame = CGRectMake(imageXPosition, 0, scrollViewWidth, scrollViewHeight);
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [self.scrollView addSubview:imageView];
        
        imageXPosition += scrollViewWidth;
    }
    
    self.scrollView.contentSize = CGSizeMake(scrollViewWidth*self.images.count, scrollViewHeight);
    
}

-(NSArray<UIImage *> *) images{
    return @[
             [UIImage imageNamed:@"Lighthouse-in-Field"],
             [UIImage imageNamed:@"Lighthouse-night"],
             [UIImage imageNamed:@"Lighthouse-zoomed"],
             ];
}


@end
