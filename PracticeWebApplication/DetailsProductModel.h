//
//  DetailsProductModel.h
//  PracticeWebApplication
//
//  Created by Naresh Kandala on 02/12/16.
//  Copyright © 2016 Naresh Kandala. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DetailsProductModel : NSObject

@property(nonatomic,strong) NSString *str_product_id,*str_product_name,*str_product_content,*str_price,*sale;

@property(nonatomic,strong) NSArray *str_product_image;

@end
