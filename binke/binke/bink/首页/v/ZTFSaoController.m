//
//  ZTFSaoController.m
//  binke
//
//  Created by feifei on 16/6/12.
//  Copyright © 2016年 赵腾飞. All rights reserved.
//

#import "ZTFSaoController.h"

#import "ZTF1TableViewController.h"
#import <CoreImage/CoreImage.h>
#import "QRCodeManager.h"

#import <AVFoundation/AVFoundation.h>

@interface ZTFSaoController ()<AVCaptureMetadataOutputObjectsDelegate , UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *spce;
@property (weak, nonatomic) IBOutlet UIImageView *scanView;

@property (weak, nonatomic)  UIImageView *imageView;

@end

@implementation ZTFSaoController


- (void)viewDidLayoutSubviews
{
    [self addAnimation];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];


    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"相册" style:0 target:nil action:@selector(photo)];
    

}

#pragma mark - 相册识别二维码
- (void)photo
{
    
}


#pragma mark - 隐藏底部导航条
- (void)viewWillAppear:(BOOL)animated
{
 self.parentViewController.tabBarController.tabBar.hidden = YES;
}

#pragma mark - 动画效果

- (void)addAnimation
{
    _spce.constant = -200;
    
    // 2.执行动画
    [UIView animateWithDuration:2.0 animations:^{
        [UIView setAnimationRepeatCount:MAXFLOAT];
        
        //强制布局
        [self.view layoutIfNeeded];
    }];
    
}

#pragma mark - 扫描二维码
- (void)startScanning
{
    
    NSError *error = nil;
    //输入
        //获取摄像头
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    //创建输入
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device error:&error];
    
    //创建输出
    AVCaptureMetadataOutput *output = [[AVCaptureMetadataOutput alloc]init];
    
    [output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    
    //创建捕捉会话
    
    AVCaptureSession *session = [[AVCaptureSession alloc]init];
    
    [session addInput:input];
    
    [session addOutput:output];
    
    //输出的内容类型
       [output setMetadataObjectTypes:@[AVMetadataObjectTypeQRCode]];
    
    //添加界面
    AVCaptureVideoPreviewLayer *previewLayer = [[AVCaptureVideoPreviewLayer alloc]initWithSession:session];
    previewLayer.frame = self.view.frame;
    
    
    // 6.设置扫描区域
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    CGFloat x = self.scanView.frame.origin.y / screenSize.height;
    CGFloat y = self.scanView.frame.origin.x / screenSize.width;
    CGFloat w = self.scanView.frame.size.height / screenSize.height;
    CGFloat h = self.scanView.frame.size.width / screenSize.width;
    output.rectOfInterest = CGRectMake(x, y, w, h);
    
    //开始扫描
    [session startRunning];
    
}

#pragma mark - 扫描代理方法

- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    // 1.遍历结果
    for (AVMetadataMachineReadableCodeObject *result in metadataObjects) {
        NSLog(@"%@", result.stringValue);
    }
}

@end
