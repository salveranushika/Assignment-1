//
//  ImageModel.h
//  Assignment 1
//
//  Created by Salver Anushika on 9/5/24.
//

#import <Foundation/Foundation.h>
#import<UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImageModel : NSObject

+(ImageModel*)sharedInstance;

-(UIImage*)getImageWithName:(NSString*)name;

@property (strong, nonatomic) NSArray* imageNames;


@end

NS_ASSUME_NONNULL_END
