From: Eric <eric@cisu.net>
Subject: Re: Newbie Trouble with pointers and structures.
Date: Sat, 9 Aug 2003 16:02:45 -0500
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <200308091602.45482.eric@cisu.net>
References: <200308091316.34217.eric@cisu.net>
Reply-To: eric@cisu.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200308091316.34217.eric@cisu.net>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

	Ok, here is a less complicated post.My other one is lengthy but this SIMPLE 
test program illustrates my point and works off the same concept.I know the 
test code is messy but it illustrates my concept. I would like to know why 
this very simple  test program outputs:
test
test

instead of what i would expect:
test 
modifed

here is the code.

#include <stdio.h>
#include <stdarg.h>
#include <stdlib.h>
#include <string.h>
int main();
int modify(char *p);
int main(){
        char *p = "test";
        puts(p);
        modify(p);
        puts(p);
}

int modify(char *p){
        p = malloc(sizeof(char) * 20);
        strcpy(p,"modified");
}

I am sure I am missing some simple concept...but can anyone explain what that 
concept is? I have a few thick books on C and cannot deduce what the problem 
would be. The code below SHOULD be of the same concept and it produces the 
expected result. It's output is 
1
2

#include <stdarg.h>
#include <stdlib.h>
#include <string.h>

int main();
int modify(int *p);

int main(){
        int *p;
        p = malloc(sizeof(int));
        *p = 1;
        printf("%d\n",*p);
        modify(p);
        printf("%d\n",*p);
}

int modify(int *p){
        free(p);
        p = malloc(sizeof(int));
        *p = 2;
}
----------------------
Eric Bambach   
Eric (at) CISU (dot) net 
----------------------
