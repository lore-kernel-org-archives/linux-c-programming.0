From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Issue "address of local variable returned"
Date: Fri, 27 May 2005 17:09:21 +0100
Message-ID: <17047.17969.471930.213042@gargle.gargle.HOWL>
References: <013a01c560fb$37b16e80$9736a8c0@ispl091>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <013a01c560fb$37b16e80$9736a8c0@ispl091>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Amit Dang <amit_dang@intersolutions.stpn.soft.net>
Cc: linux-c-programming@vger.kernel.org


Amit Dang wrote:

>     I am facing following issue
> (g++ compiler  "g++ (GCC) 3.2.3 20030502 (Red Hat Linux 3.2.3-20)" is being
> used for compilation.)
> 
> Following piece of code gives warning: "address of local variable `op'
> returned"

> #include<iostream>
> using namespace std;
> 
> struct s {
>     char op[24];
>     int j;
> };
> 
> char* fun()
> {
>     struct s op;
>     strcpy(op.op, "898898898\0");
>     return op.op;
> }
> 
> int main()
> {
>     cout << fun() << endl;
>     return 0;
> }

> But when the structure is change no warning is issued
> Following is the new structure

> struct s {
>         int j;
>         char op[24];
> };

> Obviously I know that "op.op" should not be returned.
> 
> g++ compiler  "g++ (GCC) 3.2.3 20030502 (Red Hat Linux 3.2.3-20)" is being
> used for compilation.

Consider filing a bug report or enhancement request with the GCC
developers.

Ultimately, a compiler can't warn about every possible problem with a
program. Although I can't see any reason why it would be hard to catch
the second case.

-- 
Glynn Clements <glynn@gclements.plus.com>
