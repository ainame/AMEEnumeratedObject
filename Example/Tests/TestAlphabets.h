//
//  TestAlphabets.h
//  AMEEnumeratedObject
//
//  Created by Satoshi Namai on 2014/07/14.
//  Copyright (c) 2014年 ainame. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AMEEnumeratedObject.h"

@interface TestAlphabet : AMEEnumeratedObject
@end

@interface TestAlphabetOfA : TestAlphabet
@end

@interface TestAlphabetOfB : TestAlphabet
@end

@interface TestAlphabetOfC : TestAlphabet
@end

@interface TestAlphabets : AMEEnumerateCollection
@end
