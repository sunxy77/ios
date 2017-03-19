//
//  main.c
//  Exam4-3
//
//  Created by 孙晓晔 on 2017/3/19.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#include <stdio.h>
#include "Array.h"

int main(int argc, const char * argv[]) {
    // insert code here...
    
    Array *arr = ArrayCreate();
    
    for (int i = 0; i < 6; i++) {
        ArrayAdd(arr, i+10);
    }
    
    printf("向数组中添加数据并打印\n");
    ArrayPrint(arr);
    
    ArrayDelete(arr, 2);
    printf("删除数组中索引为%d数据并打印\n", 2);
    ArrayPrint(arr);
    
    ArrayModify(arr, 2, 22);
    printf("修改数组中指定索引为%d对应数据并打印\n", 2);
    ArrayPrint(arr);
    
    int q = ArrayGet(arr, 3);
    printf("获取数组中索引= %d, 数据 = %d\n", 3, q);
    
    ArrayPrint(arr);
    
    ArrayDestory(arr);
    
    return 0;
}
