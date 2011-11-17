//
//  Created by claprun on 11/6/11.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class SRACharacteristicType;


@interface SRACharacteristicType : NSObject

@property(readonly, copy) NSString *name;

+ (SRACharacteristicType *)attribute;

+ (SRACharacteristicType *)skill;
@end