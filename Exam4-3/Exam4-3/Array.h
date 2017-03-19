//
//  Array.h
//  Exam4-3
//
//  Created by 孙晓晔 on 2017/3/19.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#ifndef Array_h
#define Array_h

#include <stdio.h>

typedef struct Array_ {
    int length_;
    int capacity_;
    
    int *values_;
} Array;

Array *ArrayCreate();
int ArrayGetLength(Array *arr);
void ArrayAdd(Array *arr, int value);
void ArrayDelete(Array *arr, int index);
void ArrayModify(Array *arr, int index, int newValue);

int ArrayGet(Array *arr, int index);
void ArrayDestory(Array *arr);



void ArrayPrint(Array *arr);

#endif /* Array_h */
