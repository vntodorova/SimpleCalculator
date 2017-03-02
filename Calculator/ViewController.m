//
//  ViewController.m
//  Calculator
//
//  Created by Veneta on 3/1/17.
//  Copyright © 2017 Veneta. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>


@end


@implementation ViewController

NSString *firstDigit;
NSString *secondDigit;
NSString *operation;
NSMutableArray *tableDataResult;
NSMutableArray *tableDataExpr;


- (void)viewDidLoad {
    [super viewDidLoad];
    firstDigit = [[NSString alloc] init];
    secondDigit = [[NSString alloc] init];
    operation = @"";
    tableDataResult = [[NSMutableArray alloc] init];
    tableDataExpr = [[NSMutableArray alloc] init];
    
    
    UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc]
                                          initWithTarget:self action:@selector(handleLongPress:)];
    lpgr.minimumPressDuration = 2.0; //seconds
    lpgr.delegate = self;
    [self.tableView addGestureRecognizer:lpgr];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer
{
    CGPoint p = [gestureRecognizer locationInView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:p];
    NSString *copyString = [tableDataResult objectAtIndex:indexPath.row];
    UIPasteboard *pb = [UIPasteboard generalPasteboard];
    [pb setString:copyString];
    NSLog(@"Copied to clipboard : %s",[copyString UTF8String]);
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

    [[self tableView] beginUpdates];
    
    [tableDataResult addObject:[NSString stringWithFormat:@"%i",result]];
    NSArray *path  = [NSArray arrayWithObject:[NSIndexPath indexPathForRow:tableDataResult.count -1 inSection:0]];
    [[self tableView] insertRowsAtIndexPaths: path withRowAnimation:UITableViewRowAnimationTop];
    
    [tableDataExpr addObject:[NSString stringWithFormat:@"%i %s %i",first,[operation UTF8String],second]];

    self.textField.text = [NSString stringWithFormat:@"%i", result];
    
    [[self tableView] endUpdates];
    
    firstDigit = @"";
    secondDigit = @"";
    operation = @"";
}

#pragma mark - Table Delegates

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [tableDataResult count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
        static NSString *cellId = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    cell.textLabel.text = [tableDataResult objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [tableDataExpr objectAtIndex:indexPath.row];
    
    return cell;
}


@end
