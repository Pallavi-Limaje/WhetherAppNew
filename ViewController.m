//
//  ViewController.m
//  RecipeBook
//
//  Created by Mac on 10/05/18.
//  Copyright © 2018 Pallavi_Mac. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tableOutlet.delegate=self;
    self.tableOutlet.dataSource=self;
    
    //self.RecipeImages=[NSArray arrayWithObjects:@"vadapav.jpg",@"cutlet1.jpg",@"misal.jpg",@"vadaSambar.jpg",@"onionbhajji.jpg",@"images.jpg",nil];
    
    self.RecipeNames=[NSArray arrayWithObjects:@"Vada Pav",@"Cutlets",@"Misal Pav",@"Vada Sambar",@"Onion Bhajji",@"Veg Wraps",nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(self.resultSearch.count > 0)
        return self.resultSearch.count;
    else
        return self.RecipeNames.count;
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.contentView.backgroundColor=self.tableOutlet.backgroundColor;
    NSString *RName;
   // UIImage *Rimage;
    if(self.resultSearch.count <=0)
    {
        RName=[self.RecipeNames objectAtIndex:indexPath.row];
    }
    else
    {
        RName=[self.resultSearch objectAtIndex:indexPath.row];
        
        
    }
    
    cell.textFieldOutlet.text=RName;
    //Rimage=[self.RecipeImages objectAtIndex:indexPath.row];
    //cell.imageOutlet.image=Rimage;
    return cell;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    NSString *search=textField.text;
    if(textField==self.searchTextOutlet && self.searchTextOutlet.text.length>0)
    {
        NSPredicate *searchPredicate=[NSPredicate predicateWithFormat:@"SELF contains[c] %@",search];
        NSLog(@"%@",searchPredicate);
        self.resultSearch=[self.RecipeNames filteredArrayUsingPredicate:searchPredicate];
        [self.tableOutlet reloadData];
        NSLog(@"%@",self.resultSearch);
        
        
    }
    return YES;
    
}

- (IBAction)searchAction:(id)sender {
    
    UITextField *textField=sender;

    NSString *search=textField.text;
    if(textField==self.searchTextOutlet && self.searchTextOutlet.text.length>0)
    {
        NSPredicate *searchPredicate=[NSPredicate predicateWithFormat:@"SELF contains[c] %@",search];
        NSLog(@"%@",searchPredicate);
        self.resultSearch=[self.RecipeNames filteredArrayUsingPredicate:searchPredicate];
        [self.tableOutlet reloadData];
        NSLog(@"%@",self.resultSearch);
        
    }
    
    
    
}
@end
