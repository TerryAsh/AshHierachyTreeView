//
//  AshHierachyTreeView.h
//  AshHierachyTreeView
//
//  Created by 陈震 on 2018/8/28.
//

#import <UIKit/UIKit.h>
#import "AshHierachyTreeBuilder.h"

typedef void (^AshHierachyTreeBuilding_t)(AshHierachyTreeBuilder *bulder);

@interface AshHierachyTreeView : UIView

- (instancetype)initWithBuilder:(AshHierachyTreeBuilding_t)building;

@end
