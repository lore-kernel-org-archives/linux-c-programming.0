From: "Plato" <zhangguoqiang@xunlei.com>
Subject: Why does math.h not declare function round?
Date: Mon, 24 Sep 2007 12:10:07 +0800
Message-ID: <200709241210070352829@xunlei.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming <linux-c-programming@vger.kernel.org>

Hi!
    I made such a program foo.c:

#include <math.h>

int main()
{
    double bar=1.2;
    printf("%f\n", round(bar));
}
    
Then compile and run:
[root@so41 tmp]# gcc foo.c -ofoo -lm
[root@so41 tmp]# ./foo
0.000000

The result was obviously wrong. Then I add statement:
#include <math.h>
double round(double x);

int main()
{
    double bar=1.2;
    printf("%f\n", round(bar));
}

Then compile and run:
[root@so41 tmp]# gcc foo.c -ofoo -lm
[root@so41 tmp]# ./foo
1.000000

Now it's right.

I wonder why function round not declared in math.h. Anyone have idea?

Thx.




Plato
2007-09-24

