//
//  Created by claprun on 1/7/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "SRACharacterRegistry.h"
#import "SRACharacter.h"

@implementation SRACharacterRegistry {

}

+ (SRACharacter *)characterNamed:(NSString const *)name {
 return [[SRACharacter alloc] initWithName:name];

}
@end