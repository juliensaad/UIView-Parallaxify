//
//  UIView+Parallaxify.m
//
//  Created by Julien Saad on 2015-09-24.
//
//

#import "UIView+Parallaxify.h"

@implementation UIView (Parallaxify)

- (void)parallaxifyWithVerticalOffset:(float)verticalOffset horizontalOffset:(float)horizontalOffset {
    UIInterpolatingMotionEffect *verticalMotionEffect =
    [[UIInterpolatingMotionEffect alloc]
     initWithKeyPath:@"center.y"
     type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    verticalMotionEffect.minimumRelativeValue = @(-verticalOffset);
    verticalMotionEffect.maximumRelativeValue = @(verticalOffset);
    
    UIInterpolatingMotionEffect *horizontalMotionEffect =
    [[UIInterpolatingMotionEffect alloc]
     initWithKeyPath:@"center.x"
     type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    horizontalMotionEffect.minimumRelativeValue = @(-horizontalOffset);
    horizontalMotionEffect.maximumRelativeValue = @(horizontalOffset);
    
    UIMotionEffectGroup *group = [UIMotionEffectGroup new];
    group.motionEffects = @[horizontalMotionEffect, verticalMotionEffect];
    
    [self addMotionEffect:group];
}

@end
