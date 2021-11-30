//
//  ViewController.m
//  DropDownSelection
//  Created by Htet Moe Phyu on 29/11/2021.

#import "ViewController.h"

@interface ViewController (){
    UIView *transparantView;
    UITableView *tableView;
    
    UIButton *selectedButton;
    UIImageView *selectedImage;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Init
    transparantView = [[UIView alloc]init];
    tableView      = [[UITableView alloc]init];
    
    tableView.delegate   = self;
    tableView.dataSource = self;
    
    _mainCateogryButton.layer.cornerRadius = 4;
    _mainCateogryButton.layer.borderWidth  = 0.5;
    
    _subCategoryButton.layer.cornerRadius = 4;
    _subCategoryButton.layer.borderWidth  = 0.5;
}


- (IBAction)mainCategoryButtonPressed:(id)sender {

    selectedButton = _mainCateogryButton;
    selectedImage  = _mainArrowImg;
    
    //show dropdown view
    [self showTransparantDropDownView];
    
}

- (IBAction)subCategoryButtonPressed:(id)sender {
   
    selectedButton = _subCategoryButton;
    selectedImage = _subArrowImg;
    
    //show dropdown view
    [self showTransparantDropDownView];
}

//setup TableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if(!cell){
        [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    }
    cell.textLabel.text = @"category";
    
    return  cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:false];
    
    //hide transparant view
    [self hideTransparantDropDownView];
}

//hide
-(void)hideTransparantDropDownView{
    selectedImage.image = [UIImage imageNamed:@"downArrow"];
    
    [UIView animateWithDuration:0.3 animations:^{
        self->transparantView.alpha = 0;
        self->tableView.frame     = CGRectMake(self->selectedButton.frame.origin.x, self->selectedButton.frame.origin.y + self->selectedButton.frame.size.height , self->selectedButton.frame.size.width, 0);
    }];
}

//show
-(void)showTransparantDropDownView{
    selectedImage.image = [UIImage imageNamed:@"upArrow"];
    transparantView     = [[UIView alloc]init];
    transparantView.frame = self.view.frame;
    
    [self.view addSubview:transparantView];
    
    tableView.frame = CGRectMake(selectedButton.frame.origin.x, selectedButton.frame.origin.y + selectedButton.frame.size.height + 8 , selectedButton.frame.size.width, 160);
    
    [self.view addSubview:tableView];
    
    [tableView.layer setCornerRadius:5];
    tableView.layer.borderWidth = 0.5 ;
    transparantView.alpha      = 0;
    tableView.separatorStyle    = UITableViewCellSeparatorStyleNone;
    
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideTransparantDropDownView)];
    
    [transparantView addGestureRecognizer:gesture];
    
    [transparantView setUserInteractionEnabled:YES];
}

@end
