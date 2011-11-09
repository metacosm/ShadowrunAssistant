//
//  Created by claprun on 11/6/11.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "SRACharacter.h"
#import "SRAPropertyType.h"
#import "SRACharacteristic.h"

@implementation SRACharacter {
@private
  NSString *_name;
  NSString *_nickname;
  int _currentKarma;
  int _totalKarma;
  NSMutableDictionary *attributes;
  NSMutableDictionary *skills;
}
@synthesize name = _name;
@synthesize nickname = _nickname;
@synthesize currentKarma = _currentKarma;
@synthesize totalKarma = _totalKarma;

- (void)addProperty:(NSString *)name withLevel:(int)level andType:(SRAPropertyType *)type {
  if (ATTRIBUTE == type || SKILL == type) {
    SRACharacteristic *property = [SRACharacteristic propertyNamed:name ofType:type withValue:level];
    NSMutableDictionary *props = ATTRIBUTE == type ? attributes : skills;
    [props setObject:property forKey:name];
  }
  else {
    NSException *exception = [NSException exceptionWithName:@"InvalidPropertyTypeException"
                                                     reason:[NSString stringWithFormat:@"Invalid property type %@", [type name]]
                                                   userInfo:nil];
    @throw exception;
  }
}

- (int)attribute:(NSString *)name {
  id attribute = [attributes objectForKey:name];
  if (attribute != nil) {
    return [attribute unmodifiedValue];
  }
  else {
    NSException *exception = [NSException exceptionWithName:@"InvalidAtttributeException"
                                                     reason:[NSString stringWithFormat:@"Invalid attribute name %@", name]
                                                   userInfo:nil];
    @throw exception;
  }
}

- (int)unmodifiedSkill:(NSString *)name {
  return 0;
  //To change the template use AppCode | Preferences | File Templates.

}

- (int)modifiedSkill:(NSString *)name {
  return 0;
  //To change the template use AppCode | Preferences | File Templates.

}

- (void)addSkill:(NSString *)name withLevel:(int)level {
  [self addProperty:name withLevel:level andType:SKILL];

}


- (void)addAttribute:(NSString *)name withLevel:(int)level {
  [self addProperty:name withLevel:level andType:ATTRIBUTE];
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