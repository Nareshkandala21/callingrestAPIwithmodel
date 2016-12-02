//
//  CommonClassVC.m
//  BRITISH PAINT
//
//  Created by 9Dim on 26/08/16.
//  Copyright © 2016 TechRadiation. All rights reserved.
//

#import "CommonClassVC.h"

@interface CommonClassVC ()

@end

@implementation CommonClassVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+(UIColor*)headerViewColor{
    
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:@"#800705"];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
    
    
}
+(UIColor*)viewBGColor {
    
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:@"#991212"];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];

}

+(void)changeOrientation:(UIInterfaceOrientation)orientation{
    NSNumber *orientationValue = [NSNumber numberWithInt:orientation];
    [[UIDevice currentDevice] setValue: orientationValue forKey:@"orientation"];
}


@end
