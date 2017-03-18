//
//  main.m
//  Exam4-1
//
//  Created by 孙晓晔 on 2017/3/18.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct Node_ {
    int no;
    struct Node_ *next;
} Node;

Node *createNode(int no, Node *next) {
    
    Node *node = malloc(sizeof(Node));
    node->no = no;
    
    node->next = next;
    
    return node;
}

void printList(Node *list) {
    
    for (Node *node=list; node!=NULL; node=node->next) {
        printf("current no = %d\n", node->no);
    }
}

void rprintList(Node *node) {
    
    if (node != NULL) {
        if (node->next != NULL) {
            rprintList(node->next);
        }
        
        printf("current no = %d\n", node->no);
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Node *current = createNode(0, NULL);
        Node *first = current;
        
        for (int i = 1; i < 10; i ++) {
            current->next = createNode(i, NULL);
            current = current->next;
        }
        
        printList(first);
        
        printf("逆序输出\n");
        rprintList(first);
    }
    
    return 0;
}
