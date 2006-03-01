From: "Gvks Satish-A14577" <satish.k@motorola.com>
Subject: Question on SIGSEGV / Stack growth
Date: Wed, 1 Mar 2006 18:09:08 +0800
Message-ID: <3100473D52017B48B9068E079BE2A6E664C821@ZMY16EXM67.ds.mot.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi ,
 
I have a question regarding SIGSEGV in the context of process stack
growth. I have the 
following piece of code.
 
#include<stdio.h>
main()
{
    char *ptr;
    char i=10;
    int j;
    ptr = &i;
    for(j=0; j<3000; j++)
        printf("%d -- %d\n",j, *(ptr+j));
}
 
 
I was expecting that the program will get a SIGSEGV immediately after
the first iteration of the for loop, since that
address doesn't belong to the process address space. But it didn't
happen. Then I thought that the stack is allocated 
in terms of pages and hence thought that I'll get SIGSEGV after a PAGE
size. Even that didn't happen.
 
The program got SIGSEGV at different values of j on different OS. On
linux it occured at 1896. 
 
I looked at the getrlimit value of stack size. Even that didn't match
with the value where I got SIGSEGV.
 
Any idea what's happening ?
 
Thanks & Regards,
Satish
