//
//  ViewController.m
//  AutoLayoutCellHeight
//
//  Created by 曹永超 on 17/3/14.
//  Copyright © 2017年 Huitu. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell.h"
#import "ChangeFrameCell.h"
#import "Masonry.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) CustomCell *cell;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view setTranslatesAutoresizingMaskIntoConstraints:YES];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    
    [self.tableView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    _tableView.delegate = self;
    
    _tableView.dataSource = self;
    
    [_tableView registerClass:[ChangeFrameCell class] forCellReuseIdentifier:@"cell"];
    
    _tableView.estimatedRowHeight = 100;
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    [self.view addSubview:_tableView];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@" indexPath - row : %ld",indexPath.row);
    
    ChangeFrameCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.tag = indexPath.row;
    
    NSMutableString *mS = [[NSMutableString alloc] init];
    
    NSInteger count = arc4random() % 10 + 1;
    
    for (int i = 0; i < count; i ++) {
        
        [mS appendString:@"RRRRRRRRR"];
    }
    
    cell.content = mS;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1000;
}

//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    
//    return 100;
//}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSLog(@"%ld   ,333333333",indexPath.row);
//    
//    NSLog(@"%@",_cell.LB.text);
//    
////    [_cell.LB sizeToFit];
//    
//    CGFloat height = _cell.LB.frame.size.height + 20;
//    
//    [_cell layoutIfNeeded];
//    
//    NSLog(@"%lf",height);
//    
//    return height;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
