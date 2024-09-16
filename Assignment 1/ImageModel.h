//
//  ImageModel.h
//  Assignment 1
//
//  Created by Salver Anushika on 9/5/24.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImageModel : NSObject

// Singleton instance
+ (ImageModel*)sharedInstance;

// Get image by name
- (UIImage*)getImageWithName:(NSString*)name;

// Get image by index
- (UIImage*)getImageWithIndex:(NSInteger)index;

// Get the total number of images
- (NSInteger)numberOfImages;

// Get image name for a given index
- (NSString*)getImageNameForIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
