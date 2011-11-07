//
//  Created by claprun on 11/6/11.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "SRAPropertyType.h"


@implementation SRAPropertyType {
@private
  NSString *name;
}

- (id)initWithName:(NSString *)aName {
  self = [super init];
  if (self) {
    name = [aName copy];
  }

  return self;
}


SRAPropertyType* const ATTRIBUTE = [[SRAPropertyType alloc] initWithName:@"attribute"];
SRAPropertyType* const SKILL = [[SRAPropertyType alloc] initWithName:@"skill"];

@end