//
//  AshHierachyTreeBuilder.m
//  AshHierachyTreeView
//
//  Created by 陈震 on 2018/8/28.
//

#import "AshHierachyTreeBuilder.h"

@implementation AshHierachyTreeBuilder

- (instancetype)init{
    if(self = [super init]){
        self.entryFont = [UIFont systemFontOfSize:13];
        self.entryColor = [UIColor blackColor];
        self.entryHighlightedColor = [UIColor orangeColor];
        self.frame = [UIScreen mainScreen].bounds;
        self.depth = 2;
        self.rowHeight = 30;
        
        AshHierachyData *data = [[AshHierachyData alloc] initWithEntries:@[@"0",@"1",@"2",@"3"]];
        [data addLeaf:[[AshHierachyData alloc] initWithEntries:@[@"00",@"01",@"02",@"03"]]];
        [data addLeaf:[[AshHierachyData alloc] initWithEntries:@[@"10",@"11",@"12",@"13"]]];
        [data addLeaf:[[AshHierachyData alloc] initWithEntries:@[@"20",@"21",@"22",@"23"]]];
        [data addLeaf:[[AshHierachyData alloc] initWithEntries:@[@"30",@"31",@"32",@"33"]]];
        
        self.hierachyData = data;

    }
    return self;
}


@end
