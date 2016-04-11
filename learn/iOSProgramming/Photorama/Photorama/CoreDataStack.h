//
//  CoreDataStack.h
//  Photorama
//
//  Created by liupeng on 16/4/7.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CoreDataStack : NSObject
@property (strong, nonatomic) NSString *managedObjectModelName;
@property (strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (strong, nonatomic) NSURL *applicationDocumentDirectory;
@property (strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (strong, nonatomic) NSManagedObjectContext *mainQueueContext;
-(instancetype)initWithModelName:(NSString *)modelName;
-(void) saveChanges;
@end
