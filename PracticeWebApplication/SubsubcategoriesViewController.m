//
//  SubsubcategoriesViewController.m
//  PracticeWebApplication
//
//  Created by Naresh Kandala on 02/12/16.
//  Copyright © 2016 Naresh Kandala. All rights reserved.
//

#import "SubsubcategoriesViewController.h"
#import "SubsubBrandCollectionViewCell.h"
#import "SubBrandModel.h"
#import "AsyncImageView.h"
#import "UIImageView+WebCache.h"
#import "CommonClassVC.h"
#import "DetailsProductModel.h"
#import "ProductDetailViewController.h"
@interface SubsubcategoriesViewController ()
@property (nonatomic, strong) NSMutableArray *SubsubCatagoryArr;

@end

@implementation SubsubcategoriesViewController

- (void)viewDidLoad {
    
    
    
    [super viewDidLoad];
    NSLog(@"vscyv %@",self.array_subcat);

    [self.collView reloadData];
    // Do any additional setup after loading the view.
}
-(void)viewDidAppear:(BOOL)animated{
    [CommonClassVC changeOrientation:UIInterfaceOrientationPortrait];
}

#pragma mark -  <UICollectionView methods>

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.array_subcat.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"SubsubBrandCollectionViewCell";
    SubsubBrandCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    SubBrandModel *model =  [self.array_subcat objectAtIndex:indexPath.row];

  
    
    
//    NSString *strurl =  model.productImage_str ;
//    
//    NSArray *arr = [model.productImage_str componentsSeparatedByString:@","];
// 
//    NSString *strurl1 =[arr objectAtIndex:0];
   NSURL *imageURL = [NSURL URLWithString:[model.productImage_str objectAtIndex:0]];
    
    
    [cell.brand_img sd_setImageWithURL:imageURL];

    
//  NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
// UIImage *image = [UIImage imageWithData:imageData];
//    cell.brand_img.image = image;
    cell.brandNmae_lbl.text = model.productName_str;
    cell.price_lbl.text = model.price_str;
    
//    NSLog(@"fhbh %@",model.productLink_str);
    
   // cell.brand_img.image =
    
    
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"dfdf %ld",(long)indexPath.row);
    
    
    
    SubBrandModel *model =  [self.array_subcat objectAtIndex:indexPath.row];
    

    NSLog(@"fhbh %@",model.productLink_str);
    
    [self CallingSubcategori:model.productLink_str];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)Back_Action:(id)sender {
    
    
    [self dismissViewControllerAnimated:YES completion:nil];

    
    
}
-(void)CallingSubcategori:(NSString *)subCatId
{
    
    
    NSString *urlStr = [NSString stringWithFormat:@"%@",subCatId];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error) {
            NSError *err;
            NSArray *arr =   [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
            
            NSLog(@"%@",arr);
            
            self.SubsubCatagoryArr = [NSMutableArray array];
            for (int i =0; i < arr.count; i++) {
                NSDictionary *dict = [arr objectAtIndex:i];
                DetailsProductModel *model = [[DetailsProductModel alloc]init];
                model.str_product_name = [dict objectForKey:@"product_name"];
                model.str_product_image = [dict objectForKey:@"product_image"];
                model.str_product_content = [dict objectForKey:@"product_content"];
                model.str_price = [dict objectForKey:@"price"];
                model.sale = [dict objectForKey:@"sale"];
                
                [self.SubsubCatagoryArr addObject:model];
            
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                NSLog(@"jvsdjcvuyv %@",self.SubsubCatagoryArr);
                
                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                ProductDetailViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"ProductDetailViewController"];
                
                
                viewController.arry_details = [NSMutableArray new];
                viewController.arry_details = self.SubsubCatagoryArr ;
                
                
                [self presentViewController:viewController animated:YES completion:nil];
//
                
                
            });
        }
    }];
    
    [task resume];
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
