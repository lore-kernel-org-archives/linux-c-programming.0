From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Newbie Trouble with pointers and structures.
Date: Sat, 9 Aug 2003 23:55:27 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16181.31711.617645.551485@cerise.nosuchdomain.co.uk>
References: <200308091316.34217.eric@cisu.net>
	<200308091602.45482.eric@cisu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200308091602.45482.eric@cisu.net>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: eric@cisu.net
Cc: linux-c-programming@vger.kernel.org


Eric wrote:

> 	Ok, here is a less complicated post.My other one is lengthy but this SIMPLE 
> test program illustrates my point and works off the same concept.I know the 
> test code is messy but it illustrates my concept. I would like to know why 
> this very simple  test program outputs:
> test
> test
> 
> instead of what i would expect:
> test 
> modifed
> 
> here is the code.
> 
> #include <stdio.h>
> #include <stdarg.h>
> #include <stdlib.h>
> #include <string.h>
> int main();
> int modify(char *p);
> int main(){
>         char *p = "test";
>         puts(p);
>         modify(p);
>         puts(p);
> }
> 
> int modify(char *p){
>         p = malloc(sizeof(char) * 20);
>         strcpy(p,"modified");
> }

The parameter p of modify is a different variable to the local
variable p in main(). modify(p) passes a copy of the pointer to
modify; modify allocates additional memory, and overwrites the
parameter p with the pointer to that memory. It does not modify the
local variable p in main(), or the memory to which that points.

> I am sure I am missing some simple concept...but can anyone explain what that 
> concept is?

Call-by-value. In the above code, modify allocates new memory, copies
the string "modified" into it, then loses the reference when it
returns. The memory is still allocated, it still contains the string
"modified", but there is no longer any way to refer to it. All the
while, the local variable p within main continues to point at the
string "test".

To get the result which you desire, you would have to do this:

int main(){
        char *p = "test";
        puts(p);
        modify(&p);
        puts(p);
}

int modify(char **p){
        *p = malloc(sizeof(char) * 20);
        strcpy(*p,"modified");
}

Here, main passes a pointer to the local variable p, and modify
changes the memory to which that pointer points (which happens to be
main's local variable p).

This would also work:

int main(){
        char p[9] = "test";
        puts(p);
        modify(p);
        puts(p);
}

int modify(char *p){
        strcpy(p,"modified");
}

Here, p is an array, and main passes a pointer to the start of the
array. modify overwrites the contents of the array.

Yet another example which would work:

int main(){
        char *p;
	p = malloc(9);
	strcpy(p, "test");
        puts(p);
        modify(p);
        puts(p);
}

int modify(char *p){
        strcpy(p,"modified");
}

> I have a few thick books on C and cannot deduce what the problem 
> would be. The code below SHOULD be of the same concept and it produces the 
> expected result. It's output is 
> 1
> 2
> 
> #include <stdarg.h>
> #include <stdlib.h>
> #include <string.h>
> 
> int main();
> int modify(int *p);
> 
> int main(){
>         int *p;
>         p = malloc(sizeof(int));
>         *p = 1;
>         printf("%d\n",*p);
>         modify(p);
>         printf("%d\n",*p);
> }
> 
> int modify(int *p){
>         free(p);
>         p = malloc(sizeof(int));
>         *p = 2;
> }

The behaviour of this code is undefined. It is only by coincidence
that you get the behaviour which you expect.

Specifically, malloc() just happens to return a pointer to the memory
which was just freed, and to which the local variable p in main still
happens to point. malloc() is not guaranteed to behave this way.

-- 
Glynn Clements <glynn.clements@virgin.net>
