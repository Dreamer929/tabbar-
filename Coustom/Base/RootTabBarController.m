//
//  RootTabBarController.m
//  Coustom
//
//  Created by mac on 2017/12/27.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "RootTabBarController.h"
#import "BaseNavigationController.h"

#import "HomeViewController.h"
#import "SeconedViewController.h"
#import "LookViewController.h"
#import "MineViewController.h"
#import "CenterViewController.h"

#import "CoustomTabBar.h"

@interface RootTabBarController ()<UITabBarControllerDelegate>

@property (nonatomic,strong)CoustomTabBar *coustomBar;

@end

@implementation RootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.coustomBar = [[CoustomTabBar alloc]init];
    [self.coustomBar.centerBtn addTarget:self action:@selector(acction:) forControlEvents:UIControlEventTouchUpInside];
    
    self.coustomBar.tintColor = [UIColor colorWithRed:27.0/255.0 green:118.0/255.0 blue:208/255.0 alpha:1];
    //透明设置为NO，显示白色，view的高度到tabbar顶部截止，YES的话到底部
    self.coustomBar.translucent = NO;
    //利用KVC 将自己的tabbar赋给系统tabBar
    [self setValue:self.coustomBar forKeyPath:@"tabBar"];
    
    self.delegate = self;
    
    [self addChileViewControllers];
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -addChild

-(void)addChileViewControllers{
    
    [self addChildViewController:[[HomeViewController alloc]init] withTitle:@"Home" withNormalImage:@"tab1_n" withSelectImage:@"tab1_p"];
    [self addChildViewController:[[SeconedViewController alloc]init] withTitle:@"Second" withNormalImage:@"tab2_n" withSelectImage:@"tab2_p"];
    [self addChildViewController:[[CenterViewController alloc]init] withTitle:@"Add" withNormalImage:@"" withSelectImage:@""];
    [self addChildViewController:[[LookViewController alloc]init] withTitle:@"Search" withNormalImage:@"tab3_n" withSelectImage:@"tab_p"];
    [self addChildViewController:[[MineViewController alloc]init] withTitle:@"Mine" withNormalImage:@"tab4_n" withSelectImage:@"tab_p"];
    
}

-(void)addChildViewController:(UIViewController *)childController withTitle:(NSString*)title withNormalImage:(NSString*)normalImg withSelectImage:(NSString*)selectImg{
    
    childController.title = title;
    childController.tabBarItem.image = [UIImage imageNamed:normalImg];
    childController.tabBarItem.selectedImage = [UIImage imageNamed:selectImg];
    
    BaseNavigationController *nav = [[BaseNavigationController alloc]initWithRootViewController:childController];
    
    [self addChildViewController:nav];
}



#pragma mark -action

-(void)acction:(UIButton*)button{
    self.selectedIndex = 2;
    [self rotationAnimation];
}


#pragma mark -tabbarDelegate

-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    
    if (tabBarController.selectedIndex == 2) {
        [self rotationAnimation];
    }else{
        //[self.coustomBar.centerBtn.layer removeAllAnimations];
        
        [UIView animateWithDuration:0.3 animations:^{
            self.coustomBar.centerBtn.transform = CGAffineTransformMakeRotation(M_PI/4*2);
        }];
    }
}


//旋转

//旋转动画
- (void)rotationAnimation{
    //旋转后能返回的代码
//    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
//    rotationAnimation.toValue = [NSNumber numberWithFloat:M_PI/4];
//    rotationAnimation.duration = 0.1;
//    rotationAnimation.repeatCount = 0;
//    [self.coustomBar.centerBtn.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    
    //只做旋转不复原
    [UIView animateWithDuration:0.3 animations:^{
        self.coustomBar.centerBtn.transform = CGAffineTransformMakeRotation(M_PI/4);
    }];
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
