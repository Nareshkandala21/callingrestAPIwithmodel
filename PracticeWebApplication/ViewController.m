//
//  ViewController.m
//  PracticeWebApplication
//
//  Created by Naresh Kandala on 02/12/16.
//  Copyright © 2016 Naresh Kandala. All rights reserved.
//

#import "ViewController.h"
#import "Brands_model.h"
#import "BrandsNames_TableViewCell.h"
#import "SubBrandModel.h"
#import "SubsubcategoriesViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *subCatagoryArr;
@property (nonatomic, strong) NSMutableArray *SubsubCatagoryArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self CallingCategories:@"9"];
    
    // Do any additional setup after loading the view, typically from a nib.
}




//calling webservices
-(void)CallingCategories:(NSString *)catId
{
    NSString *urlStr = [NSString stringWithFormat:@"http://gstdemo.com//mobile_store//wp-content//themes//wp_herringbone5-v1.4//webservice//subcategory.php?id=%@",catId];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error) {
            NSError *err;
            NSArray *arr =   [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
            
            NSLog(@"%@",arr);
            
            self.subCatagoryArr = [NSMutableArray array];
            for (int i =0; i < arr.count; i++) {
                NSDictionary *dict = [arr objectAtIndex:i];
                Brands_model *model = [[Brands_model alloc]init];
                model.catID_str = [dict objectForKey:@"category_id"];
                model.catURL_str = [dict objectForKey:@"category_link"];
                model.catName_str = [dict objectForKey:@"category_name"];
                
                [self.subCatagoryArr addObject:model];
                
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.table reloadData];
            });
        }
    }];
    
    [task resume];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)theTableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section
{
    return self.subCatagoryArr.count;
}

// the cell will be returned to the tableView
- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"BrandsNames_TableViewCell";
    
    // Similar to UITableViewCell, but
    BrandsNames_TableViewCell *cell = (BrandsNames_TableViewCell *)[theTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[BrandsNames_TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    // Just want to test, so I hardcode the data
    //cell.descriptionLabel.text = @"Testing";
    Brands_model *model = [self.subCatagoryArr objectAtIndex:indexPath.row];

    cell.names_lbl.text = model.catName_str;
    
    
    
    return cell;
}

#pragma mark - UITableViewDelegate
// when user tap the row, what action you want to perform
- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"selected %ld row", (long)indexPath.row);
    
    Brands_model *model = [self.subCatagoryArr objectAtIndex:indexPath.row];
    
    [self CallingSubcategori:model.catURL_str];
    

    
    
    
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
            
            NSLog(@"sdvasdvav %@",arr);
            
            self.SubsubCatagoryArr = [NSMutableArray array];
            for (int i =0; i < arr.count; i++) {
                NSDictionary *dict = [arr objectAtIndex:i];
                SubBrandModel *model = [[SubBrandModel alloc]init];
                model.price_str = [dict objectForKey:@"price"];
                model.productId_str = [dict objectForKey:@"product_id"];
                model.productImage_str = [dict objectForKey:@"product_image"];
                model.productLink_str = [dict objectForKey:@"product_link"];
                model.productName_str = [dict objectForKey:@"product_name"];
                model.sale_str = [dict objectForKey:@"sale"];

                [self.SubsubCatagoryArr addObject:model];
                
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                NSLog(@"jvsdjcvuyv %@",self.SubsubCatagoryArr);

                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                SubsubcategoriesViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"SubsubcategoriesViewController"];
                
                
                viewController.array_subcat = [NSMutableArray new];
                viewController.array_subcat = self.SubsubCatagoryArr ;
                
                
                [self presentViewController:viewController animated:NO completion:nil];

               // [self performSegueWithIdentifier:@"nxtview" sender:self.SubsubCatagoryArr];
                
                
            });
        }
    }];
    
    [task resume];
    
    
}

//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    
//    SubsubcategoriesViewController *viewController = [SubsubcategoriesViewController new];
//
//    viewController.array_subcat = sender;
//    
//    NSLog(@"avs %@",viewController.array_subcat);
//    
//    
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
