//
//  AshHierachyTreeView.m
//  AshHierachyTreeView
//
//  Created by 陈震 on 2018/8/28.
//

#import "AshHierachyTreeView.h"
#import "FrameAccessor.h"

static NSString *kCellID = @"AshHierachyTreeViewCellID";

typedef NSMutableDictionary<NSNumber *, NSMutableArray<NSIndexPath *> *> LevelAndSeletedIndexPaths_t;

@interface AshHierachyTreeView()<UITableViewDelegate ,UITableViewDataSource>

@property(nonatomic ,strong) AshHierachyTreeBuilder *builder;
@property(nonatomic ,strong) NSMutableArray<UITableView *> *allTableViews;

@property(nonatomic ,strong) LevelAndSeletedIndexPaths_t  *selectedRowDatas;

@end

@implementation AshHierachyTreeView

- (instancetype)init{
    if(self = [super init]){
        _builder = [AshHierachyTreeBuilder new];
        _allTableViews = [NSMutableArray new];
        _selectedRowDatas = [NSMutableDictionary new];
    }
    return self;
}

- (instancetype)initWithBuilder:(AshHierachyTreeBuilding_t)building{
    if(self = [self init]){
        building(self.builder);
        self.frame = self.builder.frame;
        [self _prepareTableViewsAndRowDatas];
    }
    return self;
}

#pragma mark --private
- (void)_prepareTableViewsAndRowDatas{
    for (int i = 0; i != self.builder.depth;  i++) {
        //
        UITableView *tableView = [self _createTableView];
        tableView.tag = i;
        tableView.left = (i == 0 ? 0 : self.width);
        [self.allTableViews addObject:tableView];
        
        //selectedRowDatas
        self.selectedRowDatas[@(i)] = [NSMutableArray new];
    }
}

- (UITableView *)_createTableView{
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.frame
                                                          style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.rowHeight = self.builder.rowHeight;

    [self addSubview:tableView];
    return tableView;
}

- (NSArray<NSString *> *)_entriesAt:(NSInteger)level{
    AshHierachyData *hierachydata = self.builder.rootData;
    if(0 == level || level >= self.builder.depth){
        return hierachydata.entries;
    }
    for (int i = 0; i < level; i++) {
        NSIndexPath *selectedIndexPath = [self.selectedRowDatas[@(i)] firstObject];
        hierachydata = hierachydata.leafDatas[selectedIndexPath.row];
    }
    return hierachydata.entries;
}

- (void)_reloadSubTablesFrom:(NSInteger)level{
    
}

#pragma mark -delegate
#pragma mark --table view

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger level = tableView.tag;
    NSArray<NSString *> *entries = [self _entriesAt:level];
    return entries.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellID];
    if(nil == cell){
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:kCellID];
        cell.textLabel.font = self.builder.entryFont;
        cell.textLabel.textColor = self.builder.entryColor;
    }
    //
    NSInteger level = tableView.tag;
    NSArray<NSString *> *entries = [self _entriesAt:level];
    cell.textLabel.text = entries[indexPath.row];
    
    //
    NSMutableArray<NSIndexPath *> *selectedIndexPaths = self.selectedRowDatas[@(level)];
    if([selectedIndexPaths containsObject:indexPath]){
        cell.textLabel.textColor = self.builder.entryHighlightedColor;
    } else {
        cell.textLabel.textColor = self.builder.entryColor;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger level = tableView.tag;
    bool isLastTableTouched = (level == self.builder.depth - 1);
    NSMutableArray<NSIndexPath *> *selectedIndexPaths = self.selectedRowDatas[@(level)];
    if(isLastTableTouched){
        if([selectedIndexPaths containsObject:indexPath]){
            [selectedIndexPaths removeObject:indexPath];
        } else {
            [selectedIndexPaths addObject:indexPath];
        }
    } else {
        if([selectedIndexPaths containsObject:indexPath]){
            return;
        }
        [selectedIndexPaths removeAllObjects];
        [selectedIndexPaths addObject:indexPath];
        //animate
        [self _reloadSubTablesFrom:level];
    }
    [tableView reloadData];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
