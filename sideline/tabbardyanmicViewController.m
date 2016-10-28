//
//  tabbardyanmicViewController.m
//  sideline
//
//  Created by Pegasus India on 23/07/15.
//  Copyright (c) 2015 Pegasus India. All rights reserved.
//

#import "tabbardyanmicViewController.h"

@interface tabbardyanmicViewController ()<UITabBarDelegate>

@end

@implementation tabbardyanmicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self maketoolebarP];
    
    
    // Do any additional setup after loading the view.
}
-(void)maketoolebarP{
    
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    toolbar.frame = CGRectMake(0, 210, self.view.frame.size.width, 44);
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
   
    [toolbar setItems:items animated:NO];
    [self.view addSubview:toolbar];
    
    for (int i = 0; i < 4; i++) {
        NSString * sting = [NSString stringWithFormat:@" button = %d" ,i];
        UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:sting
                                                                   style:UIBarButtonItemStyleBordered
                                                                  target:nil
                                                                  action:nil];
        [items addObject:button];
    }


    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = toolbar.frame;
    scrollView.bounds = toolbar.bounds;
    scrollView.autoresizingMask = toolbar.autoresizingMask;
    scrollView.showsVerticalScrollIndicator = false;
    scrollView.showsHorizontalScrollIndicator = true;
    //scrollView.bounces = false;
    UIView *superView = toolbar.superview;
    [toolbar removeFromSuperview];
    toolbar.autoresizingMask = UIViewAutoresizingNone;
    toolbar.frame = CGRectMake(0, 0, self.view.frame.size.width, toolbar.frame.size.height);
    toolbar.bounds = toolbar.frame;
    [toolbar setItems:items];
    scrollView.contentSize = toolbar.frame.size;
    [scrollView addSubview:toolbar];
    [superView addSubview:scrollView];
    [toolbar setItems:items animated:NO];

    //[toolbar setToolbarItems:toolbarItems animated:NO];
}
- (void)hideTabBar {
    UITabBar *tabBar = self.tabBarController.tabBar;
    UIView *parent = tabBar.superview; // UILayoutContainerView
    UIView *content = [parent.subviews objectAtIndex:0]; // UITransitionView
    UIView *window = parent.superview;
    
    [UIView animateWithDuration:0.5
                     animations:^{
                         CGRect tabFrame = tabBar.frame;
                         tabFrame.origin.y = CGRectGetMaxY(window.bounds);
                         tabBar.frame = tabFrame;
                         //content.frame = window.bounds;
                     }];
    
}

- (void)showTabBar {
    UITabBar *tabBar = self.tabBarController.tabBar;
    UIView *parent = tabBar.superview; // UILayoutContainerView
    UIView *content = [parent.subviews objectAtIndex:0]; // UITransitionView
    UIView *window = parent.superview;
    
    [UIView animateWithDuration:0.5
                     animations:^{
                         CGRect tabFrame = tabBar.frame;
                         tabFrame.origin.y = CGRectGetMaxY(window.bounds) - CGRectGetHeight(tabBar.frame);
                         tabBar.frame = tabFrame;
                         
                         CGRect contentFrame = content.frame;
                         contentFrame.size.height -= tabFrame.size.height;
                     }];
}
-(void)adtab{
    
    NSArray *arrayOfModulesScreens = @[ @{@"screen_title" : @"title 1"},
  @{@"screen_title" : @"title 2"},
  @{@"screen_title" : @"title 3"} ,@{@"screen_title" : @"title 1"},@{@"screen_title" : @"title 1"}];

    
    NSMutableArray *items = [NSMutableArray array];
    for (int i = 0; i < [arrayOfModulesScreens count]; i++) {
        NSDictionary *dictRow = [arrayOfModulesScreens objectAtIndex:i];
        UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:[dictRow objectForKey:@"screen_title"]
                                                                   style:UIBarButtonItemStyleBordered
                                                                  target:nil
                                                                  action:nil];
        [items addObject:button];
    }
    [tabbar setItems:items animated:YES];

    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
