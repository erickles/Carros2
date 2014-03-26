//
//  DSMHttpHelper.h
//  Carros2
//
//  Created by DSM Brasil Produtos Nutricionais SA on 28/01/14.
//  Copyright (c) 2014 DSM Brasil Produtos Nutricionais SA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DSMHttpHelper : NSObject
{
}
-(NSData *) doGet:(NSString *) url;
@end
