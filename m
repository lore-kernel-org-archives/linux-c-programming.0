From: "David Chao" <teanau@singnet.com.sg>
Subject: Something interesting with multi-subscript arrays.
Date: Wed, 26 May 2004 23:30:19 +0800
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <002c01c44336$5d420800$0200a8c0@LAPTOP>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi,

I happen to learn something interesting abt multiple-subscript arrays at
work today. I am hoping if someone can confirm what I discovered. Having
done a fair amt of C programming, I always thought that arrays like:

unsigned char a[2][3];

can be accessed using like that:

unsigned char **b;

b=a;

Then using *(*(b+1)+1) (for eg.) to access the array. Since, isn't this
equivalent to a[1][1]?

However, I am totally wrong! b=a generates a surprise compiler error. I
spent quite sometime to resolve this error. To cut a long story short, I
found another interesting fact. This code:

#include <stdio.h>

int main(void)
{
    unsigned char a[2][3] = {{'a','b','c'},
                             {'d','e','f'}};
    unsigned char (*b)[3];

    b = a;

    printf("%d\n", b);
    printf("%d\n", *b);
    printf("%d\n", **b);
    printf("%c\n", **b);
    system("PAUSE");
    return 0;
}

gives the result:

2293592
2293592
97
a
Press any key to continue . . .

This means that *b does nothing at all in this case. Surprise! Learn
something new everyday.

Best,
David

