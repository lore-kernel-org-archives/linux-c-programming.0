From: "Charlie Gordon" <gmane@chqrlie.org>
Subject: Re: Question on memcpy()
Date: Wed, 15 Sep 2004 16:34:37 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <ci9jsn$1jq$1@sea.gmane.org>
References: <E3E30069B061524E90BCEE4417E3066113852B@monm207.monmouth.army.mil>
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

"Huber, George K RDECOM CERDEC STCD SRI" <George.K.Huber@us.army.mil> wrote
in message
news:E3E30069B061524E90BCEE4417E3066113852B@monm207.monmouth.army.mil...
> Wen wrote,
>
> >struct sample A, B;
> >...
> >...
> >memset(&A, 0, sizeof(sample));
> >memcpy(&A, (char *)&B, sizeof(sample));
> >...
> >I could not understand why the second argument is (char *)&B, but not &B.
> >I think it should be &B.
>

This is correct, I suspect this cast comes from the programmer ancient
belief that memcpy should be passed char pointers (confusingly refered to as
byte pointers).  Since it is defined to take (void *, const void*, size_t) ,
passing it any type of pointer is fine, including superfluous casts.

It should be noted that while the initialization to 0 required a call to
memset, copying the raw contents of une struct to another can be done more
efficiently (usually) in C by writing:

A = B;

as far as why sizeof(sample) is accepted at all by the compiler, there 3
possible explanations:

- there is a typedef for sample, at it better be defined to struct sample.
- there is a variable by the name sample in scope, and it better be an
instance of struct sample.
- there is a #define defining the identifier sample to something valid as an
operand to sizeof.  Again, it better be consistent with the use in these 2
lines.

It would be better to make no assumptions about the types of A and B and
write:

memset(&A, 0, sizeof(A));
...
A = B;

This way, the compiler will protest if A and B types don't match, and will
compute the right size for A no matter what type it's defined to be.

Chqrlie.



