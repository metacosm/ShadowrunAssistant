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

@implementation SRAEngine

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
  return [[SRAEngine alloc] init];
}


@end
