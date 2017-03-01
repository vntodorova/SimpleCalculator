//
//  ViewController.m
//  Calculator
//
//  Created by Veneta on 3/1/17.
//  Copyright © 2017 Veneta. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>


@end


@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    firstDigit = [[NSString alloc] init];
    secondDigit = [[NSString alloc] init];
    operation = @"";
    tableData = [[NSMutableArray alloc] init];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onNumberButtonPressed:(UIButton *)sender {
    NSString *digit = sender.titleLabel.text;
    
    if([operation isEqualToString:@""]){
        firstDigit = [firstDigit stringByAppendingString:digit];
        self.textField.text = firstDigit;
    } else {
        secondDigit = [secondDigit stringByAppendingString:digit];
        self.textField.text = secondDigit;
    }
}

- (IBAction)onOperationPressed:(UIButton *)sender {
    operation = sender.titleLabel.text;
    self.textField.text = operation;
}

- (IBAction)onResultPressed:(UIButton *)sender {
    int first = firstDigit.intValue;
    int second = secondDigit.intValue;
    int result = 0 ;
    if([operation isEqualToString:@"+"]){
        result = first + second;
    }
    if([operation isEqualToString:@"-"]){
        result = first - second;
    }
    if([operation isEqualToString:@"*"]){
        result = first * second;
    }
    if([operation isEqualToString:@"/"]){
        if(second == 0){
            result = 0;
        } else {
            result = first / second;
        }
        
    }

    self.textField.text = [NSString stringWithFormat:@"%i", result];
    firstDigit = @"";
    secondDigit = @"";
    operation = @"";
}

#pragma mark - Table Delegates

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [tableData count];o
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


@end
