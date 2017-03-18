//
//  main.m
//  Exam4-2
//
//  Created by 孙晓晔 on 2017/3/19.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import <Foundation/Foundation.h>

bool is_prime(a) {
    
    int b = (int)sqrt(a);
    // b = a - 1;
    
    while (b > 1) {
        
        if ((a % b) == 0) {
            return false;
        }
        
        b--;
    }
    
    return true;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        int a = 1000000;
        
        int count = 0;
        while (a > 1) {
        
            if (is_prime(a)) {
                printf("%d\n", a);
                count++;
            }
            
            a--;
        }
        
        printf("1至100万之间，共有素数%d个\n", count);
    }
    
    return 0;
}
