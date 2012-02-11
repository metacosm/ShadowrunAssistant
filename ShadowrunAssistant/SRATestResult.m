//
//  Created by claprun on 11/8/11.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "SRATestResult.h"
#import "SRAContext.h"

@implementation SRATestResult {
  NSArray *_diceResults;
}

- (id) initWithDiceResults: (NSArray *)diceResults {
  self = [super init];
  if(self)
  {
    _diceResults = [NSArray arrayWithArray:diceResults];
  }
  
  return self;
  
}

@synthesize context = _context;

@end