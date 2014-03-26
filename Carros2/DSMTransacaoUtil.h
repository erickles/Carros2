//
//  DSMTransacaoUtil.h
//  Carros2
//
//  Created by DSM Brasil Produtos Nutricionais SA on 28/01/14.
//  Copyright (c) 2014 DSM Brasil Produtos Nutricionais SA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DSMTransacao.h"

@interface DSMTransacaoUtil : NSObject{
    NSOperationQueue *queue;
}
-(void)iniciarTransacao:(NSObject<DSMTransacao> *)transacao;
@property (nonatomic,retain)NSObject<DSMTransacao> *transacao;
@end
