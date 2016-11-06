//
//  ViewController.m
//  CoreTextDemo
//
//  Created by 陈博文 on 16/11/5.
//  Copyright © 2016年 陈博文. All rights reserved.
//

#import "ViewController.h"
#import "CBWLabel.h"
@interface ViewController ()

@property (weak, nonatomic) IBOutlet CBWLabel *label;
@property (weak, nonatomic) IBOutlet UITextView *TextView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    
    [self textAndImage_lable];
}

- (BOOL) canBecomeFirstResponder
{
    return YES;
}


- (void)textAndImage_lable{
    
    // 图文混排
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] init];
    // 1 - 你好
    NSAttributedString *first = [[NSAttributedString alloc] initWithString:@"你好"];
    [attributedText appendAttributedString:first];
    
    // 2 - 图片(设置图片大小)
    // 带有图片的附件对象
    NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
    attachment.image = [UIImage imageNamed:@"2333624-127c12a2b741fb25"];
    
    CGFloat lineH = self.label.font.lineHeight;
    attachment.bounds = CGRectMake(0,0, lineH, lineH);
    // 将附件对象包装成一个属性文字
    NSAttributedString *second = [NSAttributedString attributedStringWithAttachment:attachment];
    [attributedText appendAttributedString:second];
    
    
    // 3 - 哈哈哈
    NSAttributedString *third = [[NSAttributedString alloc] initWithString:@"哈哈哈jijifdsbfihsdfi121412423423r2"];
    [attributedText appendAttributedString:third];
    
    //4.- 不设置图片大小
    NSTextAttachment *attachment1 = [[NSTextAttachment alloc] init];
    attachment1.image = [UIImage imageNamed:@"2333624-127c12a2b741fb25"];
    // 将附件对象包装成一个属性文字
    NSAttributedString *four = [NSAttributedString attributedStringWithAttachment:attachment1];
    [attributedText appendAttributedString:four];
    
    self.label.attributedText = attributedText;
}


- (void)textAndImage_textView{
    
    
    // 图文混排
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] init];
    // 1 - 你好
    NSAttributedString *first = [[NSAttributedString alloc] initWithString:@"你好"];
    [attributedText appendAttributedString:first];
    
    // 2 - 图片(设置图片大小)
    // 带有图片的附件对象
    NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
    attachment.image = [UIImage imageNamed:@"2333624-127c12a2b741fb25"];
    
    CGFloat lineH = self.label.font.lineHeight;
    attachment.bounds = CGRectMake(0,0, lineH, lineH);
    // 将附件对象包装成一个属性文字
    NSAttributedString *second = [NSAttributedString attributedStringWithAttachment:attachment];
    [attributedText appendAttributedString:second];
    
    
    // 3 - 哈哈哈
    NSAttributedString *third = [[NSAttributedString alloc] initWithString:@"哈哈哈jijifdsbfihsdfi121412423423r2"];
    [attributedText appendAttributedString:third];
    
    //4.- 不设置图片大小
    NSTextAttachment *attachment1 = [[NSTextAttachment alloc] init];
    attachment1.image = [UIImage imageNamed:@"2333624-127c12a2b741fb25"];
    // 将附件对象包装成一个属性文字
    NSAttributedString *four = [NSAttributedString attributedStringWithAttachment:attachment1];
    [attributedText appendAttributedString:four];
    
    self.TextView.attributedText = attributedText;

    
}

@end
