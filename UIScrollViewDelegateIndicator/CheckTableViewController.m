//
//  CheckTableViewController.m
//  UIScrollViewDelegateExample
//
//  Created by Naoyuki Takura on 2014/04/29.
//  Copyright (c) 2014年 Naoyuki Takura. All rights reserved.
//

#import "CheckTableViewController.h"
#import "CoordinateView.h"

static const NSInteger MAX_NUMBER_OF_ARRAY = 50;

@interface CheckTableViewController ()
@property (strong, nonatomic) NSArray *numbersArray;
@end

@implementation CheckTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //create dummy data.
    NSMutableArray *array = [[NSMutableArray alloc]init];
    for (int i=0; i < MAX_NUMBER_OF_ARRAY; i++) {
        array[i] = @(i);
    }
    self.numbersArray = [array copy];
    
    //create coordinate view.
    UINib *nib = [UINib nibWithNibName:@"coordinateView" bundle:nil];
    CoordinateView *coordinateView = [[nib instantiateWithOwner:self options:kNilOptions] objectAtIndex:0];
    
    CGFloat width = self.tableView.frame.size.width;
    CGRect rect = coordinateView.frame;
    coordinateView.frame = CGRectMake(width/2 - rect.size.width/2, 100, rect.size.width, rect.size.height);
    coordinateView.layer.cornerRadius = 3.0f;
    coordinateView.layer.borderColor = [UIColor grayColor].CGColor;
    coordinateView.layer.borderWidth = 0.5f;
    coordinateView.layer.shadowColor = [UIColor grayColor].CGColor;
    coordinateView.layer.shadowOffset = CGSizeMake(0.0, 0.0);
    coordinateView.layer.shadowRadius = 2.0f;
    coordinateView.layer.shadowOpacity = 0.3f;
    //disable scrolls to top.
    coordinateView.textView.scrollsToTop = NO;

    [self.tableView addSubview:coordinateView];
    
    //scrollview delegate
    self.tableView.delegate = (id)coordinateView;
    self.tableView.scrollsToTop = YES;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return MAX_NUMBER_OF_ARRAY;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * const cell_id = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_id forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", _numbersArray[indexPath.row]];
    
    return cell;
}

@end
