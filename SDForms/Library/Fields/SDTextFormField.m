//
//  SDTextFormField.m
//  SDForms
//
//  Created by Rafal Kwiatkowski on 13.08.2014.
//  Copyright (c) 2014 Snowdog sp. z o.o. All rights reserved.
//

#import "SDTextFormField.h"
#import "SDTextFieldCell.h"
#import "SDTextFieldWithLabelCell.h"

@implementation SDTextFormField

- (id)init
{
    self = [super init];
    if (self) {
        self.autocapitalizationType = UITextAutocapitalizationTypeSentences;
        self.autocorrectionType = UITextAutocorrectionTypeDefault;
        self.secure = NO;
        self.cellType = SDTextFormFieldCellTypeTextOnly;
    }
    return self;
}

- (void)registerCellsInTableView:(UITableView *)tableView
{
    NSString *cellId;
    if (self.cellType == SDTextFormFieldCellTypeTextOnly) {
        cellId = kTextFieldCell;
    } else {
        cellId = kTextFieldWithLabelCell;
    }

    [tableView registerNib:[UINib nibWithNibName:cellId bundle:self.defaultBundle] forCellReuseIdentifier:cellId];
    self.reuseIdentifiers = @[cellId];
}

- (SDFormCell *)cellForTableView:(UITableView *)tableView atIndex:(NSUInteger)index
{
    SDFormCell *cell = [super cellForTableView:tableView atIndex:index];
    
    if ([cell isKindOfClass:[SDTextFieldCell class]]) {
        SDTextFieldCell *textFieldCell = (SDTextFieldCell *)cell;
        
        if (self.valueType == SDFormFieldValueTypeText) {
            textFieldCell.textField.keyboardType = UIKeyboardTypeDefault;
        } else if (self.valueType == SDFormFieldValueTypeDouble) {
            textFieldCell.textField.keyboardType = UIKeyboardTypeDecimalPad;
        } else if (self.valueType == SDFormFieldValueTypeInt) {
            textFieldCell.textField.keyboardType = UIKeyboardTypeNumberPad;
        } else {
            textFieldCell.textField.keyboardType = UIKeyboardTypeDefault;
        }
        
        textFieldCell.textField.placeholder = self.placeholder;
        textFieldCell.textField.autocapitalizationType = self.autocapitalizationType;
        textFieldCell.textField.autocorrectionType = self.autocorrectionType;
        textFieldCell.textField.secureTextEntry = self.secure;
    }
    
    return cell;
}

@end
