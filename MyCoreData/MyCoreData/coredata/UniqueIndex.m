//
//  UniqueIndex.m
//  MyCoreData
//
//  Created by Alex on 15/1/29.
//  Copyright (c) 2015年 Alex. All rights reserved.
//

#import "UniqueIndex.h"
#import "Unique.h"

@implementation UniqueIndex

+(int) getIndex:(NSString*)table context:(NSManagedObjectContext*)c
{
    NSError *error;
    NSFetchRequest *request=[[NSFetchRequest alloc] init];
    NSEntityDescription *entity=[NSEntityDescription entityForName:@"Unique" inManagedObjectContext:c];
    [request setEntity:entity];
    
    NSArray *results=[[c executeFetchRequest:request error:&error] copy];
    
    for (Unique *u in results)
    {
        NSString* tableValue = [u valueForKey:@"table"];
        if ([table compare:tableValue] == NSOrderedSame) {
            int currentIndex = [[u valueForKey:@"index"] intValue];
            int newIndex = currentIndex + 1;
            
            u.index = [NSNumber numberWithInt:newIndex];
            
            return currentIndex;
        }
    }
    return -1;
}

+(BOOL)buildIndex:(NSString*)table startIndex:(int)index context:(NSManagedObjectContext*)c
{
    if ([UniqueIndex checkTable:table context:c]) {
        return YES;
    }
    
    Unique *u=(Unique *)[NSEntityDescription insertNewObjectForEntityForName:@"Unique" inManagedObjectContext:c];
    u.table=table;
    u.index = [NSNumber numberWithInt:index];
    
    NSError *error;
    
    if (![c save:&error]) {
        return NO;
    }
    
    return YES;
}

+(BOOL)checkTable:(NSString*)table context:(NSManagedObjectContext*)c
{
    NSError *error;
    NSFetchRequest *request=[[NSFetchRequest alloc] init];
    NSEntityDescription *entity=[NSEntityDescription entityForName:@"Unique" inManagedObjectContext:c];
    [request setEntity:entity];
    
    NSArray *results=[[c executeFetchRequest:request error:&error] copy];
    
    for (Unique *u in results)
    {
        NSString* tableValue = [u valueForKey:@"table"];
        if ([table compare:tableValue] == NSOrderedSame) {
            return YES;
        }
    }
    return NO;
}

@end
