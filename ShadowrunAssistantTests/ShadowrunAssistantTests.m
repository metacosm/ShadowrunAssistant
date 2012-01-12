//
//  ShadowrunAssistantTests.m
//  ShadowrunAssistantTests
//
//  Created by Chris Laprun on 11/06/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ShadowrunAssistantTests.h"
#import "SRATest.h"
#import "SRASkillInfo.h"
#import "SRATestResult.h"
#import "SRAEngine.h"
#import "SRACharacter.h"
#import "SRACharacterRegistry.h"
#import "SRASkillRegistry.h"

@implementation ShadowrunAssistantTests

- (void)setUp {
  [super setUp];

  // Set-up code here.
}

- (void)tearDown {
  // Tear-down code here.

  [super tearDown];
}

- (void)testDiceThrowing {
  SRAEngine *engine = [SRAEngine engineNamed:@"SR4"];
  NSMutableDictionary *results = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  [NSNumber numberWithInt:0], [NSNumber numberWithInt:1], 
                                  [NSNumber numberWithInt:0], [NSNumber numberWithInt:2],
                                  [NSNumber numberWithInt:0], [NSNumber numberWithInt:3],
                                  [NSNumber numberWithInt:0], [NSNumber numberWithInt:4],
                                  [NSNumber numberWithInt:0], [NSNumber numberWithInt:5],
                                  [NSNumber numberWithInt:0], [NSNumber numberWithInt:6],
                                  nil];
  for (int i = 0; i < 6000; i++) {
    int result = [engine throwDie];
    NSNumber *key = [NSNumber numberWithInt:result];
    NSNumber *count = [results objectForKey: key];
    [results setObject:[NSNumber numberWithInt:[count intValue] + 1] forKey: key];    
  }

  for (NSNumber *key in results) {
    int count = [[results objectForKey:key] intValue];
    NSLog(@"Count for roll %d is %d", [key intValue], count);
    STAssertTrue(count > 900 && count < 1100, @"Each die side should have been thrown an average number of times");
  }
}

- (void)testSimpleTest {
  SRAEngine *engine = [SRAEngine engineNamed:@"SR4"];
  SRATestResult *simple = [engine testCharacter:[SRACharacterRegistry characterNamed:@"Foo"]
                                                                forTest:[SRATest testingSkill:[SRASkillRegistry skillNamed:@"simple skill"]
                                                                                  withContext:[engine context]];
  STAssertNotNil(simple, @"A test should result in a test result");
  STAssertNotNil([simple context], @"A new context should have been created");
}

@end
