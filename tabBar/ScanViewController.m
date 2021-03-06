//
//  ScanViewController.m
//  tabBar
//
//  Created by Oreal51 on 16/3/8.
//  Copyright © 2016年 1808. All rights reserved.
//
#import<AVFoundation/AVFoundation.h>
#import "ScanViewController.h"

@interface ScanViewController ()<AVCaptureMetadataOutputObjectsDelegate>
@property (nonatomic, strong) AVCaptureSession *session;

@property (nonatomic, strong) AVCaptureVideoPreviewLayer *previewLayer;


@end

@implementation ScanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1. 实例化拍摄设备
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    // 2. 设置输入设备
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];
    // 3. 设置元数据输出
    // 3.1 实例化拍摄元数据输出
    AVCaptureMetadataOutput *output = [[AVCaptureMetadataOutput alloc] init];
    // 3.3 设置输出数据代理
    [output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    // 4. 添加拍摄会话
    // 4.1 实例化拍摄会话
    AVCaptureSession *session = [[AVCaptureSession alloc] init];
    // 4.2 添加会话输入
    [session addInput:input];
    // 4.3 添加会话输出
    [session addOutput:output];
    // 4.3 设置输出数据类型，需要将元数据输出添加到会话后，才能指定元数据类型，否则会报错
    [output setMetadataObjectTypes:@[AVMetadataObjectTypeQRCode]];
    self.session = session;
    // 5. 视频预览图层
    // 5.1 实例化预览图层, 传递_session是为了告诉图层将来显示什么内容
    AVCaptureVideoPreviewLayer *preview = [AVCaptureVideoPreviewLayer layerWithSession:_session];
    preview.videoGravity = AVLayerVideoGravityResizeAspectFill;
    preview.frame = self.view.bounds;
    // 5.2 将图层插入当前视图
    [self.view.layer insertSublayer:preview atIndex:100];
    self.previewLayer = preview;
    // 6. 启动会话
    [_session startRunning];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
