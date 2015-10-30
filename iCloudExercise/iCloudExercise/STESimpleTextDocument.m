//
//  STESimpleTextDocument.m
//  iCloudExercise
//
//  Created by Unbounded on 5/1/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "STESimpleTextDocument.h"

@implementation STESimpleTextDocument
@synthesize documentText = _documentText;
@synthesize delegate = _delegate;

- (void)setDocumentText:(NSString *)newText {
    NSString* oldText = _documentText;
    _documentText = [newText copy];
    
    // Register the undo operation.
    [self.undoManager setActionName:@"Text Change"];
    [self.undoManager registerUndoWithTarget:self
                                    selector:@selector(setDocumentText:)
                                      object:oldText];
}

- (id)contentsForType:(NSString *)typeName error:(NSError **)outError {
    if (!self.documentText)
        self.documentText = @"";
    
    NSData *docData = [self.documentText
                       dataUsingEncoding:NSUTF8StringEncoding];
    return docData;
}

- (BOOL)loadFromContents:(id)contents
                  ofType:(NSString *)typeName
                   error:(NSError **)outError {
    if ([contents length] > 0)
        self.documentText = [[NSString alloc]
                             initWithData:contents
                             encoding:NSUTF8StringEncoding];
    else
        self.documentText = @"";
    
    // Tell the delegate that the document contents changed.
    if (self.delegate && [self.delegate respondsToSelector:
                          @selector(documentContentsDidChange:)])
        [self.delegate documentContentsDidChange:self];
    
    return YES;
}
@end
