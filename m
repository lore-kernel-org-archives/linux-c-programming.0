From: vinit dhatrak <vinit.dhatrak@gmail.com>
Subject: Re: thread: reentrant question
Date: Fri, 25 Dec 2009 01:00:24 +0530
Message-ID: <edf0f34e0912241130y20f6a9daj7085e57ee498e211@mail.gmail.com>
References: <34e1241d0912241041v60c031a2kc31fdb3b4ebbd317@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=Cw71y6mxFpZSIgpNCaZS4uy0kZBexnJdwXp09t5UzeE=;
        b=rPubPHXjoj+x6jXbb50t5A97P/m/mJ0G/Aum72YunzISbFe96eeyTj5yJc27diUx4N
         RPAref4EMhxaJbCqL2p/p+f7bHAu+DPpTEVfGNo4tak4nu6i2k0dkAE+VJ4RVPD067jI
         SIFUUj8j11xuexNYbEVxumuGxC4GPqmZqYpM4=
In-Reply-To: <34e1241d0912241041v60c031a2kc31fdb3b4ebbd317@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Randi Botse <nightdecoder@gmail.com>
Cc: linux-c-programming@vger.kernel.org

Hi Randi,

You are observing this because of malloc's behaviour. If you allocate
and free same-sized memory multiple times, then malloc tries to reuse
the memory. You can try this by putting malloc/free statements in a
loop.

In your case, first thread gets created, it starts executing, it
allocates the memory, prints the address and frees it. After first
thread finishes its execution, second thread starts. It allocates the
memory so allocator reuses the same chunk and you get same address.

If you put some sleep between malloc and free OR remove the free
statement itself as you did then you will get different addresses. So
this is really a timing issue when you do thread programming.

Hope this helps you understand the issue.

-Vinit

On Fri, Dec 25, 2009 at 12:11 AM, Randi Botse <nightdecoder@gmail.com> =
wrote:
> Hi all,
>
> I'm now learning thread reentrancy on Linux, so i write simple codes
> for demonstration:
>
> #include <stdio.h>
> #include <stdlib.h>
> #include <pthread.h>
>
> void *func(void *data)
> {
> =A0 =A0char *ptr;
>
> =A0 =A0ptr =3D malloc(8);
> =A0 =A0printf("thread%i -> ptr at: %p\n", *(int*) data, ptr);
> =A0 =A0free(ptr);
> =A0 =A0return NULL;
> }
>
> #define NTHREAD 5
>
> int main(void)
> {
> =A0 =A0pthread_t thread[NTHREAD];
> =A0 =A0int i;
>
> =A0 =A0for (i =3D 0; i < NTHREAD; i++)
> =A0 =A0 =A0 =A0if (pthread_create(&thread[i], NULL, func, (void*) &i)=
)
> =A0 =A0 =A0 =A0 =A0 =A0return -1;
> =A0 =A0for (i =3D 0; i < NTHREAD; i++)
> =A0 =A0 =A0 =A0pthread_join(thread[i], NULL);
> =A0 =A0return 0;
> }
>
>
> I know the func() function is not reentrant, worst printf() debugging
> told me that's each thread pointer to character (ptr) may has same
> address, like this output:
>
> thread1 -> ptr at: 0x9a80128
> thread1 -> ptr at: 0x9a80138
> thread2 -> ptr at: 0x9a801d8
> thread4 -> ptr at: 0x9a801d8
> thread4 -> ptr at: 0x9a801d8
>
> I try to modify the func() by not free ptr to be:
>
> void *func(void *data)
> {
> =A0 =A0char *ptr;
>
> =A0 =A0ptr =3D malloc(8);
> =A0 =A0printf("thread%i -> ptr at: %p\n", *(int*) data, ptr);
> =A0 =A0/* free(ptr); */
> =A0 =A0return NULL;
> }
>
> And the result is i always got different address of each thread's ptr=
, such as:
>
> thread0 -> ptr at: 0x8db2098
> thread1 -> ptr at: 0x8db2138
> thread2 -> ptr at: 0x8db21d8
> thread3 -> ptr at: 0x8db2278
> thread4 -> ptr at: 0x8db2318
>
> Can you explain me why this happen? how about my printf() debugging
> method? it's works for this demonstration?
> Thanks before.
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0- Randi
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
