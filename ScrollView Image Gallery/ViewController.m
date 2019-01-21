//
//  ViewController.m
//  ScrollView Image Gallery
//
//  Created by Kamal Maged on 2019-01-21.
//  Copyright © 2019 Kamal Maged. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property(weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property(weak, nonatomic) IBOutlet UIPageControl *pageControl;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGRect scrollViewBounds = self.scrollView.bounds;
    UIImageView * image1 = [[UIImageView alloc]initWithFrame:scrollViewBounds];
    [image1 setImage:[UIImage imageNamed:@"Lighthouse-in-Field"]];
    [self.scrollView addSubview:image1];
    
    UIImageView * image2 = [[UIImageView alloc]initWithFrame:CGRectOffset(scrollViewBounds, scrollViewBounds.size.width, 0)];
    [image2 setImage:[UIImage imageNamed:@"Lighthouse-night"]];
    [self.scrollView addSubview:image2];
    
    UIImageView * image3 = [[UIImageView alloc]initWithFrame:CGRectOffset(scrollViewBounds, scrollViewBounds.size.width * 2, 0)];
    [image3 setImage:[UIImage imageNamed:@"Lighthouse"]];
    [self.scrollView addSubview:image3];
    
    self.scrollView.contentSize = CGSizeMake(scrollViewBounds.size.width * 3, scrollViewBounds.size.height);
}


@end
