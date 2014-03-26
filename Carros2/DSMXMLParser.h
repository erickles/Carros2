//
//  DSMXMLParser.h
//  Carros2
//
//  Created by DSM Brasil Produtos Nutricionais SA on 20/12/13.
//  Copyright (c) 2013 DSM Brasil Produtos Nutricionais SA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DSMCarro.h"

@interface DSMXMLParser : NSObject <NSXMLParserDelegate>{
    //Lista de carros
    NSMutableArray *carros;
    //Variaveis auxiliares para o parser
    NSMutableString *tempString;
    DSMCarro *carro;
}

//Para criar o getter [XMLCarroParser getCarros];
@property (nonatomic,retain) NSMutableArray *carros;

@end
