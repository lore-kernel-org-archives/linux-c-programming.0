From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: "noreturn"
Date: Mon, 30 Jul 2007 01:07:12 +0100
Message-ID: <18093.11184.18704.732705@cerise.gclements.plus.com>
References: <46AC873C.3060908@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <46AC873C.3060908@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>


Shriramana Sharma wrote:

> man:gcc at -Wunitialized says:
> 
> Some spurious warnings can be avoided if you declare all the functions 
> you use that never return as noreturn.
> 
> Google says this term is used only in Microsoft C++.

Wrong.

> So what is it doing in GCC's page?

The "noreturn" attribute is the first one in the "Function Attributes"
page of the gcc Info file:

`noreturn'
     A few standard library functions, such as `abort' and `exit',
     cannot return.  GCC knows this automatically.  Some programs define
     their own functions that never return.  You can declare them
     `noreturn' to tell the compiler this fact.  For example,

          void fatal () __attribute__ ((noreturn));

          void
          fatal (/* ... */)
          {
            /* ... */ /* Print error message. */ /* ... */
            exit (1);
          }

     The `noreturn' keyword tells the compiler to assume that `fatal'
     cannot return.  It can then optimize without regard to what would
     happen if `fatal' ever did return.  This makes slightly better
     code.  More importantly, it helps avoid spurious warnings of
     uninitialized variables.

     Do not assume that registers saved by the calling function are
     restored before calling the `noreturn' function.

     It does not make sense for a `noreturn' function to have a return
     type other than `void'.

     The attribute `noreturn' is not implemented in GCC versions
     earlier than 2.5.  An alternative way to declare that a function
     does not return, which works in the current version and in some
     older versions, is as follows:

          typedef void voidfn ();

          volatile voidfn fatal;

-- 
Glynn Clements <glynn@gclements.plus.com>
