//
//  Created by claprun on 11/8/11.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "SRACharacteristicInfo.h"


@interface SRASkillInfo : SRACharacteristicInfo

@property(readonly, weak) SRACharacteristicInfo *linkedAttribute;

@end