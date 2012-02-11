//
//  SRAEngine.m
//  ShadowrunAssistant
//
//  Created by Christophe Laprun on 1/8/12.
//  Copyright (c) 2012 JBoss, a division of Red Hat. All rights reserved.
//

#import "SRAEngine.h"
#import "SRATest.h"
#import "SRACharacter.h"
#import "SRATestResult.h"
#import "SRAContext.h"

NSString const *SR4 = @"SR4";
NSString const *DEFAULT_ENGINE_NAME = @"SR4";

@implementation SRAEngine {

}

@synthesize context = _context;
@synthesize name = _name;


- (id)initWith:(NSString *)name {
  self = [super init];
  if (self) {
    _name = name ? name : DEFAULT_ENGINE_NAME;
    _context = [[SRAContext alloc] init];
  }

  return self;
}

- (BOOL)isEqual:(id)object {
  if ([object isKindOfClass:[SRAEngine class]])
  {
    return [_name isEqual:[object name]];
  }

  return NO;
}


- (int) throwDie {
  return 1 + random()%6;
}

- (NSArray *) throwDice: (int) diceNumber {
  NSMutableArray *results = [NSMutableArray arrayWithCapacity:diceNumber];
  for (int index = 0; index < diceNumber; index++) {
    [results addObject:[NSNumber numberWithInt:[self throwDie]]];
  }
  
  return results;
}

- (SRATestResult *)testCharacter:(SRACharacter *)character forTest:(SRATest *)test {
  int dicePool = [test dicePoolFor:character];
  NSArray *diceResults = [self throwDice: dicePool];
  SRATestResult *result = [[SRATestResult alloc] initWithDiceResults: diceResults];
  return result; 
}

- (SRATestResult *)testCharacter:(SRACharacter *)character forTest:(SRATest *)test withEdge:(BOOL)useEdge {
  return nil;
}

+ (SRAEngine *) engineNamed: (NSString *)engineName {
  NSDate *now = [[NSDate alloc] init];
  srandom([now timeIntervalSince1970]);
  return [[SRAEngine alloc] initWith:engineName];
}


+ (SRAEngine *)defaultEngine {
 return [self engineNamed:DEFAULT_ENGINE_NAME];

}
@end
