//
//  ViewController.h
//  First_App_ObjectiveC
//
//  Created by Melentyev on 21.01.16.
//  Copyright © 2016 Melentyev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    NSTimer *timerDisplay;
    NSTimer *dateDisplay;
    int countInt;
}

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UILabel *nsTimerLabel;
@property (weak, nonatomic) IBOutlet UILabel *nsTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *nsDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *randomNumberLabel;
@property (weak, nonatomic) IBOutlet UISwitch *switchButton;
@property (weak, nonatomic) IBOutlet UIButton *randomNimberBtnLabel;

- (IBAction)DisplayText:(id)sender;
- (IBAction)StartNSTimer:(id)sender;
- (IBAction)fadeOutAnimation:(id)sender;
- (IBAction)randomNumberBtn:(id)sender;
- (IBAction)switchButtonAction:(id)sender;
-(void) customTimer;
-(void) currentDate;

@end