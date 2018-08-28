//
//  AshHierachyData.m
//  AshHierachyTreeView
//
//  Created by 陈震 on 2018/8/28.
//

#import "AshHierachyData.h"

@interface AshHierachyData()
{
    NSMutableArray<AshHierachyData *>  *_leafDatas_m;
}
@end

@implementation AshHierachyData
@synthesize leafDatas = _leafDatas_m;
@synthesize entries = _entries;

- (instancetype)init{
    if(self = [super init]){
        _leafDatas_m = [NSMutableArray new];
    }
    return self;
}

- (instancetype)initWithEntries:(NSArray<NSString *> *)entries{
    if(self = [self init]){
        _entries = entries.copy;
    }
    return self;
}

- (void)addLeaf:(AshHierachyData *)leaf{
    if(![self->_leafDatas_m containsObject:leaf]){
        [self->_leafDatas_m addObject:leaf];
    }
}

- (void)removeLeaf:(AshHierachyData *)leaf{
    [self->_leafDatas_m removeObject:leaf];
}

@end
