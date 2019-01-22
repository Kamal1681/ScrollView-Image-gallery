//
//  ViewController.m
//  ScrollView Image Gallery
//
//  Created by Kamal Maged on 2019-01-21.
//  Copyright © 2019 Kamal Maged. All rights reserved.
//

#import "ViewController.h"
#import "detailViewController.h"
@interface ViewController () <UIScrollViewDelegate>
@property(weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic) UIImageView * image1;
@property (nonatomic) UIImageView * image2;
@property (nonatomic) UIImageView * image3;
@property (nonatomic) UIImage * tappedImage;

@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGRect scrollViewBounds = self.scrollView.bounds;
    
    self.image1 = [[UIImageView alloc]initWithFrame:scrollViewBounds];
    [self.image1 setImage:[UIImage imageNamed:@"Lighthouse-in-Field"]];
    [self.image1 setUserInteractionEnabled:YES];
    [self.scrollView addSubview:self.image1];
    
    self.image2 = [[UIImageView alloc]initWithFrame:CGRectOffset(scrollViewBounds, scrollViewBounds.size.width, 0)];
    [self.image2 setImage:[UIImage imageNamed:@"Lighthouse-night"]];
    [self.image2 setUserInteractionEnabled:YES];
    [self.scrollView addSubview:self.image2];
    
    self.image3 = [[UIImageView alloc]initWithFrame:CGRectOffset(scrollViewBounds, scrollViewBounds.size.width * 2, 0)];
    [self.image3 setImage:[UIImage imageNamed:@"Lighthouse"]];
    [self.image3 setUserInteractionEnabled:YES];
    [self.scrollView addSubview:self.image3];
    
    self.scrollView.contentSize = CGSizeMake(scrollViewBounds.size.width * 3, scrollViewBounds.size.height);
    
    UITapGestureRecognizer * tapRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapImage:)];
    [self.scrollView addGestureRecognizer:tapRecognizer];
    
}

- (void) tapImage: (UITapGestureRecognizer *) sender {
    
    CGFloat width = (float)self.scrollView.contentSize.width / 3.0;
   
    CGPoint locationInView = [sender locationInView:sender.view];
    
    if (locationInView.x < width ) { self.tappedImage = self.image1.image;}
    
    if (locationInView.x > width && locationInView.x < width *2) { self.tappedImage = self.image2.image;}
    
    if (locationInView.x > width * 2) { self.tappedImage = self.image3.image;}
    
   [self performSegueWithIdentifier:@"Detail" sender:sender];
}
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier  isEqual: @"Detail"]) {
        detailViewController * destination = segue.destinationViewController;
        destination.imageName = self.tappedImage;
       
    }
}
- (IBAction)pageChanged:(id)sender {
        NSUInteger currentPage = self.pageControl.currentPage;
        CGFloat x = currentPage * 320;
    
        [self.scrollView scrollRectToVisible:CGRectMake(x, 0, self.scrollView.bounds.size.width, self.scrollView.bounds.size.height) animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    
    int currentPage = scrollView.contentOffset.x / 320;
    
    self.pageControl.currentPage = currentPage;
}
@end
