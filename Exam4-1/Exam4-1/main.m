//
//  main.m
//  Exam4-1
//
//  Created by 孙晓晔 on 2017/3/18.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct student_ {
    char *name;
    int age;
    struct student_ *next;
} Student;

Student *createStudent(char *name, int age, Student *next) {
    
    Student *student = malloc(sizeof(Student));
    student->name = name;
    student->age = age;
    
    student->next = next;
    
    return student;
}

void printList(Student *firstNode) {
    
    for (Student *node=firstNode; node!=NULL; node=node->next) {
        printf("name = %s, age = %d\n", node->name, node->age);
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Student *first = createStudent("张三", 18, NULL);
        
        printList(first);

        
    }
    return 0;
}
