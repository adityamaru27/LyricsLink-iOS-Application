//
//  basicOauth.h
//  LyricsLink
//
//  Created by Aditya Maru on 2016-04-29.
//  Copyright © 2016 Aditya Maru. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)logIn:(id)sender;

@property (nonatomic, readwrite, copy) NSArray *scopes;
@property (nonatomic, readwrite, copy) NSArray *scopeDisplayNames;
@property (nonatomic, readwrite, strong) NSMutableArray *selectedScopes;

@end