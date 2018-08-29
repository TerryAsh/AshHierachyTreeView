//
//  AshHierachyTreeBuilder.h
//  AshHierachyTreeView
//
//  Created by 陈震 on 2018/8/28.
//

#import <Foundation/Foundation.h>
#import "AshHierachyData.h"

@interface AshHierachyTreeBuilder : NSObject

@property(nonatomic ,strong) UIFont *entryFont;
@property(nonatomic ,strong) UIColor *entryColor;
@property(nonatomic ,strong) UIColor *entryHighlightedColor;
@property(nonatomic ,assign) CGRect frame;
@property(nonatomic ,assign) CGFloat rowHeight;

@property(nonatomic ,assign) NSInteger depth;

@property(nonatomic ,strong ,nonnull) AshHierachyData *hierachyData;

@end
