//
//  DSMDownloadImageView.h
//  Carros2
//
//  Created by DSM Brasil Produtos Nutricionais SA on 13/01/14.
//  Copyright (c) 2014 DSM Brasil Produtos Nutricionais SA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DSMDownloadImageView : UIImageView{
    NSString *url;
    UIActivityIndicatorView *progress;
    NSOperationQueue *queue;
}
@property (nonatomic,copy) NSString *url;
@end
