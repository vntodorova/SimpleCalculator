//
//  ViewController.h
//  Calculator
//
//  Created by Veneta on 3/1/17.
//  Copyright © 2017 Veneta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    }

@property (weak, nonatomic) IBOutlet UITextField *textField;

- (IBAction)onNumberButtonPressed:(UIButton *)sender;
- (IBAction)onOperationPressed:(UIButton *)sender;
- (IBAction)onResultPressed:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

