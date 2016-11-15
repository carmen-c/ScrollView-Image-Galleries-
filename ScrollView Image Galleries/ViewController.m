//
//  ViewController.m
//  ScrollView Image Galleries
//
//  Created by carmen cheng on 2016-11-14.
//  Copyright © 2016 carmen cheng. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) UIImageView *pictureImageView;
@property (nonatomic, readonly) NSArray<UIImage *> *images;

@property (strong, nonatomic) UITapGestureRecognizer *tapGesture;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

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
        
        self.tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapped:)];
        [imageView addGestureRecognizer:self.tapGesture];
        imageView.userInteractionEnabled = YES;
    }
    self.scrollView.contentSize = CGSizeMake(scrollViewWidth*self.images.count, scrollViewHeight);
    
    [self.scrollView setPagingEnabled:YES];
    self.scrollView.delegate = self;
}

- (void)tapped:(UITapGestureRecognizer *)tapGesture{
    UIImageView * imageView = (UIImageView *)tapGesture.view;
    if ([imageView isKindOfClass:[UIImageView class]]) {
        [self performSegueWithIdentifier:@"showDetail" sender:imageView.image];
    }
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        SecondViewController *svc = [segue destinationViewController];
        svc.image = sender;
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat width = self.scrollView.frame.size.width;
    NSInteger page = (self.scrollView.contentOffset.x + (0.5f * width)) / width;
    self.pageControl.currentPage = page;
}

-(NSArray<UIImage *> *) images{
    return @[
             [UIImage imageNamed:@"Lighthouse-in-Field"],
             [UIImage imageNamed:@"Lighthouse-night"],
             [UIImage imageNamed:@"Lighthouse-zoomed"],
             ];
}


@end
