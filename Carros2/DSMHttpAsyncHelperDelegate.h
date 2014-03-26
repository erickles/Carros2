//
//  DSMHttpAsyncHelperDelegate.h
//  Carros2
//
//  Created by DSM Brasil Produtos Nutricionais SA on 21/01/14.
//  Copyright (c) 2014 DSM Brasil Produtos Nutricionais SA. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DSMHttpAsyncHelperDelegate <NSObject>
@required
// OK
-(void)requestEndWithData:(NSData *)data;
// Erro
-(void)requestEndWithError:(NSError *)error;
@end
