//
//  ViewController.h
//  Calculator
//
//  Created by Veneta on 3/1/17.
//  Copyright © 2017 Veneta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    NSString *firstDigit;
    NSString *secondDigit;
    NSString *operation;
    NSMutableArray *tableData;
}

@property (weak, nonatomic) IBOutlet UITextField *textField;

- (IBAction)onNumberButtonPressed:(UIButton *)sender;
- (IBAction)onOperationPressed:(UIButton *)sender;
- (IBAction)onResultPressed:(UIButton *)sender;

@end

