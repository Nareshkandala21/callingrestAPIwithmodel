//
//  SubBrandModel.h
//  PracticeWebApplication
//
//  Created by Naresh Kandala on 02/12/16.
//  Copyright © 2016 Naresh Kandala. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SubBrandModel : NSObject
@property (nonatomic,strong) NSString *price_str,*productId_str,*productLink_str,*productName_str,*sale_str;
@property (nonatomic,strong) NSArray *productImage_str;
@end
