//
//  Created by claprun on 11/6/11.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class SRACharacteristicType;
@class SRACharacteristicInfo;


@interface SRACharacteristic : NSObject {
}

@property(readonly) int unmodifiedValue;
@property(readonly, weak) SRACharacteristicInfo *info;
@property(readonly) NSString *name;
@property(readonly, weak) SRACharacteristicType *type;

+ (SRACharacteristic *)characteristic:(SRACharacteristicInfo *)characteristicInfo withValue:(int)value;

- (id)initWith:(SRACharacteristicInfo *)info withValue:(int)value;
@end

