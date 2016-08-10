//
//  ViewController.h
//  TextField_As_Search
//
//  Created by ronakj on 8/8/16.
//  Copyright © 2016 com.ronak.zaptech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
- (IBAction)btn_can:(id)sender;
- (IBAction)btn_cancel:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *txt_name;
@property (weak, nonatomic) IBOutlet UITextField *txt_con_name;
@property (weak, nonatomic) IBOutlet UIView *view_out;
@property (weak, nonatomic) IBOutlet UITableView *tableview_out;
- (void)searchTableList:(NSString*)str;
@end

