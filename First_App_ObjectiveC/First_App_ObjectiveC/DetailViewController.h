//
//  DetailViewController.h
//  First_App_ObjectiveC
//
//  Created by Админ on 25.02.16.
//  Copyright © 2016 Melentyev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController {
    
}

@property (strong, nonatomic) NSArray *DetailModal;
@property (weak, nonatomic) IBOutlet UIImageView *imageDetailView;
@property (weak, nonatomic) IBOutlet UILabel *placeDetailView;
@property (weak, nonatomic) IBOutlet UILabel *nameDetailView;

@end