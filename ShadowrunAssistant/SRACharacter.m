//
//  Created by claprun on 11/6/11.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "SRACharacter.h"
#import "SRACharacteristic.h"
#import "SRACharacteristicInfo.h"

@implementation SRACharacter {
@private
  NSString *_name;
  NSString *_nickname;
  int _currentKarma;
  int _totalKarma;
  NSMutableDictionary *characteristics;
}


- (NSString *)name {
  return _name;
}

- (NSString *)nickname {
  return _nickname;
}

- (int)currentKarma {
  return _currentKarma;
}

- (int)totalKarma {
  return _totalKarma;
}

- (SRACharacteristicInfo *)characteristicInfo:(NSString *)name {
  SRACharacteristic *characteristic = [self characteristic:name];
  if (characteristic) {
    return [characteristic info];
  }
  else {
    return nil;
  }
}

- (SRACharacteristic *)characteristic:(NSString *)name {
  return [characteristics objectForKey:name];
}

- (void)addCharacteristic:(SRACharacteristic *)characteristic {
  if (characteristic) {
    [characteristics setObject:characteristic forKey:[characteristic name]];
  }
}

- (id)initWithName:(NSString *)name andNickname:(NSString *)nickname {
  self = [super init];
  if (self) {
    _name = name;
    _nickname = nickname;
  }

  return self;
}

+ (SRACharacter *)characterNamed:(NSString *)name nicknamed:(NSString *)nick {

  return [[self alloc] initWithName:name andNickname:nick];

}


@end