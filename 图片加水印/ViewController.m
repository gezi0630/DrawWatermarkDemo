//
//  ViewController.m
//  图片加水印
//
//  Created by MAC on 2017/7/3.
//  Copyright © 2017年 GuoDongge. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageVCustom;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self me];


}


-(void)me
{
    UIImage * image = [UIImage imageNamed:@"huangren"];
    
    //目前我们需要绘制图片到新的图片上，因此需要用到位图上下文
    
    //开启位图上下文
    //size: 位图上下文的尺寸
    //opaque: 不透明度  YES ：不透明   NO:透明
    //scale:通常不需要缩放上下文，取值为0，表示不缩放
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    
    //1、绘制原生的图片
    [image drawAtPoint:CGPointZero];
    
    //2、给原生的图片添加文字
    NSString * str = @"®鸽子";
    
    //添加字典属性
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor greenColor];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    
    [str drawAtPoint:CGPointMake(200, 528) withAttributes:dict];
    
    //3、生成一张图片给我们，从上下文中获取图片
    UIImage * imageNew = UIGraphicsGetImageFromCurrentImageContext();
    
    //4、关闭上下文
    UIGraphicsEndPDFContext();
    
    
    self.imageVCustom.image = imageNew;
}


@end
