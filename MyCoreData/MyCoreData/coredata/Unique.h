//
//  Unique.h
//  MyCoreData
//
//  Created by Alex on 15/1/29.
//  Copyright (c) 2015年 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Unique : NSManagedObject

@property (nonatomic, retain) NSString * table;
@property (nonatomic, retain) NSNumber * index;

@end
