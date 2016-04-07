//
//  Photo+CoreDataProperties.h
//  Photorama
//
//  Created by liupeng on 16/4/7.
//  Copyright © 2016年 liupeng. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Photo.h"

NS_ASSUME_NONNULL_BEGIN

@interface Photo (CoreDataProperties)

@property (nonatomic, retain) NSString *photoID;
@property (nonatomic, retain) NSString *photoKey;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSDate *dateTaken;
@property (nonatomic, retain) NSURL *remoteURL;

@end

NS_ASSUME_NONNULL_END
