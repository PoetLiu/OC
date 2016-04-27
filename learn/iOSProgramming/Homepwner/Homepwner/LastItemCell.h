//
//  LastItemCell.h
//  Homepwner
//
//  Created by liupeng on 16/4/27.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#define MAINLABEL_TAG	1

@interface LastItemCell : UITableViewCell
@property (strong, nonatomic) UILabel *mainLabel;
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
@end
