//
//  DetailViewController.h
//  Altimetrik
//
//  Created by Prachi Verma on 30/08/15.
//  Copyright (c) 2015 Prachi Verma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UITableViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

