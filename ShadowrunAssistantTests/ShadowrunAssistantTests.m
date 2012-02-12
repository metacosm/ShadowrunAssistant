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

- (void)testSimpleTest {
  SRAEngine *engine = [SRAEngine defaultEngine];

  SRATestResult *simple = [engine testCharacter:[SRACharacterRegistry characterNamed:@"Foo"]
                                        forTest:[SRATest testingSkill:[SRASkillRegistry skillNamed:@"simple skill"]
                                                          withContext:[engine context]]];
  STAssertNotNil(simple, @"A test should result in a test result");
}

@end
