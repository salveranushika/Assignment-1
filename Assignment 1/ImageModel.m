//
//  ImageModel.m
//  Assignment 1
//
//  Created by Salver Anushika on 9/5/24.
//

#import "ImageModel.h"

@interface ImageModel ()

// Private properties
@property (strong, nonatomic) NSArray *imageNames;
@property (strong, nonatomic) NSDictionary *imagesDict;

@end

@implementation ImageModel

@synthesize imageNames = _imageNames;

+ (ImageModel*)sharedInstance {
    static ImageModel* _sharedInstance = nil;
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        _sharedInstance = [[ImageModel alloc] init];
    });
    return _sharedInstance;
}

// Lazy initialization of imageNames
- (NSArray*)imageNames {
    if (!_imageNames) {
        _imageNames = @[@"A", @"B", @"C", @"D", @"E", @"F"];
    }
    return _imageNames;
}

// Lazy initialization of imagesDict
- (NSDictionary*)imagesDict {
    if (!_imagesDict) {
        _imagesDict = @{
            @"A": [UIImage imageNamed:@"A"],
            @"B": [UIImage imageNamed:@"B"],
            @"C": [UIImage imageNamed:@"C"],
            @"D": [UIImage imageNamed:@"D"],
            @"E": [UIImage imageNamed:@"E"],
            @"F": [UIImage imageNamed:@"F"]
        };
    }
    return _imagesDict;
}

// To Get image by name
- (UIImage*)getImageWithName:(NSString*)name {
    return self.imagesDict[name];
}

// To Get image by index
- (UIImage*)getImageWithIndex:(NSInteger)index {
    if (index >= 0 && index < self.imageNames.count) {
        NSString *imageName = self.imageNames[index];
        return self.imagesDict[imageName];
    }
    return nil; // Return nil if the index is out of bounds or image not found
}

// To Get total number of images
- (NSInteger)numberOfImages {
    return self.imageNames.count;
}

// To Get image name for a given index
- (NSString*)getImageNameForIndex:(NSInteger)index {
    if (index >= 0 && index < self.imageNames.count) {
        return self.imageNames[index];
    }
    return nil; // Return nil if the index is out of bounds
}

@end
