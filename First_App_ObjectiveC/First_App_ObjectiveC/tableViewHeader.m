//
//  tableViewHeader.m
//  First_App_ObjectiveC
//
//  Created by Админ on 25.02.16.
//  Copyright © 2016 Melentyev. All rights reserved.
//

#import "tableViewHeader.h"

@implementation tableViewHeader


-(id) initWithText: (NSString *) text {
    UIImage *img = [UIImage imageNamed: @"1.jpg"];
    if ((self = [super initWithImage: img])) {
        label = [[UILabel alloc] initWithFrame: CGRectMake(20, 10, 200, 40)];
        label.textColor = [UIColor whiteColor];
        label.backgroundColor = [UIColor clearColor];
        label.font = [UIFont systemFontOfSize: 30];
        label.text = text;
        label.numberOfLines = 1;
        [self addSubview: label];
    }
    return self;
}

-(void) setText: (NSString *) text {
    label.text = text;
    
}

@end