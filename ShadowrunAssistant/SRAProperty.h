//
//  Created by claprun on 11/6/11.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class SRAPropertyType;


@interface SRAProperty : NSObject
{
}

@property(readonly) int value;
@property(readonly) int modifiedValue;

+ (SRAProperty *) propertyNamed: (NSString *)name ofType: (SRAPropertyType *) type withValue: (int)value;
@end

