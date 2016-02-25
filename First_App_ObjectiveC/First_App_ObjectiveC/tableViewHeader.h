//
//  tableViewHeader.h
//  First_App_ObjectiveC
//
//  Created by Админ on 25.02.16.
//  Copyright © 2016 Melentyev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tableViewHeader : UIImageView {
    UILabel *label;
}

-(id) initWithText: (NSString *) text;
-(void) setText: (NSString *) text;

@end