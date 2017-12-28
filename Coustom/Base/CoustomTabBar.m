//
//  CoustomTabBar.m
//  Coustom
//
//  Created by mac on 2017/12/27.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "CoustomTabBar.h"

@implementation CoustomTabBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(instancetype)init{
    
    if (self = [super init]) {
        [self initView];
    }
    
    return self;
}

-(void)initView{
    
    _centerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *normalImg = [UIImage imageNamed:@"tabbar_add"];
    _centerBtn.frame = CGRectMake(0, 0, normalImg.size.width, normalImg.size.height);
    [_centerBtn setImage:normalImg forState:UIControlStateNormal];
    _centerBtn.adjustsImageWhenHighlighted = NO;
    
    _centerBtn.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - normalImg.size.width)/2, - normalImg.size.height/2.0, normalImg.size.width, normalImg.size.height);
    
    [self addSubview:_centerBtn];
    
}

//处理超出区域点击无效的问题
-(UIView*)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    UIView *view = [super hitTest:point withEvent:event];
    if (view == nil){
        //转换坐标
        CGPoint tempPoint = [self.centerBtn convertPoint:point fromView:self];
        //判断点击的点是否在按钮区域内
        if (CGRectContainsPoint(self.centerBtn.bounds, tempPoint)){
            //返回按钮
            return _centerBtn;
        }
    }
    return view;
}

@end
