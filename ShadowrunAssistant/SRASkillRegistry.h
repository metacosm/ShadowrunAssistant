//
//  Created by claprun on 1/7/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class SRASkillInfo;


@interface SRASkillRegistry : NSObject
+ (SRASkillInfo *)skillNamed:(NSString *)string;
@end