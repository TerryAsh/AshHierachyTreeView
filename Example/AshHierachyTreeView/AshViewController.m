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
            bulder.frame = self.view.frame;
            bulder.depth = 2;
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
