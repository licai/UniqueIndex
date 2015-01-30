//
//  UniqueIndex.h
//  MyCoreData
//
//  Created by Alex on 15/1/29.
//  Copyright (c) 2015年 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface UniqueIndex : NSObject

+(int) getIndex:(NSString*)table context:(NSManagedObjectContext*)c;

+(BOOL)buildIndex:(NSString*)table startIndex:(int)index context:(NSManagedObjectContext*)c;

@end
