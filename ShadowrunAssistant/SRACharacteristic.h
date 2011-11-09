//
//  Created by claprun on 11/6/11.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class SRAPropertyType;


@interface SRACharacteristic : NSObject {
}

- (int)unmodifiedValue;

- (int)modifiedValue;

+ (SRACharacteristic *)propertyNamed:(NSString *)name ofType:(SRAPropertyType *)type withValue:(int)value;
@end

