From: "Huber, George K RDECOM CERDEC STCD SRI" <George.K.Huber@us.army.mil>
Subject: RE: Question on memcpy()
Date: Wed, 15 Sep 2004 10:14:24 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <E3E30069B061524E90BCEE4417E3066113852B@monm207.monmouth.army.mil>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Wen wrote,

>struct sample A, B;
>...
>...
>memset(&A, 0, sizeof(sample));
>memcpy(&A, (char *)&B, sizeof(sample));
>...
>I could not understand why the second argument is (char *)&B, but not &B.
>I think it should be &B. 

I would have to agree with you that the second argument should be just &B.
If 
you were going to cast it to anything, I would cast it to const void*.  I
recall 
that any pointer type may be promoted to a void-pointer by the compiler,
although
my memory is a littel fuzzy on this.  

>Sometimes I found A is all zero. but B is not all zero in fact.  
>Is it due to the second argument (char *)&B?

I would be more suspect of the third argument, I beleive that the argument
to
sizeof should be `struct sample' not just `sample' (I am not sure how the
compiler
will interpret the type sample).  I would code the above two lines in one of
the 
following ways,

method (1):
memset((void*)&A, 0, sizeof(struct sample))
memcpy((void*)&A, (const void*)&B, sizeof(struct sample))

method (2):
memset((void*)&A, 0, sizeof(A))
memcpy((void*)&A, (const void*)&B, sizeof(B))

Note: the explicit cast are probably unnecessary, I do them for two reasons.
First,
      I think it improves the readability of the as it is clearly apparent
what type
      of casts are going one.  Secondly, I always run my source code though
severl 
      `lint' checkers and one will always throw a warning about a conversion
of 
      pointer to sometime to void*.  Doing the explicit casts will cause the
warning 
      to be suspressed.

George.
