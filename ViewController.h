//
//  ViewController.h
//  RecipeBook
//
//  Created by Mac on 10/05/18.
//  Copyright © 2018 Pallavi_Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

//@property NSArray *RecipeImages;
@property NSArray *RecipeNames;

@property NSArray *resultSearch;
@property (strong, nonatomic) IBOutlet UITextField *searchTextOutlet;

- (IBAction)searchAction:(id)sender;

@property (strong, nonatomic) IBOutlet UITableView *tableOutlet;


@end

