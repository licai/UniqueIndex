//
//  ViewController.h
//  MyCoreData
//
//  Created by Alex on 15/1/29.
//  Copyright (c) 2015年 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    NSManagedObjectContext* managedObjectContext;
}

- (IBAction)AddPersonAction:(UIButton *)sender;

@end

