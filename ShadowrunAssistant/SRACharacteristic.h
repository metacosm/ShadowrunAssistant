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

- (int)unmodifiedValue;

- (int)modifiedValue;

- (SRACharacteristicInfo *)info;

- (NSString *)name;

+ (SRACharacteristic *)characteristicNamed:(NSString *)name ofType:(SRACharacteristicType *)type withValue:(int)value;

@end

