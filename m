From: Suma C <gsumac@gmail.com>
Subject: malloc with size 0
Date: Thu, 22 Dec 2005 10:13:57 +0530
Message-ID: <1f5f62170512212043w17e1c8e7v3781e0dc72845efc@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: C programming list <linux-c-programming@vger.kernel.org>

Hi all

When  a 0 is passed to malloc, I get a valid pointer instead of a NULL
.What does this mean?

thanks  in advance

regards
suma

PS:
code:
#include <stdio.h>
#include <stdlib.h>

int main()
{
        char  *ptr = NULL;
        ptr = malloc(0);
        printf("ptr :%u \n",ptr);
        strcpy(ptr,"abcdefghijkl");
        printf("%s\n",ptr);  //no seg fault here????
        return 0;
}
