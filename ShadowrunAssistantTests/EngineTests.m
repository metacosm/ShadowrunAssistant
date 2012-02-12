//
//  Created by claprun on 2/12/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "EngineTests.h"
#import "SRAEngine.h"


@implementation EngineTests {

}

- (void)testDiceThrowing {
  SRAEngine *engine = [SRAEngine defaultEngine];
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
    NSNumber *count = [results objectForKey:key];
    [results setObject:[NSNumber numberWithInt:[count intValue] + 1] forKey:key];
  }

  for (NSNumber *key in results) {
    int count = [[results objectForKey:key] intValue];
    NSLog(@"Count for roll %d is %d", [key intValue], count);
    STAssertTrue(count > 900 && count < 1100, @"Each die side should have been thrown an average number of times");
  }
}

- (void) testInitialState {
  SRAEngine *engine = [SRAEngine engineNamed:@"foo"];
  STAssertEqualObjects(@"foo", engine.name, @"Retrieving an engine from a given name should return an engine with that name");
  STAssertNotNil(engine.context, @"An engine should always provide a context");
}

- (void)testDefaultEngine {
  SRAEngine *defaultEngine = [SRAEngine defaultEngine];
  STAssertNotNil(defaultEngine, @"There should always be a default engine");
  STAssertEqualObjects(DEFAULT_ENGINE_NAME, defaultEngine.name, @"Default engine's name should be DEFAULT_ENGINE_NAME's value");

  STAssertEqualObjects(defaultEngine, [SRAEngine engineNamed:DEFAULT_ENGINE_NAME], @"Default engine should be the same as the one retrieved from the default name");
  STAssertEqualObjects(defaultEngine, [SRAEngine engineNamed:nil], @"Passing nil to engineNamed: should return the default engine");
  STAssertEqualObjects(defaultEngine, [SRAEngine engineNamed:SR4], @"Default engine should currently be the SR4 engine");
}

@end