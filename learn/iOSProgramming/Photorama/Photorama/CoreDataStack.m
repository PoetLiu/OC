//
//  CoreDataStack.m
//  Photorama
//
//  Created by liupeng on 16/4/7.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import "CoreDataStack.h"

@implementation CoreDataStack
-(instancetype)initWithModelName:(NSString *)modelName {
	if (self = [super init]) {
		self.managedObjectModelName	= modelName;
		NSURL *modelURL = [[NSBundle mainBundle] URLForResource:self.managedObjectModelName withExtension:@"momd"];
		self.managedObjectModel	= [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
		self.applicationDocumentDirectory = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
		NSPersistentStoreCoordinator *coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];
		NSString *pathComponent = [self.managedObjectModelName stringByAppendingPathExtension:@"sqlite"];
		NSURL *url = [self.applicationDocumentDirectory URLByAppendingPathComponent:pathComponent];
		[coordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:url options:nil error:nil];
		self.persistentStoreCoordinator = coordinator;
		self.mainQueueContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
		self.mainQueueContext.persistentStoreCoordinator	= self.persistentStoreCoordinator;
		self.mainQueueContext.name	= @"Main Queue Context (UI Context)";
		
	}
	return self;
}

-(void) saveChanges {
	[self.mainQueueContext performBlockAndWait:^{
		if ([self.mainQueueContext hasChanges]) {
			[self.mainQueueContext save:nil];
		}
	}];
}
@end
