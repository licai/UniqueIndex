//
//  ViewController.m
//  MyCoreData
//
//  Created by Alex on 15/1/29.
//  Copyright (c) 2015年 Alex. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "UniqueIndex.h"
#import <CoreData/CoreData.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    id delegate = [[UIApplication sharedApplication] delegate];
    managedObjectContext = [delegate managedObjectContext];    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)AddPersonAction:(UIButton *)sender
{
    Person *person=(Person *)[NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:managedObjectContext];
    person.name=@"Alex";
    person.id = [NSNumber numberWithInt:[UniqueIndex getIndex:@"Person" context:managedObjectContext]];
    
    NSError *error;
    if (![managedObjectContext save:&error]) {
        NSLog(@"error!");
    }
    
    [self printAllPerson];
}

-(void)printAllPerson
{
    NSError *error;
    NSFetchRequest *request=[[NSFetchRequest alloc] init];
    NSEntityDescription *entity=[NSEntityDescription entityForName:@"Person" inManagedObjectContext:managedObjectContext];
    [request setEntity:entity];
    
    NSArray *results=[[managedObjectContext executeFetchRequest:request error:&error] copy];
    for (Person *p in results) {
        NSLog(@"person : %@ , %@", p.name, p.id);
    }
}

@end
