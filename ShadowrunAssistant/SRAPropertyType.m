//
//  Created by claprun on 11/6/11.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "SRAPropertyType.h"


static NSDictionary *knownTypes;

@implementation SRAPropertyType {
}

- (id)initWithName:(NSString *)aName {
  self = [super init];
  if (self) {
    name = [aName copy];
    if (!knownTypes) {
      knownTypes = [NSDictionary dictionaryWithObjectsAndKeys:
          [[SRAPropertyType alloc] initWithName:ATTRIBUTE], ATTRIBUTE,
          [[SRAPropertyType alloc] initWithName:SKILL], SKILL,
          nil];
    }
  }

  return self;
}

- (NSString *)name {
  return name;
}

+ (SRAPropertyType *)forName:(NSString *)name {
  return [knownTypes objectForKey:name];
}


@end