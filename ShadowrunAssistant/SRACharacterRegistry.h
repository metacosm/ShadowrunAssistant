//
//  Created by claprun on 1/7/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class SRACharacter;


@interface SRACharacterRegistry : NSObject
+ (SRACharacter *)characterNamed:(NSString const *)name;
@end