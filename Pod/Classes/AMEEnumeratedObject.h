//
//  AMEEnumeratedObject.h
//  Pods
//
//  Created by Satoshi Namai on 2014/07/03.
//
//

#import <Foundation/Foundation.h>

/**
 * can create enum object like Java lang's enum by AMEEnumeratedObject.
 * should use this class as super class of your enum object.
 *
 * @warning AMEEnumeratedObject have a constraint that you can't use its sub classes before initializing of Enumerate Collection class.
 * @see You can use AMEEnumeratedObjectInitializer to initialize enum objetcs.
 */
@interface AMEEnumeratedObject : NSObject

/**
 * retrive enum object as a singleton instance.
 */
+ (instancetype)enumObject;

/**
 * define enum object in `[AMEEnumerateCollection values]`
 * must not use other places.
 *
 * give only ordinal value to enum object.
 *
 * @param ordinal ordinal value to set property
 * @return self instance
 */
+ (instancetype)defineEnum:(NSUInteger)ordinal;

/**
 * define enum object in `[AMEEnumerateCollection values]`
 * must not use other places.
 *
 * give ordinal and name value to enum object.
 * name value can be used in `[AMEEnumerateCollection valueForName]`.
 *
 * @param ordinal ordinal value to set property
 * @param name name value to set property
 * @return self instance
 */
+ (instancetype)defineEnum:(NSUInteger)ordinal name:(NSString *)name;

/**
 * define enum object in `[AMEEnumerateCollection values]`
 * must not use other places.
 *
 * give ordinal and name value to enum object.
 * `name` value can be used in `[AMEEnumerateCollection valueForName]`.
 * can give `description` as a human readable or underlying value this.
 *
 * @param ordinal ordinal value to set property
 * @param name name value to set property
 * @param description underlying string value to get description method
 * @return self instance
 */
+ (instancetype)defineEnum:(NSUInteger)ordinal name:(NSString *)name description:(NSString *)description;

/**
 * ordinal value of enum object
 */
@property (nonatomic, assign, readonly) NSUInteger ordinal;

/**
 * ordinal value of enum object.
 * if you don't given this initializer, will return the string of class name.
 */
@property (nonatomic, strong, readonly) NSString *name;

@end

/**
 * should use AMEEnumerateCollection as a super class for your enumeration values.
 * all that you write is the implementation class which overrided `values` method.
 */
@interface AMEEnumerateCollection : NSObject

/**
 * You must orverride to define your enumeration values.
 */
+ (NSArray *)values;

/**
 * retrive a enumerated object for name
 * @param name key for enumerate object which included this collection.
 * @return instance for name
 */
+ (id)valueForName:(NSString *)name;

@end

/**
 * AMEEnumeratedObjectInitializer do initialize all your defined enumerate classes.
 * AMEEnumeratedObject have constraint that you can't use its sub classes before initializing of Enumerate Collection class.
 * So,this will help to initialize all enumerate object at once.
 */
@interface AMEEnumeratedObjectInitializer : NSObject

/**
 * initialize all enumearate objects via sub classes of AMEEnumerateCollection
 */
+ (void)initializeAllEnumerateObjects;

@end
