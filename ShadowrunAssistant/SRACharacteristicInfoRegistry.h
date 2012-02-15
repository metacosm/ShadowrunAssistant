//
//  Created by claprun on 2/12/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class SRACharacteristicInfo;
@class SRASkillInfo;
@class SRAEngine;


@interface SRACharacteristicInfoRegistry : NSObject
@property(readonly, weak) SRAEngine *engine;

- (SRACharacteristicInfoRegistry *)initWithEngine:(SRAEngine *)engine;

- (SRASkillInfo *)skillNamed:(NSString const*)name;
- (SRACharacteristicInfo *)characteristicInfoNamed:(NSString const *)name;
@end