//
//  CoordinateView.m
//  UIScrollViewDelegateExample
//
//  Created by Naoyuki Takura on 2014/04/29.
//  Copyright (c) 2014年 Naoyuki Takura. All rights reserved.
//

#import "CoordinateView.h"
#import "CallBackIndicator.h"

@interface CoordinateView() {
    __weak IBOutlet CallBackIndicator *didScrollView;
    __weak IBOutlet CallBackIndicator *shouldScrollToTopView;
    __weak IBOutlet CallBackIndicator *didScrollToTopView;
    __weak IBOutlet CallBackIndicator *willBeginDraggingView;
    __weak IBOutlet CallBackIndicator *didEndDraggingView;
    __weak IBOutlet CallBackIndicator *willBeginDeceleratingView;
    __weak IBOutlet CallBackIndicator *didEndDeceleratingView;
}
@end

@implementation CoordinateView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [didScrollView showIndicator];
        [didScrollToTopView showIndicator];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/


#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"scrollViewDidScroll. : contentOffset :{%f, %f}", scrollView.contentOffset.x, scrollView.contentOffset.y);

    NSString *logText = [NSString stringWithFormat:@"scrollViewDidScroll :%@", scrollView];
    self.textView.text = logText;
    
    //
    CGRect frame = self.frame;
    frame.origin.y = 200 + scrollView.contentOffset.y;
    self.frame = frame;
    
    [didScrollView highlight];
}

- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView {
    NSLog(@"scrollViewShouldScrollToTop. : contentOffset:{%f, %f}", scrollView.contentOffset.x, scrollView.contentOffset.y);
    [shouldScrollToTopView highlight];
    return YES;
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView {
    NSLog(@"scrollViewDidScrollToTop. : %@", scrollView);
    NSString *logText = [NSString stringWithFormat:@"scrollViewDidScrollToTop. : %@", scrollView];
    self.textView.text = logText;
    
    [didScrollToTopView highlight];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    NSLog(@"scrollViewWillBeginDragging. : %@", scrollView);
    NSString *logText = [NSString stringWithFormat:@"scrollViewWillBeginDragging. : %@", scrollView];
    self.textView.text = logText;
    
    [willBeginDraggingView highlight];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    NSLog(@"scrollViewDidEndDragging. : %@, %d", scrollView, decelerate);
    NSString *logText = [NSString stringWithFormat:@"scrollViewDidEndDragging. : %@", scrollView];
    self.textView.text = logText;

    [didEndDraggingView highlight];
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    NSLog(@"scrollViewWillBeginDecelerating. : %@", scrollView);
    NSString *logText = [NSString stringWithFormat:@"scrollViewWillBeginDecelerating. : %@", scrollView];
    self.textView.text = logText;
    
    [willBeginDeceleratingView highlight];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"scrollViewDidEndDecelerating. : %@", scrollView);
    NSString *logText = [NSString stringWithFormat:@"scrollViewDidEndDecelerating. : %@", scrollView];
    self.textView.text = logText;
    
    [didEndDeceleratingView highlight];
}

@end
