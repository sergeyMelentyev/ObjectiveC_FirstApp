//
//  DetailViewController.m
//  First_App_ObjectiveC
//
//  Created by Админ on 25.02.16.
//  Copyright © 2016 Melentyev. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.nameDetailView.text = _DetailModal[0];
    self.placeDetailView.text = _DetailModal[1];
    self.imageDetailView.image = [UIImage imageNamed: _DetailModal[2]];
}

@end
