//
//  Created by claprun on 11/9/11.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface SRATestContext : NSObject

- (int)bonus;

- (int)malus;

- (int)threshold;

- (void)setThreshold:(int)threshold;

- (BOOL)edge;

- (void)useEdge:(BOOL)useEdge;

@end