From: "Daniel =?ISO-8859-1?Q?Sch=FCle=22?= <uval@rz.uni-karlsruhe.de>
Subject: Re: problem with const in structure
Date: Mon, 6 Jan 2003 18:46:13 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <000201c2b5d4$544aaef0$0200a8c0@earth>
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

> #include <stdio.h>
>
> struct node {
> const int x;
> char name[20];
> struct node *next;
> };
>
> int main()
> {
> struct node newnode;
>
> newnode.x = 10;
> newnode.x = 12;
> printf ("x = %d\n", newnode.x);
> return 0;
> }
> ####
>
> Now, you can see that even though I have defined x to be const int, I can
> assign it values. When I compiled the program, it gives the warning that
> assignment of read-only member x but when I ran the program, it worked
> fine. Where is the catch. How do I define a structure variable to be
> const?

Welcome in C World    (which is mainly non const :))
In C++  it's easy to fix
struct node
{
    node(int x_, node *  left_=0, node *  right_=0) : x(x_), left(left_),
right(right_)
    {
        x = x_;    // is *always* compile time error (in C++), because
                       // you are altering const variable
         // in C++ you have to be aware that assignment and initialization
are *not* the same thing
         // they might seem for some to act similar and in some contexts
they do
    }
    // const node * root;
    const int x;
    node * left, * right;
};

int i = 0; // is initialisation of non const varibale
i = 0;      // assignment
const int null;    // error, const must be initialized
null = 0;    // error
const int null = 0;    // ok, in this way or
const int null(0);      // or
const int null = int(0);


Daniel.

--
$>fortune
the generation of random numbers is too important
to be left to chance.




