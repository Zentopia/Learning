//
//  ReactiveCocoaViewController.m
//  Test
//
//  Created by Utopia on 2016/11/3.
//  Copyright © 2016年 Utopia. All rights reserved.
//

#define TextFieldHeight 40
#define TextFieldWidth 200

#import "ReactiveCocoaViewController.h"
#import "UTTextField.h"
#import "UTButton.h"
#import "FRPSignInService.h"
//#import <ReactiveCocoa/ReactiveCocoa.h>

@interface ReactiveCocoaViewController ()

@property (strong, nonatomic)UTTextField *userNameTextField;
@property (strong, nonatomic)UTTextField *passwordTextField;
@property (strong, nonatomic)UTButton *confirmButton;
@property (nonatomic) BOOL passwordIsValid;
@property (nonatomic) BOOL usernameIsValid;
@property (strong, nonatomic)FRPSignInService *signService;

@end

@implementation ReactiveCocoaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createView];
    [self setAutolayout];
    [self updateUIState];
    
//   [[self.userNameTextField.rac_textSignal filter:^BOOL(NSString *text) {
//       return text.length > 3;
//   }] subscribeNext:^(id x) {
//       NSLog(@"%@", x);
//   }];
//    
    // Do any additional setup after loading the view.
    NSInteger i = 0;
    
    switch (i) {
        case 1:
        {
            NSInteger a = 0;
        }
            break;
            
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createView{
    self.title = @"ReactiveCocoa";
    [self.view addSubview:self.userNameTextField];
    [self.view addSubview:self.passwordTextField];
    [self.view addSubview:self.confirmButton];
}

- (void)setAutolayout{
    [self.userNameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(TextFieldHeight);
        make.width.mas_equalTo(TextFieldWidth);
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).offset(100);
    }];
    
    [self.passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self.userNameTextField);
        make.width.equalTo(self.userNameTextField);
        make.centerX.equalTo(self.userNameTextField);
        make.top.mas_equalTo(self.userNameTextField.mas_bottom).offset(20);
    }];
    
    [self.confirmButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self.passwordTextField);
        make.centerX.equalTo(self.passwordTextField);
        make.top.mas_equalTo(self.passwordTextField.mas_bottom).offset(20);
    }];
}

- (UITextField *)userNameTextField{
    if (!_userNameTextField) {
        _userNameTextField = [UTTextField new];
        _userNameTextField.backgroundColor = [UIColor yellowColor];
        [_userNameTextField addTarget:self action:@selector(userNameTextFieldChanged:) forControlEvents:UIControlEventEditingChanged];
    }
    
    return _userNameTextField;
}

- (UITextField *)passwordTextField{
    if (!_passwordTextField) {
        _passwordTextField = [UTTextField new];
        _passwordTextField.backgroundColor = [UIColor yellowColor];
        [_passwordTextField addTarget:self action:@selector(passwordTextFieldChanged:) forControlEvents:UIControlEventEditingChanged];
    }
    
    return _passwordTextField;
}

- (void)userNameTextFieldChanged:(UITextField *)textField{
    self.usernameIsValid = [self isValidUsername:textField.text];
    [self updateUIState];
}

- (void)passwordTextFieldChanged:(UITextField *)textField{
    self.passwordIsValid = [self isValidPassword:textField.text];
    [self updateUIState];
}

- (UIButton *)confirmButton{
    if (!_confirmButton) {
        _confirmButton = [UTButton new];
        _confirmButton.enabled = NO;
        _confirmButton.backgroundColor = [UIColor grayColor];
        [_confirmButton setTitle:NSLocalizedString(@"确定", nil) forState:UIControlStateNormal];
        [_confirmButton addTarget:self action:@selector(confirmAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _confirmButton;
}

- (void)confirmAction:(UIButton *)btn{
    btn.enabled = NO;
    self.confirmButton.backgroundColor = self.confirmButton.enabled? [UIColor redColor] : [UIColor grayColor];
    
    [self.signService signInWithUsername:self.userNameTextField.text password:self.passwordTextField.text complete:^(BOOL success) {
        btn.enabled = YES;
        self.confirmButton.backgroundColor = self.confirmButton.enabled? [UIColor redColor] : [UIColor grayColor];
        
        if (success) {
            [self performSegueWithIdentifier:@"signInSuccess" sender:self];
        }
    }];
    
}

- (BOOL)isValidUsername:(NSString *)username {
    return username.length > 3;
}

- (BOOL)isValidPassword:(NSString *)password {
    return password.length > 3;
}

- (void)updateUIState {
    self.userNameTextField.backgroundColor = self.usernameIsValid ? [UIColor clearColor] : [UIColor yellowColor];
    self.passwordTextField.backgroundColor = self.passwordIsValid ? [UIColor clearColor] : [UIColor yellowColor];
    self.confirmButton.enabled = self.usernameIsValid && self.passwordIsValid;
    self.confirmButton.backgroundColor = self.confirmButton.enabled? [UIColor redColor] : [UIColor grayColor];
}

- (FRPSignInService *)signService{
    if (!_signService) {
        _signService = [FRPSignInService new];
    }
    
    return _signService;
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
