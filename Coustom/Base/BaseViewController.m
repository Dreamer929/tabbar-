//
//  BaseViewController.m
//  Coustom
//
//  Created by mac on 2017/12/27.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@property (nonatomic, strong) UIButton *button;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -UI

-(void)createUI{
    
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button.frame = CGRectMake(100, 100, 100, 50);
    self.button.backgroundColor = [UIColor cyanColor];
    [self.button setTitle:@"push" forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(pushAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark -action

-(void)pushAction:(UIButton*)button{
   

}

@end
