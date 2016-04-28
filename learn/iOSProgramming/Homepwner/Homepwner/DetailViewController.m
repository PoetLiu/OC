//
//  DetailViewController.m
//  Homepwner
//
//  Created by liupeng on 16/3/29.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import "DetailViewController.h"
#import "DatePickerViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	[textField resignFirstResponder];
	return true;
}
- (IBAction)changeCreatedDate:(id)sender {
	DatePickerViewController *datePickerViewController = [[DatePickerViewController alloc]init];
	datePickerViewController.item	= self.item;
	[self.navigationController pushViewController:datePickerViewController animated:YES];
}

- (IBAction)backgroundTapped:(UITapGestureRecognizer *)sender {
	[self.view endEditing:true];
}
- (IBAction)takePicture:(UIBarButtonItem *)sender {
	UIImagePickerController	*imagePicker = [[UIImagePickerController alloc] init];
	// If the device has a camera, take a picture; Otherwise,
	// just pick from photo library
	if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
		imagePicker.sourceType	= UIImagePickerControllerSourceTypeCamera;
	} else {
		imagePicker.sourceType	= UIImagePickerControllerSourceTypePhotoLibrary;
	}
	imagePicker.delegate	= self;
	[self presentViewController:imagePicker animated:true completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
	// Get picked image from info dictionary.
	UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
	[self.imageStore setImage:image forKey:self.item.itemKey];
	// Put that image on the screen in the image view.
	self.imageView.image	= image;
	
	// Take image picker off the screen
	// you must call this dismiss method.
	[self dismissViewControllerAnimated:true completion:nil];
}

-(NSString *)dateStringWithDate:(NSDate *)date {
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateFormat:@"YYYY/MM/dd HH:mm:ss"];
	return [dateFormatter stringFromDate:date];
}
- (void) viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	self.navigationItem.title	= self.item.name;
	self.nameField.text 	= self.item.name;
	self.serialNumberField.text	= self.item.serialNumber;
	self.valueField.text	= [[NSString alloc] initWithFormat:@"%ld", (long)self.item.valueInDollars];
	self.dateLabel.text		= [[NSString alloc] initWithFormat:@"%@", [self dateStringWithDate:self.item.dateCreated]];
	self.imageView.image	= [self.imageStore imageForKey:self.item.itemKey];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
	
	// Clear first responder
	[self.view endEditing:true];
	
    // Save change to item
    self.item.name  = self.nameField.text;
    self.item.serialNumber  = self.serialNumberField.text;
    NSInteger value = [self.valueField.text integerValue];
    if (value > 0) {
        self.item.valueInDollars    = value;
    } else {
        self.item.valueInDollars    = 0;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
@end
