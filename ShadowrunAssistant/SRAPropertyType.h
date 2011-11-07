//
//  Created by claprun on 11/6/11.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class SRAPropertyType;


extern SRAPropertyType* const ATTRIBUTE;
extern SRAPropertyType* const SKILL;

@interface SRAPropertyType : NSObject
{
}
@property(readonly) NSString* name;

- (id)initWithName:(NSString *)aName;


@end