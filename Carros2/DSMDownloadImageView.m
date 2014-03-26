//
//  DSMDownloadImageView.m
//  Carros2
//
//  Created by DSM Brasil Produtos Nutricionais SA on 13/01/14.
//  Copyright (c) 2014 DSM Brasil Produtos Nutricionais SA. All rights reserved.
//

#import "DSMDownloadImageView.h"

@implementation DSMDownloadImageView
@synthesize url;
#define LOG_ON YES
#define CACHE_ON YES
#pragma mark - ciclo de vida
// Chamado se o objeto e instanciado pelo codigo
- (id)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame]){
        progress = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [self addSubview:progress];
    }
    return self;
}

//Chamado se o objeto e instanciado pelo arquivo xib
-(id)initWithCoder:(NSCoder *)aDecoder{
    if(self = [super initWithCoder:aDecoder]){
        progress = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [self addSubview:progress];
    }
    return self;
}

//Configura o layout
-(void)layoutSubviews{
    [super layoutSubviews];
    //Inicializa o progress no centro
    progress.center = [self convertPoint:self.center fromView:self.superview];
}

//Sobscreve o setUrl para fazer p download em background
-(void)setUrl:(NSString *)urlParam{
    if([urlParam length] == 0){
        //[self.url release];
        self.url = nil;
        self.image = nil;
    }else{
        //[self.url release];
        url = [urlParam copy];
        self.image = nil;
        if(!queue){
            queue = [[NSOperationQueue alloc] init];
        }
        [queue cancelAllOperations];
        //Inicia a animacao em uma NSOperation
        NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(downloadImg) object:nil];
        [queue addOperation:operation];
        //[operation release];
    }
}

#pragma mark - download em background
//Faz download da imagem
-(void)downloadImg{
    //Cria caminho do arquivo para salvar a img em cache
    NSString* file = [url stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
    file = [file stringByReplacingOccurrencesOfString:@"\\" withString:@"_"];
    file = [file stringByReplacingOccurrencesOfString:@":" withString:@"_"];
    file = [@"/Documents/" stringByAppendingString:[NSString stringWithString:file]];
    file = [NSHomeDirectory() stringByAppendingString:[NSString stringWithString:file]];
    
    if(LOG_ON && CACHE_ON){
        NSLog(@"Arquivo img %@",file);
    }
    //Se existe no cache
    if(CACHE_ON && [[NSFileManager defaultManager] fileExistsAtPath:file]){
        //Le a imagem do cache
        NSData* data = [NSData dataWithContentsOfFile:file];
        if(data){
            if(LOG_ON){
                NSLog(@"Encontrado no cache %@ ", url);
            }
            UIImage *img = [[UIImage alloc] initWithData:data];
            //Depois do download, atualiza o UIImageView na thread principal
            [self performSelectorOnMainThread:@selector(showImg:) withObject:img waitUntilDone:YES];
            return;
        }
    }
    //Senao faz download (este metodo e executado em outra thread)
    if(LOG_ON){
        NSLog(@"Download URL %@",url);
    }
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    UIImage *img = [[UIImage alloc] initWithData:data];
    //Salva no cache
    if(CACHE_ON){
        NSLog(@"Salvo no cache URL %@",url);
        [data writeToFile:file atomically:YES];
    }
    //Atualiza o UimageView com a imagem carregada do cache
    [self performSelectorOnMainThread:@selector(showImg:) withObject:img waitUntilDone:YES];
    //Libera memoria
    //[img release];
}

//Atualiza o UiImageView com o resultado
-(void)showImg:(UIImage *)imagem{
    //Atualiza o objeto UIImage dentro do UIImageView
    self.image = imagem;
    //Encerra a animacao do Spinner
    [progress stopAnimating];
}
#pragma mark - dealloc
-(void)dealloc{
    //[queue release];
    //[url release];
    [progress removeFromSuperview];
    //[progress release];
    //[super dealloc];
}
@end
