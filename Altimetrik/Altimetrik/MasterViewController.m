//
//  MasterViewController.m
//  Altimetrik
//
//  Created by Prachi Verma on 30/08/15.
//  Copyright (c) 2015 Prachi Verma. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"


@interface MasterViewController ()

@property(nonatomic,weak)IBOutlet UITextField *userNametextField;
@property(nonatomic,weak)IBOutlet UITextField *passwordTextField;
@property(nonatomic,weak)IBOutlet UIButton *loginButton;
@property(nonatomic,weak)IBOutlet UILabel *errorLbl;
@end

@implementation MasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [self.loginButton setEnabled:false];
    [self.errorLbl setHidden:true];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    BOOL isUserNameValid = false;
    BOOL isPasswordValid = false;
    if(textField == self.userNametextField){
        isUserNameValid = [self isInputValid:newString];
        isPasswordValid = [self isInputValid:self.passwordTextField.text];
    }
    if(textField == self.passwordTextField){
        isUserNameValid = [self isInputValid:self.userNametextField.text];
        isPasswordValid = [self isInputValid:newString];
    }
    BOOL isAllInputValid = (isUserNameValid && isPasswordValid) ? true : false;
   
    [self.loginButton setEnabled:isAllInputValid];
    [self.errorLbl setHidden:isAllInputValid];
    
    return true;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    BOOL isUserNameValid = [self isInputValid:self.userNametextField.text];
    BOOL isPasswordValid = [self isInputValid:self.passwordTextField.text];
    
    BOOL isAllInputValid = (isUserNameValid && isPasswordValid) ? true : false;
    
    [self.loginButton setEnabled:isAllInputValid];
    [self.errorLbl setHidden:isAllInputValid];

}


-(IBAction)loginAction:(id)sender{
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    NSString *userName = [defaults objectForKey:@"username"];
    NSString *password = [defaults objectForKey:@"password"];
    
    if([self.userNametextField.text isEqualToString:userName] && [self.passwordTextField.text isEqualToString:password]){
        
        DetailViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
        [self.navigationController pushViewController:controller animated:YES];

    }
    else{
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Invalid Credentials"
                                                            message:@"Please enter valid credentials"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil, nil];
        
        [alertView show];

    }
}

-(BOOL)isInputValid:(NSString *)str{
    if(str.length>=6){
        
        NSString *regex = @"^[a-zA-Z0-9_]*([a-zA-Z][0-9]|[0-9][a-zA-Z])[a-zA-Z0-9_]*$";
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        return [predicate evaluateWithObject:str];
        
   }
    return false;
}

@end
