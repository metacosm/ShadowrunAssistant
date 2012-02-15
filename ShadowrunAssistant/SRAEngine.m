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
#import "SRACharacterRegistry.h"
#import "SRACharacteristicInfoRegistry.h"

@implementation SRAEngine {

}

@synthesize context = _context;
@synthesize name = _name;
@synthesize characterRegistry = _characterRegistry;
@synthesize characteristicRegistry = _characteristicRegistry;
@synthesize supportedAttributes = _supportedAttributes;


- (id)initWith:(NSString const *)name {
  self = [super init];
  if (self) {
    _name = name ? name : DEFAULT_ENGINE_NAME;

    if ([_name isEqual:DEFAULT_ENGINE_NAME]) {
      _supportedAttributes = [NSArray arrayWithObjects:ATTR_AGILITY, ATTR_BODY, ATTR_CHARISMA, ATTR_EDGE, ATTR_INTUITION, ATTR_LOGIC, ATTR_REACTION, ATTR_STRENGTH, ATTR_WILLPOWER, nil];
    }

    _context = [[SRAContext alloc] init];
    _characterRegistry = [[SRACharacterRegistry alloc] initWithEngine:self];
    _characteristicRegistry = [[SRACharacteristicInfoRegistry alloc] initWithEngine:self];
  }

  return self;
}

- (BOOL)isEqual:(id)object {
  if ([object isKindOfClass:[SRAEngine class]]) {
    return [_name isEqual:[object name]];
  }

  return NO;
}


- (int)throwDie {
  return 1 + random() % 6;
}

- (NSArray *)throwDice:(int)diceNumber {
  NSMutableArray *results = [NSMutableArray arrayWithCapacity:diceNumber];
  for (int index = 0; index < diceNumber; index++) {
    [results addObject:[NSNumber numberWithInt:[self throwDie]]];
  }

  return results;
}

- (SRATestResult *)testCharacter:(SRACharacter *)character forTest:(SRATest *)test {
  int dicePool = [test dicePoolFor:character];
  NSArray *diceResults = [self throwDice:dicePool];
  SRATestResult *result = [[SRATestResult alloc] initWithDiceResults:diceResults];
  return result;
}

- (SRATestResult *)testCharacter:(SRACharacter *)character forTest:(SRATest *)test withEdge:(BOOL)useEdge {
  return nil;
}

+ (SRAEngine *)engineNamed:(NSString const *)engineName {
  NSDate *now = [[NSDate alloc] init];
  srandom([now timeIntervalSince1970]);
  return [[SRAEngine alloc] initWith:engineName];
}


+ (SRAEngine *)defaultEngine {
  return [self engineNamed:DEFAULT_ENGINE_NAME];

}
@end
