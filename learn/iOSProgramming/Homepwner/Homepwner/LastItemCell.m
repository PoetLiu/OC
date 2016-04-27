//
//  LastItemCell.m
//  Homepwner
//
//  Created by liupeng on 16/4/27.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import "LastItemCell.h"

@implementation LastItemCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
	if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
		UILabel *mainLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 220.0, 15.0)];
		mainLabel.tag = MAINLABEL_TAG;
		mainLabel.font = [UIFont systemFontOfSize:14.0];
		mainLabel.textAlignment = NSTextAlignmentRight;
		mainLabel.textColor = [UIColor lightGrayColor];
		self.mainLabel	= mainLabel;
		[self.contentView addSubview:mainLabel];
	}
	return self;
}

@end
