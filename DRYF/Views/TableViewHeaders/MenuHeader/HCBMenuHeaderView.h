//
//  HCBMenuHeaderView.h
//  DRYF
//
//  Created by AppsCreationTech on 08/11/15.
//  Copyright © 2015 AppsCreationTech. All rights reserved.
//

#import "HCBBaseView.h"

@interface HCBMenuHeaderView : HCBBaseView

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property(nonatomic, copy) dispatch_block_t onClick;

@end
