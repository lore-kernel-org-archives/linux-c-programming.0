From: Shriramana Sharma <samjnaa@gmail.com>
Subject: Re: efficiency in passing a value to a function
Date: Sun, 08 Apr 2007 20:15:42 +0530
Message-ID: <46190016.2000402@gmail.com>
References: <4613DCB8.8030007@gmail.com> <6a00c8d50704041138l278f34d2t9c97ba551f7ad5c3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <6a00c8d50704041138l278f34d2t9c97ba551f7ad5c3@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Steve Graegert wrote:

> I have seen many programs making use const reference parameters in
> order to inform the compiler that the parameter is read-only, and
> hence should be better optimized.

I thought the usage of const before & in function definitions was to 
prevent the value from being modified. I never knew there is an 
optimization aspect.

> Unfortunately, this intent is at odds with the C++ language
> definition. The const keyword says that the storage may not be
> modified through the given name. What it does not say is that the
> storage cannot be modified through some other name.

I observe that this is true for C too, not just C++. Anyway, how is it 
exactly "at odds" with the language definition?

[BTW gcc is intelligent enough to give me a compile-time warning:

const.c:7: warning: initialization discards qualifiers from pointer 
target type

when I write const int i = 2 ; int * iptr = & i ; and I don't even have 
to give -Wall !]

> you can only initialize them, const is basically ineffective a
> improving run-time performance. It does, however, catch errors in the
> programming process.

const is also useful for preventing a function writing to a variable 
passed to it as reference, which is what this thread was originally about.

Just for the record, are there any other uses for const?

Shriramana Sharma.

