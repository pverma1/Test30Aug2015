//
//  DetailViewController.m
//  Altimetrik
//
//  Created by Prachi Verma on 30/08/15.
//  Copyright (c) 2015 Prachi Verma. All rights reserved.
//

#import "DetailViewController.h"
#import "EnlargedImageViewController.h"


@interface DetailViewController ()

@property(nonatomic,retain)NSString *username;
@property(nonatomic,weak)IBOutlet UILabel *usernameLbl;
@property(nonatomic,weak)IBOutlet UIImageView *imgView;


@end

@implementation DetailViewController

#pragma mark - Managing the detail item


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.title = @"Home";

    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    self.username = [defaults objectForKey:@"username"];
    self.usernameLbl.text = [@"Hello!! " stringByAppendingString:self.username];
    
    UITapGestureRecognizer *tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTapped:)];
    tapped.numberOfTapsRequired = 1;
    [self.imgView setUserInteractionEnabled:YES];
    [self.imgView addGestureRecognizer:tapped];
    
    
    
}

-(void)imageTapped:(id)sender{
    EnlargedImageViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"enlargedImageView"];
    [self.navigationController pushViewController:controller animated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
