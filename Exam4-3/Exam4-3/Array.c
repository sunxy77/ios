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
#include <assert.h>

static int * allocMemoryByCapacity(Array *arr) {
    return malloc(sizeof(int) * arr->capacity_);
}

// 创建数组，预分配一定大小的内存
Array *ArrayCreate() {
    Array *arr = malloc(sizeof(Array));
    arr->length_ = 0;
    arr->capacity_ = 32;
    
    arr->values_ = allocMemoryByCapacity(arr);
    
    return arr;
}

// 获取数组的长度
int ArrayGetLength(Array *arr) {
    
    return arr->length_;
}

// 在数组尾添加一个值
void ArrayAdd(Array *arr, int value) {
    if (arr->length_ >= arr->capacity_) {
        
        arr->capacity_ *= 2;
        
        int *oldValues = arr->values_;
        arr->values_ = allocMemoryByCapacity(arr);
        memcpy(arr->values_, oldValues, sizeof(int) * arr->length_);
        free(oldValues);
    }
    
    arr->values_[arr->length_] = value;
    arr->length_++;
}

void ArrayAddIndex(Array *arr, int index, int value) {
    if (arr->length_ >= arr->capacity_) {
        
        arr->capacity_ *= 2;
        
        int *oldValues = arr->values_;
        arr->values_ = allocMemoryByCapacity(arr);
        memcpy(arr->values_, oldValues, sizeof(int) * arr->length_);
        free(oldValues);
    }
    
    for (int i = arr->length_; i >= 0; i--) {
        if (i > index) {
            arr->values_[i+1] = arr->values_[i];
        } else if (i == index) {
            arr->values_[i+1] = arr->values_[i];
            arr->values_[i] = value;
        } else {
            break;
        }
    }
    
    arr->length_++;
}

void ArrayDelete(Array *arr, int index) {
    if (index > 0 && index < arr->length_) {
        int *temp = allocMemoryByCapacity(arr);
        int j = 0;
        for (int i = 0; i < arr->length_; i++) {
            
            if (i == index) {
                continue;
            }
            
            temp[j] = arr->values_[i];
            
            j++;
        }
        
        free(arr->values_);
        
        arr->values_ = temp;
        arr->length_--;    }
}

void ArrayModify(Array *arr, int index, int newValue) {
    if (index > 0 && index < arr->length_) {
        
        for (int i = 0; i < arr->length_; i++) {
            
            if (i == index) {
                arr->values_[i] = newValue;
                break;
            }
        }
    }
}

// 通过索引获取值
int ArrayGet(Array *arr, int index) {
    assert(index > 0 && index < arr->length_);
    
    return arr->values_[index];
}

// 管理内存，释放内存
void ArrayDestory(Array *arr) {
    if (arr != NULL) {
        if (arr->values_ != NULL) {
             free(arr->values_);
        }
        free(arr);
    }
    
    
}

// 输出数组信息
void ArrayPrint(Array *arr) {
    printf("array capacity = %d, length = %d\n", arr->capacity_, arr->length_);
    
    for (int i = 0; i < arr->length_; i++) {
        printf("index = %d, values = %d\n", i, arr->values_[i]);
    }
}
