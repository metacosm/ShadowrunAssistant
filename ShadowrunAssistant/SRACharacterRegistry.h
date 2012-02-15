//
//  Created by claprun on 1/7/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class SRACharacter;
@class SRAEngine;


@interface SRACharacterRegistry : NSObject

@property(readonly, weak) SRAEngine *engine;

- (SRACharacterRegistry *)initWithEngine:(SRAEngine *)engine;

- (SRACharacter *)characterNamed:(NSString const *)name;
@end