//
//  AMEEnumeratedObject.m
//  Pods
//
//  Created by Satoshi Namai on 2014/07/03.
//
//

#import "AMEEnumeratedObject.h"
#import <objc/runtime.h>

static NSMutableDictionary *globalEnumerateObjectStore;

@implementation AMEEnumeratedObject

+ (instancetype)enumObject
{
    return [self defineEnum:NSNotFound name:nil stringValue:nil];
}

+ (instancetype)defineEnum:(NSUInteger)oridnal
{
    return [self defineEnum:oridnal name:nil stringValue:nil];
}

+ (instancetype)defineEnum:(NSUInteger)oridnal name:(NSString *)name
{
    return [self defineEnum:oridnal name:name stringValue:nil];
}

+ (instancetype)defineEnum:(NSUInteger)oridnal name:(NSString *)name stringValue:(NSString *)stringValue
{
    NSString *key = NSStringFromClass(self);
    if (!globalEnumerateObjectStore[key] && oridnal == NSNotFound) {
        NSLog(@"undefined enumerate object error %@", self);
        return nil;
    }
    if (globalEnumerateObjectStore[key]) {
        return globalEnumerateObjectStore[key];
    }

    return globalEnumerateObjectStore[key] = [[self alloc] initWithOrdinal:oridnal name:name stringValue:stringValue];
}

- (instancetype)initWithOrdinal:(NSUInteger)ordinal name:(NSString *)name stringValue:(NSString *)stringValue
{
    self = [super init];
    if (self) {
        _ordinal = ordinal;
        _name = name ? name : NSStringFromClass(self.class);
        _stringValue = stringValue;
    }
    return self;
}

- (NSString *)getStringValue
{
    return _stringValue ? _stringValue : _name;
}

@end

@implementation AMEEnumerateCollection

+ (void)initialize
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{ [self values]; });
}

+ (NSArray *)values
{
    return nil;
}

+ (AMEEnumeratedObject *)valueForName:(NSString *)name
{
    NSArray *values = [self values];
    for (AMEEnumeratedObject *value in values) {
        if ([value.name isEqualToString:name]) {
            return value;
        }
    }
    return nil;
}
@end

@implementation AMEEnumeratedObjectInitializer

+ (void)initializeAllEnumerateObjects
{
    globalEnumerateObjectStore = [NSMutableDictionary dictionary];

    int count = objc_getClassList(NULL, 0);
    Class classes[count];

    if (count <= 0) {
        return;
    }
    objc_getClassList(classes, count);
    for (int i = 0; i < count; i++) {
        Class clazz = classes[i];
        if (class_getSuperclass(clazz) == AMEEnumerateCollection.class) {
            [clazz initialize];
        }
    }
}

@end
