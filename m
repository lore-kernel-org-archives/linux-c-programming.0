From: "Michal Nazarewicz" <mnazarewicz@gmail.com>
Subject: Re: linux C array simplified.
Date: Wed, 12 Jan 2011 17:39:25 +0100
Message-ID: <op.vo7e7xv94q2g56@mnazarewicz.zrh.corp.google.com>
References: <AANLkTintj70bSB+2MuR21EydOJX9cXpFiDQ4JMy+SSKa@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:content-type:to:subject:references:date
         :mime-version:content-transfer-encoding:from:organization:message-id
         :in-reply-to:user-agent;
        bh=AI+jbTivMcnscuwqsNnC1aTpmBVbAl8W3nC+5i3gNjw=;
        b=U4Ri9Oe311eZ89A55qsZpZKMSA0+tRf+dTBcZTXnEOKDbWwxQ6mObX3etGprdodGMy
         JeFXGluyeF24MMkjoEG6Aga14I+IryobB8u6LlhBcp1AOoCPsEkkR17KS/rZnErOw/Rd
         2vqhaDz+Re3IgmJiwnAJXJgq/d6V3+xj6VlFk=
In-Reply-To: <AANLkTintj70bSB+2MuR21EydOJX9cXpFiDQ4JMy+SSKa@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: linux-c-programming@vger.kernel.org, ratheesh k <ratheesh.ksz@gmail.com>

On Wed, 12 Jan 2011 16:40:30 +0100, ratheesh k <ratheesh.ksz@gmail.com>  
wrote:

> I wrote program to make c array simple. I  have added comments in
> between so that my student could understand it easily.
> Could you please check whether this comments are correct. Could you
> correct me if i am wrong. Thanks in advance.
> ********************************************************************************************************************************************************
> # include <stdio.h>
>
> int functionA(int (*ptr)[10])
>  {
>   /* passing  array  address. */
>
>   /* ptr pointer to an array and &ptr is the pointer to array pointer
>      Both are of size 4 bytes */

No.  This is platform dependent and what's more, in theory both can have
different sizes.

Also, IIRC, strictly speaking &ptr is not a pointer but (an expression  
that yields)
the address.

>   printf("sizeof(ptr) = %ld\n", sizeof(ptr));
>   printf("sizeof(&ptr) = %ld\n", sizeof(&ptr));
>
>   /* if ptr is incremented . ptr + 10*4  will be the answer */

Again, you assume sizeof(ptr) is 4 which does not need to be true.

>   printf("pointer address ptr=%p ptr+1=%p\n" , ptr ,ptr+1);
>
>   /*since ptr is an array pointer ; element are accessed like (*ptr[0])
>   */

You meant (*ptr)[0].

>   printf("access memory ptr=%d\n" , (*ptr)[0] );
>   /* we could do this by  *(*ptr)+0); this is
>      same as **ptr
>   */
>   printf("access memory **ptr=%d\n" , (**ptr) );
>
>   /* access memory at *(*ptr+1)) */
>   printf("access memory *(*ptr+1)=%d\n" , *(*ptr+1) );
>
>   return 0;
>  }
>
> int functionB(int *abc )
>  {
>   /* address of first element is passed */
>
>   /* sizof pointer is 4 bytes */

Same as above.

>   printf("sizeof(abc) = %ld\n" ,sizeof(abc));
>
>   /* pointer increment will point to next element. pointes is of type
                                                      ^^^^^^^ -- typo

> (int *)
>   */
>   printf("pointer address abc=%p abc+1=%p\n", abc ,abc+1 );
>   /* we could access memory locations by dereferencing each location */
>
>   printf("access memory at *(abc)=%d, *(abc+1)=%d\n" , *abc ,*(abc+1));

No return statement.

>  }
>
> int functionC(int pqr[])
>  {
>   /* prq[] is same as char *abc (in functionA ). eventhough we have
> pqr[] declaration
>      compiler will treat this as simple char *pqr.
>      Please refer funnctiuonA for all explanations
>   */

Typos plus you meant functionB.

>   printf("sizeof(pqr) = %ld\n" ,sizeof(pqr));
>   printf("pointer address pqr=%p pqr+1=%p\n", pqr ,pqr+1 );
>   printf("access memory at *(pqr)=%d, *(pqr+1)=%d\n" , *pqr ,*(pqr+1));
>  }
>
> int functionD(int stp[20])
>  {
>   /*stp[20] is also treated as simple char *stp */
>   printf("sizeof(stp) = %ld\n" ,sizeof(stp));
>   printf("pointer address stp=%p stp+1=%p\n", stp ,stp+1 );
>   printf("access memory at *(stp)=%d, *(stp+1)=%d\n" , *stp ,*(stp+1));
>  }
>
>
> int main()
>   {
>     /* integer array is defined and values are initialized */
>     int arr[10]={1,2,3,4,5,6,7,8,9,0};
>
>     /* sizeof(arr) gives totoal sizeof array. that is equal to
> no_of_elements * sizeof_an_element
>        here it 10*4 = 40
>     */

sizeof(int) does not have to be 4.

>     printf("Sizeof(arr) = %ld\n", sizeof(arr));

You should probably write "sizeof" not "Sizeof".

>     /* address of array is &arr and its size is of 32bit (4bytes) */

Again, assumptions about type size.

>     printf("sizeof(&arr)=%ld\n" , sizeof(&arr));
>     /* sizeof(int) is 4 and arr[0] contains and integer */

See above.

>     printf("sizeof(arr[0])=%ld\n" , sizeof(arr[0]));
>     /* arr contains pointer to first element of the array . so it is
> incremented
>        it will point to next element
>     */
>     printf("pointer address  arr=%p  arr+1=%p \n" ,arr, arr+1 );
>     /* &arr contains array address. so if it is incremented, it will
> point to   (&arr) + (no.of.elements) * (sizof.each.element)
>        eg: if &arr is 1000 ;then
>                1000 + 10*4 =1040
>     */

See above.

>     printf("pointer address  &arr=%p &arr+1=%p\n" ,&arr ,&arr+1);
>
>     /* arr points to first element of the array. and *arr dereference
> first element */
>     printf("access element *arr=%d\n", *arr);
>     /* normal array access */
>     printf("access element arr[0]=%d\n", arr[0]);
>
>     /* (arr+1) points to next element in the array */
>     printf("access element *(arr+1)=%d\n", *(arr+1));
>
>     functionA(&arr);
>     functionB(arr);
>     functionC(arr);
>     functionD(arr);
>    }
