//
//  Array.c
//  Exam4-3
//
//  Created by 孙晓晔 on 2017/3/19.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#include "Array.h"
#include <stdlib.h>
#include <string.h>

static int * allocMemoryByCapacity(Array *arr) {
    return malloc(sizeof(int) * arr->capacity_);
}

Array *ArrayCreate() {
    Array *arr = malloc(sizeof(Array));
    arr->length_ = 0;
    arr->capacity_ = 32;
    
    arr->values_ = allocMemoryByCapacity(arr);
    
    return arr;
}

int ArrayGetLength(Array *arr) {
    
    return arr->length_;
}

void ArrayAdd(Array *arr, int value) {
    if (arr->length_ >= arr->capacity_) {
        
        arr->capacity_ *= 2;
        
        int *oldValues = arr->values_;
        arr->values_ = allocMemoryByCapacity(arr);
        memcpy(arr->values_, oldValues, sizeof(int)*arr->length_);
        free(oldValues);
    }
    
    arr->values_[arr->length_] = value;
}
