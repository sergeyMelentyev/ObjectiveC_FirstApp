//
//  ViewController.m
//  First_App_ObjectiveC
//
//  Created by Melentyev on 21.01.16.
//  Copyright © 2016 Melentyev. All rights reserved.

//  ALWAYS USE THREE SIZE IMG FORMAT (fileName@3x.png, fileName@2x.png, fileName.png)

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dateDisplay = [NSTimer scheduledTimerWithTimeInterval: 1.0 target: self selector: @selector(currentDate) userInfo: nil repeats: YES];
    
    // DISPLAY AN IMAGE FROM URL
    self.imageFromUrl.image = [UIImage imageWithData: [NSData dataWithContentsOfURL: [NSURL URLWithString: @"https://upload.wikimedia.org/wikipedia/commons/e/e5/HTTPS_icon.png"]]];
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

// RANDOM NUMBER FROM EXTERNAL SOURCE PLIST
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

// OPEN SAFARY IN FULL SCREEN
-(IBAction) URLLinker: (id) sender {
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString: @"http:www.apple.com"]];
}

// DELAYED ACTION CALL
-(IBAction) DelayedAction: (id) sender {
    [self performSelector: @selector(anySelectorName) withObject: nil afterDelay: 5.0];
}
-(void) anySelectorName {
    
}

// TAG ID SENDER
-(IBAction) TagSenderAsArgument: (id) sender {
    countInt = countInt * 10 + (float)[sender tag];
    self.label.text = [NSString stringWithFormat: @"%i", countInt];
}

// CUSTOM PRINT SCREEN
- (IBAction)customPrintScreen:(id)sender {
    UIGraphicsBeginImageContext(self.view.bounds.size);
    [self.view.layer renderInContext: UIGraphicsGetCurrentContext()];
    UIImage *screenShot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageWriteToSavedPhotosAlbum(screenShot, nil, nil, nil);
}

// SAVE DATA NSUSERDEFAULTS
- (IBAction)saveButton:(id)sender {
    NSString *savedString = self.labelSaveData.text;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject: savedString forKey: @"savedString"];
    [defaults synchronize];
}
- (IBAction)loadButton:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *loadString = [defaults objectForKey: @"savedString"];
    [self.labelSaveData setText: loadString];
}
- (IBAction)dismissActionSaveData:(id)sender {
    [self resignFirstResponder];
    self.labelSaveData.text = self.textSaveData.text;
}

@end
