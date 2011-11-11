//
//  Created by claprun on 11/9/11.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class SRACharacter;


@interface SRATestContext : NSObject

- (int)bonusFor:(SRACharacter *)character;

- (int)malusFor:(SRACharacter *)character;

- (int)thresholdFor:(SRACharacter *)character;

- (void)setThreshold:(int)threshold for:(SRACharacter *)character;

- (BOOL)edgeFor:(SRACharacter *)character;

- (void)useEdge:(BOOL)useEdge for:(SRACharacter *)character;

@end