//
//  ViewController.h
//  DropDownSelection
//
//  Created by Htet Moe Phyu on 29/11/2021.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *mainCategoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *subCategoryLabel;

@property (weak, nonatomic) IBOutlet UIButton *mainCateogryButton;
@property (weak, nonatomic) IBOutlet UIButton *subCategoryButton;

@property (weak, nonatomic) IBOutlet UIImageView *mainArrowImg;
@property (weak, nonatomic) IBOutlet UIImageView *subArrowImg;

@end

