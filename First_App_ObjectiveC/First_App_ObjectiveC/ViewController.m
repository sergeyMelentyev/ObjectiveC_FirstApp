//
//  ViewController.m
//  First_App_ObjectiveC
//
//  Created by Melentyev on 21.01.16.
//  Copyright © 2016 Melentyev. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dateDisplay = [NSTimer scheduledTimerWithTimeInterval: 1.0 target: self selector: @selector(currentDate) userInfo: nil repeats: YES]; 
}

// WORKING WITH TEXT AND LABELS
- (IBAction)DisplayText:(id)sender {
    [self resignFirstResponder];
    self.label.text = self.textField.text;
    self.label.textColor = [UIColor redColor];
    [self.label setFont: [UIFont fontWithName: @"Verdana" size: 18]];
    self.label.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.label.layer.shadowOpacity = 0.5;
    self.label.layer.shadowRadius = 1.0f;
    self.label.layer.shadowOffset = CGSizeMake(0, 0);
    self.label.textAlignment = NSTextAlignmentCenter;
}

// NSTIMER
- (IBAction)StartNSTimer:(id)sender {
    countInt = 0;
    self.nsTimerLabel.text = [NSString stringWithFormat: @"%i", countInt];      // int to string
    timerDisplay = [NSTimer scheduledTimerWithTimeInterval: 1.0 target: self selector: @selector(customTimer) userInfo: nil repeats: YES];
    [sender setTitle: @"New Name" forState: UIControlStateNormal];              // change btn name
    // [timer invalidate]                                                       // stop the timer
}
-(void) customTimer {
    ++countInt;
    self.nsTimerLabel.text = [NSString stringWithFormat: @"%i", countInt];
}
-(void) currentDate {
    NSDateFormatter *timeFormater = [[NSDateFormatter alloc] init];
    [timeFormater setDateFormat: @"hh:mm:ss"];
    self.nsTimeLabel.text = [timeFormater stringFromDate: [NSDate date]];
    
    NSDateFormatter * dateFormater = [[NSDateFormatter alloc] init];
    [dateFormater setDateFormat: @"YYYY-MM-dd"];
    self.nsDateLabel.text = [dateFormater stringFromDate: [NSDate date]];
}

// SIMPLE ANIMATION
- (IBAction)fadeOutAnimation:(id)sender {
    [UIView beginAnimations: nil context: nil];
    [UIView setAnimationDuration: 2.0];
    [self.label setAlpha: 0];
    [UIView commitAnimations];
}

// RANDOM NUMBER FROM EXTERNAL SOURCE
- (IBAction)randomNumberBtn:(id)sender {
    NSString *fileName = [[NSBundle mainBundle] pathForResource: @"extArray" ofType: @"plist"];
    NSDictionary *dictionaryCreate = [[NSDictionary alloc] initWithContentsOfFile: fileName];
    NSMutableArray *itemInDictionary = [dictionaryCreate valueForKey: @"anyNameArray"];
    int randomNumberGen = arc4random() % [itemInDictionary count];
    NSString *indexContent = [itemInDictionary objectAtIndex: randomNumberGen];
    [self.randomNumberLabel setText: [[NSString alloc] initWithFormat: @"%@", indexContent]];
}

// SWITCHES, BUTTONS
- (IBAction)switchButtonAction:(id)sender {
    if (self.switchButton.on) {
        self.randomNimberBtnLabel.enabled = YES;
        [self.segmentController setEnabled: YES forSegmentAtIndex: 1];
    } else {
        self.randomNimberBtnLabel.enabled = NO;
        [self.segmentController setEnabled: NO forSegmentAtIndex: 1];
    }
}

// SEGMETS
- (IBAction)segmentButtons:(id)sender {
    switch (self.segmentController.selectedSegmentIndex) {
        case 0:
            self.segmentLabel.text = @"First segment selected";
            break;
        case 1:
            self.segmentLabel.text = @"Second segment selected";
            break;
        case 2:
            self.segmentLabel.text = @"Third segment selected";
            break;
        default:
            break;
    }
}

// SLIDERS
- (IBAction)sliderButton:(id)sender {
    [self.segmentLabel setFont: [UIFont fontWithName: @"Verdana" size: self.sliderController.value]];
}

// SHAKE GESTURES
-(void) motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (event.subtype == UIEventSubtypeMotionShake) {
        self.segmentLabel.text = @"The device was shaken";
    }
}





@end









