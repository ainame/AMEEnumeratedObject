# AMEEnumeratedObject

[![CI Status](http://img.shields.io/travis/ainame/AMEEnumeratedObject.svg?style=flat)](https://travis-ci.org/ainame/AMEEnumeratedObject)
[![Version](https://img.shields.io/cocoapods/v/AMEEnumeratedObject.svg?style=flat)](http://cocoadocs.org/docsets/AMEEnumeratedObject)
[![License](https://img.shields.io/cocoapods/l/AMEEnumeratedObject.svg?style=flat)](http://cocoadocs.org/docsets/AMEEnumeratedObject)
[![Platform](https://img.shields.io/cocoapods/p/AMEEnumeratedObject.svg?style=flat)](http://cocoadocs.org/docsets/AMEEnumeratedObject)

## Usage

```objc
@interface Alphabets : AMEEnumeratCollection; @end
@interface Alphabet : AMEEnumeratedObject
+ (Alphabet *)enumObject;
@end;
@implementation Alphabet;  @end
@interface A : Alphabet; @end; @implementation A; @end
@interface B : Alphabet; @end; @implementation B; @end
@interface C : Alphabet; @end; @implementation C; @end

@implementation Alphabets
+ (NSArray *) values
{
    return @[
        [A defineEnum:0 name:@"a" description:@"えー"],
        [B defineEnum:1 name:@"b" description:@"びー"],
        [C defineEnum:2 name:@"c" description:@"しー"],
    ];
}
@end

// ....

[AMEEnumeratedObjectInitializer initializeAllEnumerateObjects];
Alphabet *alphabet = [A enumObject];
alphabet.ordinal; //=> 0
alphabet.name; //=> @"a"
alphabet.description; //=> @"えー"

alphabet = [Alphabets valueForName:@"b"] // => B object;
[Alphabets values]                       // => A, B and c instances as NSArray;
```

## Requirements

## Installation

AMEEnumeratedObject is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "AMEEnumeratedObject"

## Author

[ainame](https://twitter.com/ainame)

## License

AMEEnumeratedObject is available under the MIT license. See the LICENSE file for more info.
