//
//  SubsubcategoriesViewController.h
//  PracticeWebApplication
//
//  Created by Naresh Kandala on 02/12/16.
//  Copyright © 2016 Naresh Kandala. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubsubcategoriesViewController : UIViewController
@property (strong, nonatomic) IBOutlet UICollectionView *collView;

@property (nonatomic,strong) NSMutableArray *array_subcat;
@end
