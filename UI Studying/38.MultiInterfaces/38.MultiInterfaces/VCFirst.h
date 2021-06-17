//
//  VCFirst.h
//  38.MultiInterfaces
//
//  Created by 张博添 on 2021/6/9.
//

#import <UIKit/UIKit.h>
#import "VCSecond.h"

NS_ASSUME_NONNULL_BEGIN

@interface VCFirst : UIViewController <VCSecondDelegate>

-(void) changeColer:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
