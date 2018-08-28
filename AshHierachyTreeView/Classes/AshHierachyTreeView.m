//
//  AshHierachyTreeView.m
//  AshHierachyTreeView
//
//  Created by 陈震 on 2018/8/28.
//

#import "AshHierachyTreeView.h"

@interface AshHierachyTreeView()<UITableViewDelegate ,UITableViewDataSource>

@property(nonatomic ,strong) AshHierachyTreeBuilder *builder;
@property(nonatomic ,strong) NSMutableArray<UITableView *> *allTableViews;

@end

@implementation AshHierachyTreeView

- (instancetype)init{
    if(self = [super init]){
        _builder = [AshHierachyTreeBuilder new];
        _allTableViews = [NSMutableArray new];
    }
    return self;
}

- (instancetype)initWithBuilder:(AshHierachyTreeBuilding_t)building{
    if(self = [self init]){
        building(self.builder);
        self.frame = self.builder.frame;
    }
    return self;
}


#pragma mark --private
- (void)_prepareTableViews{
    for (int i = 0; i != self.builder.depth;  i++) {
        UITableView *tableView = [self _createTableView];
        [self.allTableViews addObject:tableView];
    }
}

- (UITableView *)_createTableView{
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.builder.frame
                                                          style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    return tableView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
