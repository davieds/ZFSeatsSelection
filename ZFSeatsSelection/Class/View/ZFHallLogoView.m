//
//  ZFHallLogoView.m
//  
//
//  Created by qq 316917975  on 16/1/28.
//  Copyright © 2016年 qq 316917975 . All rights reserved.
//

#import "ZFHallLogoView.h"
#import "UIView+Extension.h"
@interface ZFHallLogoView ()


@property (weak, nonatomic)  UIImageView *HollLogo;


@end

@implementation ZFHallLogoView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
      
        UIImageView *HollLogo = [[UIImageView alloc]init];
       
        self.HollLogo = HollLogo;
        
        self.backgroundColor = [UIColor clearColor];
        
        [self addSubview:HollLogo];
    }
    return self;
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    self.HollLogo.frame = self.bounds;

}

-(void)setHallName:(NSString *)hallName{
    
    _hallName = hallName;
    
     [self setNeedsDisplay];
    
}
// 绘制图片
- (void)drawRect:(CGRect)rect {

    UIImage *image = [UIImage imageNamed:@"screenBg"];//这里更换你影厅图标

    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    
    [image drawAtPoint:CGPointZero];
    
    NSDictionary *attributeName = @{NSFontAttributeName: [UIFont systemFontOfSize:9],NSForegroundColorAttributeName : [UIColor darkGrayColor]};
    
    CGSize strsize =   [self.hallName sizeWithAttributes:attributeName];
    
    [self.hallName drawAtPoint:CGPointMake(image.size.width / 2 - strsize.width / 2, image.size.height / 2 - strsize.height / 2) withAttributes:attributeName];
    
    image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    self.HollLogo.image = image;

}


@end
