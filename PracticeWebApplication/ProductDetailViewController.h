//
//  ProductDetailViewController.h
//  PracticeWebApplication
//
//  Created by Naresh Kandala on 02/12/16.
//  Copyright © 2016 Naresh Kandala. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductDetailViewController : UIViewController
- (IBAction)Back_Action:(id)sender;
@property (strong,nonatomic) NSMutableArray *arry_details;
@property (strong, nonatomic) IBOutlet UIImageView *detail_image;
@property (strong, nonatomic) IBOutlet UILabel *productName_lbl;
@property (strong, nonatomic) IBOutlet UILabel *aboutproduct_lbl;
@property (strong, nonatomic) IBOutlet UILabel *priceAmt_lbl;

@property (strong, nonatomic) IBOutlet UILabel *saleAmt_lbl;
@end
