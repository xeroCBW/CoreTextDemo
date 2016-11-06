//
//  CBWLabel.m
//  CoreTextDemo
//
//  Created by 陈博文 on 16/11/6.
//  Copyright © 2016年 陈博文. All rights reserved.
//

#import "CBWLabel.h"

@implementation CBWLabel


//绑定事件
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self attachTapHandler];
    }
    return self;
}

-(void)awakeFromNib {
    
    [super awakeFromNib];
    [self attachTapHandler];
}


//UILabel默认是不接收事件的，我们需要自己添加touch事件
-(void)attachTapHandler {
    
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *touch = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [self addGestureRecognizer:touch];
}


-(BOOL)canBecomeFirstResponder {
    
    return YES;
}



// 可以响应的方法
-(BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    
    if (action == @selector(cut:) || action == @selector(copy:) || action == @selector(paste:) || action == @selector(selectAll:) || action == @selector(delete:)) {
        return YES;
    }
    return NO;
}


- (void)tapAction:(UITapGestureRecognizer *)recognizer{
    
    [self becomeFirstResponder];
    
    if (recognizer.state == UIGestureRecognizerStateEnded ||
        recognizer.state == UIGestureRecognizerStateCancelled)
    {
        [[UIMenuController sharedMenuController] setTargetRect:self.bounds inView:self];
        [[UIMenuController sharedMenuController] setMenuVisible:YES animated: YES];
    }

}


#pragma mark - 重写方法

//- (void)cut:(nullable id)sender NS_AVAILABLE_IOS(3_0);
//- (void)copy:(nullable id)sender NS_AVAILABLE_IOS(3_0);
//- (void)paste:(nullable id)sender NS_AVAILABLE_IOS(3_0);
//- (void)select:(nullable id)sender NS_AVAILABLE_IOS(3_0);
//- (void)selectAll:(nullable id)sender NS_AVAILABLE_IOS(3_0);

//重写--针对于响应方法的实现
-(void)copy:(id)sender {
    
    UIPasteboard *pboard = [UIPasteboard generalPasteboard];
    pboard.string = self.text;
}

-(void)cut:(id)sender{
    
    UIPasteboard *board = [UIPasteboard generalPasteboard];
    board.string = self.text;
    
    self.text = nil;
    
}


-(void)paste:(id)sender{
    
    UIPasteboard *pboard = [UIPasteboard generalPasteboard];
    self.text =  pboard.string;
    
}

- (void)select:(id)sender{
    
    
}

- (void)selectAll:(id)sender{
    
    
}


- (void)delete:(nullable id)sender{
    
    self.text = nil;
}

@end
