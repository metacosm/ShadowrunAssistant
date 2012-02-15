//
//  Created by claprun on 2/12/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "CharacterTests.h"
#import "SRACharacter.h"
#import "SRAEngine.h"


@implementation CharacterTests {

}

- (void) testInitWithNickname {
  NSString *const nick = @"foo";
  SRACharacter *const character = [[SRACharacter alloc] initWithName:nick engine:[SRAEngine defaultEngine]];
  STAssertEquals(nick, character.name, @"Creating a character with name '%@' should returned a character whose name is '%@'", nick, nick);
  STAssertEquals(character.name, character.realName, @"By default, name and real name should be equal");
  STAssertEquals(0, character.currentKarma, @"A new character doesn't have current karma");
  STAssertEquals(0, character.totalKarma, @"A new character doesn't have total karma");

  SRAEngine *const engine = [character engine];
  STAssertNotNil(engine, @"A character must reference an engine");
  for(NSString *attribute in [engine supportedAttributes])
  {
    STAssertNotNil([character characteristicInfo:attribute], @"A character created from engine '%@' should know about attribute '%@'", [engine name], attribute);
    STAssertEquals(0, [character modifiedValueForCharacteristic:attribute], @"Initial attribute value should be 0");
  }
}

- (void) testInit {
  SRACharacter *const character = [[SRACharacter alloc] init];
  STAssertEqualObjects(DEFAULT_CHARACTER_NAME, character.name, @"Creating a character without a name should create a character with the default name");
}

@end