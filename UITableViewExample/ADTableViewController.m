//
//  ADTableViewController.m
//  UITableViewExample
//
//  Created by Armando Di Cianno on 1/22/14.
//  Copyright (c) 2014 Armando Di Cianno. All rights reserved.
//

#import "ADTableViewController.h"
#import "ADCellCat.h"
#import "ADCellDog.h"

// I'm already set to be a delegate and datasource <UITableViewDelegate, UITableViewDataSource>
//   for the view I control.
@interface ADTableViewController ()

@property NSArray *animals;

@end

@implementation ADTableViewController

- (BOOL)prefersStatusBarHidden
{
	return YES;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Since we are the datasource, we need to provide some data.
        //   The datasource can be complex. If it's stored in another class,
        //   you can change the delegate to point to that class.
        self.animals = @[ @{ @"type": @"cat",
                             @"says": @[ @"i can haz cell",
                                         @"cheezeburger table?"
                                         ],
                             },
                          @{ @"type": @"dog",
                             @"says": @[ @"wow cell",
                                         @"so table",
                                         @"much reuse queue"
                                         ],
                             }];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // The tableview is only going to be able to show a finite amount of cells on the screen
    //   at any given time. Creating views can be expensive, so the table view likes to reuse them.
    //   Here, we let the table view know about the types of cells we have, before it tries to
    //   add or dequeue any from it's reuse queue.
    [self.tableView registerClass:[ADCellCat class] forCellReuseIdentifier:@"cat"];
    [self.tableView registerClass:[ADCellDog class] forCellReuseIdentifier:@"dog"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"default"];
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
    return [self.animals count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSDictionary *sectionData = [self.animals objectAtIndex:section];
    return [[sectionData objectForKey:@"says"] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *sectionData = [self.animals objectAtIndex:indexPath.section];
    NSString *type = [sectionData objectForKey:@"type"];
    if (type == nil) type = @"default";
    NSString *says = [[sectionData objectForKey:@"says"] objectAtIndex:indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:type forIndexPath:indexPath];
    
    // Configure the cell...
    if ([cell isKindOfClass:[ADCellCat class]])
    {
        NSLog(@"I'm a cat.");
    }
    else if ([cell isKindOfClass:[ADCellDog class]])
    {
        NSLog(@"I'm a dog.");
    }
    else
    {
        NSLog(@"I assure you, I am a UITableViewCell(%@)", [cell class]);
    }
    
    cell.imageView.image = [UIImage imageNamed:type];
    cell.textLabel.text = says;
    
    [cell setNeedsUpdateConstraints];
    return cell;
}

//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    [cell setNeedsUpdateConstraints];
//}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

@end
