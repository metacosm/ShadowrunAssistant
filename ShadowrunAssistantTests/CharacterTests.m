//
//  Created by claprun on 2/12/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "CharacterTests.h"
#import "SRACharacter.h"


@implementation CharacterTests {

}

- (void) testInitWithNickname {
  NSString *const nick = @"foo";
  SRACharacter *const character = [[SRACharacter alloc] initWithName:nick];
  STAssertEquals(nick, character.name, @"Creating a character with name '%s' should returned a character whose name is '%s'", nick, nick);
  STAssertEquals(character.name, character.realName, @"By default, name and real name should be equal");
  STAssertEquals(0, character.currentKarma, @"A new character doesn't have current karma");
  STAssertEquals(0, character.totalKarma, @"A new character doesn't have total karma");

}

- (void) testInit {
  SRACharacter *const character = [[SRACharacter alloc] init];
  STAssertEquals(DEFAULT_CHARACTER_NAME, character.name, @"Creating a character without a name should create a character with the default name");
  STAssertEquals(character.name, character.realName, @"By default, name and real name should be equal");
  STAssertEquals(0, character.currentKarma, @"A new character doesn't have current karma");
  STAssertEquals(0, character.totalKarma, @"A new character doesn't have total karma");

}

@end