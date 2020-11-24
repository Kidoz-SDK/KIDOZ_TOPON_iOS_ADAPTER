//
//  AppDelegate.h
//  KidozTopOnSample
//
//  Created by Lev Firer on 23/11/2020.
//  Copyright © 2020 Kidoz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

