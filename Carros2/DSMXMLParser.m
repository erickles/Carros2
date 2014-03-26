//
//  DSMXMLParser.m
//  Carros2
//
//  Created by DSM Brasil Produtos Nutricionais SA on 20/12/13.
//  Copyright (c) 2013 DSM Brasil Produtos Nutricionais SA. All rights reserved.
//

#import "DSMXMLParser.h"
#import "DSMCarro.h"

@implementation DSMXMLParser
//Propriedade carros que contem o rray de carros
@synthesize carros;

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"carros"]){
        //Tag <carros> encontrada, cria a lista de carros
        self.carros = [[NSMutableArray alloc] init];
    }else if([elementName isEqualToString:@"carro"]){
        //Tag <carro> encontrada, cria um novo objeto carro
        carro = [[DSMCarro alloc] init];
    }
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    if([elementName isEqualToString:@"carros"]){
        //Tag de fim </carros> encontrada. Significa que terminou o XML.
        return;
    }
    if([elementName isEqualToString:@"carro"]){
        //Fim da tag </carro>. Entao aproveita para inserir o novo carro no array
        [self.carros addObject:carro];
        //Depois de inserir o carro no array, podemos liberar a memoria, pois o aray fez retain
        //[carro release];
        carro = nil;
    }else{
        //Se nao eh a tag <carro>, pode ser as tags <nome>. <desc> etc.
        //Copia os valores do XML para o objeto carro
        //Se existirem tags com o mesmo da @property do Carro, o valor sera copiado
        if(tempString != nil && carro != nil){
            [carro setValue:tempString forKey:elementName];
        }
        //Libera a string depois de utilizar
        //[tempString release];
        tempString = nil;
    }
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    //Novos caracteres foram encontrados no XML. Entao cria a string e faz trim
    NSString *s = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if(!tempString){
        //Se a variavel auxiliar nao existe, cria uma nova instancia
        tempString = [[NSMutableString alloc]init];
    }
    //Faz append na string para copiar o valor recebido para a variavel auxiliar
    [tempString appendString:s];
}

@end
