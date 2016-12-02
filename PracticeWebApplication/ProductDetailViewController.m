//
//  ProductDetailViewController.m
//  PracticeWebApplication
//
//  Created by Naresh Kandala on 02/12/16.
//  Copyright © 2016 Naresh Kandala. All rights reserved.
//

#import "ProductDetailViewController.h"
#import "AsyncImageView.h"
#import "UIImageView+WebCache.h"
#import "DetailsProductModel.h"

@interface ProductDetailViewController ()

@end

@implementation ProductDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"jsdhvs %@",self.arry_details);
    
    DetailsProductModel *model =   [self.arry_details objectAtIndex:0];
    NSURL *imageURL = [NSURL URLWithString:[model.str_product_image objectAtIndex:0]];

    [self.detail_image sd_setImageWithURL:imageURL];
    
    self.productName_lbl.text = model.str_product_name;
    self.priceAmt_lbl.text = model.str_price;
    self.aboutproduct_lbl.text = model.str_product_content;
    self.saleAmt_lbl.text = model.sale;
    
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)Back_Action:(id)sender {
    
    
    [self dismissViewControllerAnimated:YES completion:nil];

}
@end
