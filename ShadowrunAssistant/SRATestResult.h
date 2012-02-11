//
//  Created by claprun on 11/8/11.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
@class SRAContext;

@interface SRATestResult : NSObject

@property(readonly, weak) SRAContext *context;

- (id) initWithDiceResults: (NSArray *)diceResults;

@end