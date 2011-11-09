//
//  Created by claprun on 11/6/11.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class SRAPropertyType;


extern NSString *const ATTRIBUTE = @"attribute";
extern NSString *const SKILL = @"skill";

@interface SRAPropertyType : NSObject {
  NSString *name;
}

- (NSString *)name;

+ (SRAPropertyType *)forName:(NSString *)name;

@end