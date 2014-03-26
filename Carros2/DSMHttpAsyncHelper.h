//
//  DSMHttpAsyncHelper.h
//  Carros2
//
//  Created by DSM Brasil Produtos Nutricionais SA on 21/01/14.
//  Copyright (c) 2014 DSM Brasil Produtos Nutricionais SA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DSMHttpAsyncHelperDelegate.h"

@interface DSMHttpAsyncHelper : NSObject<NSURLConnectionDataDelegate>{
    //Retorno do HTTP
    NSMutableData *retornoHttp;
    id <DSMHttpAsyncHelperDelegate> delegate;
}
@property (retain) id delegate;
-(void) doGet:(NSString *) url;

@end
