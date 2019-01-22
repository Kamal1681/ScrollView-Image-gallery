//
//  detailViewController.m
//  ScrollView Image Gallery
//
//  Created by Kamal Maged on 2019-01-21.
//  Copyright © 2019 Kamal Maged. All rights reserved.
//

#import "detailViewController.h"

@interface detailViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *detailScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *image;


@end

@implementation detailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view

    UIPinchGestureRecognizer * pinchRecognizer = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinchToZoom:)];
   
    [self.detailScrollView addGestureRecognizer:pinchRecognizer];
    self.view.sizeToFit;
    
    self.image.image = self.imageName;
}
- (void) pinchToZoom: (UIPinchGestureRecognizer *) sender {
    self.detailScrollView.minimumZoomScale = 0.5;
    self.detailScrollView.maximumZoomScale = 10.0;
    
    CGFloat scale = sender.scale;
    if (scale > self.detailScrollView.minimumZoomScale && scale < self.detailScrollView.maximumZoomScale) {
        sender.view.transform = CGAffineTransformMakeScale(scale, scale);
    }
    
}
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    
    return self.image;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
