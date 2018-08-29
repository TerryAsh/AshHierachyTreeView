//
//  AshHierachyTreeView.m
//  AshHierachyTreeView
//
//  Created by 陈震 on 2018/8/28.
//

#import "AshHierachyTreeView.h"
#import "FrameAccessor.h"

static NSString *kCellID = @"AshHierachyTreeViewCellID";

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
        [self _prepareTableViews];
    }
    return self;
}

#pragma mark --private
- (void)_prepareTableViews{
    for (int i = 0; i != self.builder.depth;  i++) {
        UITableView *tableView = [self _createTableView];
        tableView.tag = i;
        tableView.left = (i == 0 ? 0 : self.width);
        [self.allTableViews addObject:tableView];
    }
}

- (UITableView *)_createTableView{
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.frame
                                                          style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.rowHeight = self.builder.rowHeight;
    [tableView registerClass:[UITableViewCell class]
      forCellReuseIdentifier:kCellID];
    
    [self addSubview:tableView];
    
    return tableView;
}

- (NSArray<NSString *> *)_entriesAt:(NSInteger)level index:(NSInteger)index{
    if(0 == level){
        return self.builder.hierachyData.entries;
    }
    //todo
    return self.builder.hierachyData.leafDatas[level].entries;
}

#pragma mark -delegate
#pragma mark --table view

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger level = tableView.tag;
    NSArray<NSString *> *entries = [self _entriesAt:level index:0];
    return entries.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellID forIndexPath:indexPath];
    NSInteger level = tableView.tag;
    NSArray<NSString *> *entries = [self _entriesAt:level index:0];
    cell.textLabel.text = entries[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger level = tableView.tag;
    bool isLastTableTouched = (level == self.builder.depth - 1);
    if(isLastTableTouched){
        
    } else {
        self.allTableViews[level + 1].left = self.width * .5;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
