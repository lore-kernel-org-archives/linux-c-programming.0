From: "Amit Dang" <amit_dang@intersolutions.stpn.soft.net>
Subject: Re: Issue "address of local variable returned"
Date: Fri, 27 May 2005 09:24:56 +0530
Message-ID: <011d01c5626f$e7bdba70$9736a8c0@ispl091>
References: <013a01c560fb$37b16e80$9736a8c0@ispl091> <2ab8d39a05052610175e3d7018@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: krzaq <krzakers@gmail.com>
Cc: linux-c-programming@vger.kernel.org

Hi Karol,
    Thanks a lot for your reply. I am aware that memory for local variable
is allocated on stack and so its address should not be returned.
My problem is compiler warning. For two different structs, compiler warning
change.

If following struct is used, compiler flashes a warning
struct s {
     char op[24];
     int j;
 };

but if int is moved before char no warning is flashed by the compiler.
struct s {
         int j;
         char op[24];
 };

For details, refer text of original mail attached below.
Regards,
Amit Dang

----- Original Message ----- 
From: "krzaq" <krzakers@gmail.com>
To: "Amit Dang" <amit_dang@intersolutions.stpn.soft.net>
Sent: Thursday, May 26, 2005 10:47 PM
Subject: Re: Issue "address of local variable returned"


> On 5/25/05, Amit Dang <amit_dang@intersolutions.stpn.soft.net> wrote:
> > Hi All,
> >     I am facing following issue
> > (g++ compiler  "g++ (GCC) 3.2.3 20030502 (Red Hat Linux 3.2.3-20)" is
being
> > used for compilation.)
> >
> > Following piece of code gives warning: "address of local variable `op'
> > returned"
> > #################################
> > #include<iostream>
> > using namespace std;
> >
> > struct s {
> >     char op[24];
> >     int j;
> > };
> >
> > char* fun()
> > {
> >     struct s op;
> >     strcpy(op.op, "898898898\0");
> >     return op.op;
> ^^----------------- char* "op" is valid in the visibility context
> of struct "op", which is the body of function fun().
> Struct "op" is created on stack and gets "deleted" after returning
> from function fun().
> Try something like this:
>
> struct s* op;
> op = (struct s*) malloc(sizeof(struct s));
> strcpy(op->op, "898898898\0");
> return op->op;
>
> > }
> >
> > int main()
> > {
> >     cout << fun() << endl;
> >     return 0;
> > }
> > #################################
> > But when the structure is change no warning is issued
> > Following is the new structure
> > #################################
> > struct s {
> >         int j;
> >         char op[24];
> > };
> > #################################
> >
> > Obviously I know that "op.op" should not be returned.
> >
> > g++ compiler  "g++ (GCC) 3.2.3 20030502 (Red Hat Linux 3.2.3-20)" is
being
> > used for compilation.
> >
> > Thanks in advance,
> > Amit Dang
> >
> > -
> > To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >
>
>
> -- 
> Regards
> Karol Krzak

