//
//  ViewController.m
//  AutoLayout$code
//
//  Created by 赵亚飞 on 19/8/16.
//  Copyright © 2016年 Henry. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView * greenView = [[UIView alloc]init];
    greenView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:greenView];
    
    UIView * orangeView = [[UIView alloc]init];
    orangeView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:orangeView];
    
    UIView * cyanView = [[UIView alloc]init];
    cyanView.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:cyanView];
    
    //使用约束来补足时需要将translatesAutoresizingMaskIntoConstraints属性设置为NO；
    self.view .translatesAutoresizingMaskIntoConstraints = NO;
    greenView.translatesAutoresizingMaskIntoConstraints = NO;
    orangeView.translatesAutoresizingMaskIntoConstraints = NO;
    cyanView.translatesAutoresizingMaskIntoConstraints = NO;

    //第一种方式
#if 0
    //给绿色视图添加左边距
    NSLayoutConstraint *constraint1 = [NSLayoutConstraint constraintWithItem:greenView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0f constant:40];
    //添加上边距约束
    NSLayoutConstraint *constraint2 = [NSLayoutConstraint constraintWithItem:greenView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0f constant:40];
    
    //添加右边距
    NSLayoutConstraint *constraint3 = [NSLayoutConstraint constraintWithItem:greenView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:orangeView attribute:NSLayoutAttributeLeading multiplier:1.0f constant:-40];
    
    //添加宽度约束
    NSLayoutConstraint *constraint4 = [NSLayoutConstraint constraintWithItem:greenView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:orangeView attribute:NSLayoutAttributeWidth multiplier:1.0f constant:0];
    
    //给orange添加上边距
    NSLayoutConstraint *constraint5 = [NSLayoutConstraint constraintWithItem:orangeView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view  attribute:NSLayoutAttributeTop multiplier:1.0f constant:40];
    
    //右边距
    NSLayoutConstraint * constraint6 = [NSLayoutConstraint constraintWithItem:orangeView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0f constant:-40];
    //orange和green高度相等
    NSLayoutConstraint * constraint7 = [NSLayoutConstraint constraintWithItem:orangeView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:greenView attribute:NSLayoutAttributeHeight multiplier:1.0f constant:0];
    
    //cyan视图上边距
    NSLayoutConstraint * constraint8 = [NSLayoutConstraint constraintWithItem:cyanView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:greenView attribute:NSLayoutAttributeBottom multiplier:1.0f constant:40];
    //左边距
    NSLayoutConstraint * constraint9 = [NSLayoutConstraint constraintWithItem:cyanView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view  attribute:NSLayoutAttributeLeft multiplier:1.0f constant:40];
    
    //添加右边距
    NSLayoutConstraint * constraint10 = [NSLayoutConstraint constraintWithItem:cyanView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0f constant:-40];
    
    //下边距
    NSLayoutConstraint * constraint11 = [NSLayoutConstraint constraintWithItem:cyanView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view  attribute:NSLayoutAttributeBottom multiplier:1.0f constant:-40];
    //高于于greenView的高度相等
    NSLayoutConstraint * constraint12 = [NSLayoutConstraint constraintWithItem:cyanView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:orangeView attribute:NSLayoutAttributeHeight multiplier:1.0f constant:0];
    
    
    [self.view addConstraints:[NSArray arrayWithObjects:constraint1,constraint2,constraint3,constraint4,constraint5,constraint6,constraint7,constraint8,constraint9,constraint10,constraint11,constraint12, nil]];
#endif
#if 0
    //第二中方式：使用VFL语言添加约束
    //第一组:横向约束
    
    NSArray *constraintsH1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-40-[greenView]-40-[orangeView(==greenView)]-40-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(greenView,orangeView)];
    
    //第二组:横向约束
    
    NSArray *constraintsH2 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-40-[cyanView]-40-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(cyanView)];
    
    
    //第一组：纵向约束
    
    NSArray *constraintsV1 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-40-[greenView]-40-[cyanView(==greenView)]-40-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(greenView,cyanView)];
    
    //第二组：纵向约束
    NSArray *constraintsV2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-40-[orangeView]-40-[cyanView(==orangeView)]-40-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(orangeView,cyanView)];
    
    [self.view addConstraints:constraintsH1];
    [self.view addConstraints:constraintsH2];
    [self.view addConstraints:constraintsV1];
    [self.view addConstraints:constraintsV2];
    
#endif
    
    //第三中方式
    //添加greenView的约束
    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
       //在block当中添加约束
        
        make.top.mas_equalTo(self.view.mas_top).multipliedBy(1.0f).offset(40);//其中的倍数multipliedBy(1.0f)可以省略
        
        make.left.mas_equalTo(self.view.mas_left).multipliedBy(1.0f).offset(40);
        make.trailing.mas_equalTo(orangeView.mas_leading).offset(-40);
        
    }];
    
    //添加orangeView的视图约束
    [orangeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(greenView.mas_top).offset(0);
        make.right.mas_equalTo(self.view.mas_right).offset(-40);
        make.width.mas_equalTo(greenView.mas_width).offset(0);
        make.height.mas_equalTo(greenView.mas_height);
    }];
    
    //添加cyanView的约束
    [cyanView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(greenView.mas_bottom).offset(40);
        make.left.mas_equalTo(self.view.mas_left).offset(40);
        make.right.mas_equalTo(self.view.mas_right).offset(-40);
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(-40);
        make.height.mas_equalTo(greenView.mas_height).offset(0);
        
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
