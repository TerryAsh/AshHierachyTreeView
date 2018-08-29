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
        self.depth = 2;
        self.rowHeight = 30;
        self.frame = CGRectZero;
        self.entryColor = [UIColor blackColor];
        self.entryFont = [UIFont systemFontOfSize:13];
        self.entryHighlightedColor = [UIColor orangeColor];
        
        self.rootData = [[AshHierachyData alloc] init];
    }
    return self;
}


@end
