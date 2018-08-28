//
//  AshHierachyData.h
//  AshHierachyTreeView
//
//  Created by 陈震 on 2018/8/28.
//

#import <Foundation/Foundation.h>

@interface AshHierachyData : NSObject

- (instancetype)initWithEntries:(NSArray<NSString *> *)entries;

@property(nonatomic ,readonly ,copy) NSArray<NSString *> *entries;
@property(nonatomic ,readonly) NSArray<AshHierachyData *> *leafDatas;

- (void)addLeaf:(AshHierachyData *)leaf;
- (void)removeLeaf:(AshHierachyData *)leaf;

@end
