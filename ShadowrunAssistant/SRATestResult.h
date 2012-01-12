//
//  Created by claprun on 11/8/11.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
@class SRATestContext;

@interface SRATestResult : NSObject

@property(readonly, weak) SRATestContext *context;

- (id) initWithDiceResults: (NSArray *)diceResults;

@end