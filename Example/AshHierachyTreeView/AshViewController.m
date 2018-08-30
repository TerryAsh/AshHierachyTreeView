//
//  AshViewController.m
//  AshHierachyTreeView
//
//  Created by Ash on 08/28/2018.
//  Copyright (c) 2018 Ash. All rights reserved.
//

#import "AshViewController.h"
#import <AshHierachyTreeView/AshHierachyTreeView.h>

@interface AshViewController ()

@property(nonatomic ,strong) AshHierachyTreeView *treeView;

@end

@implementation AshViewController

- (AshHierachyTreeView *)treeView{
    if(nil == _treeView){
        _treeView = [[AshHierachyTreeView alloc] initWithBuilder:^(AshHierachyTreeBuilder *bulder) {
            bulder.frame = [UIScreen mainScreen].bounds;
            bulder.depth = 2;
            
            AshHierachyData *data = [[AshHierachyData alloc] initWithEntries:@[@"0",@"1",@"2",@"3"]];
            [data addLeaf:[[AshHierachyData alloc] initWithEntries:@[@"00",@"01",@"02",@"03"]]];
            [data addLeaf:[[AshHierachyData alloc] initWithEntries:@[@"10",@"11",@"12",@"13"]]];
            [data addLeaf:[[AshHierachyData alloc] initWithEntries:@[@"20",@"21",@"22",@"23"]]];
            [data addLeaf:[[AshHierachyData alloc] initWithEntries:@[@"30",@"31",@"32",@"33"]]];
            bulder.rootData = data;
        }];
    }
    return _treeView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.treeView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
