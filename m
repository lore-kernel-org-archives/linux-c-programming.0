From: Jon Mayo <jon.mayo@gmail.com>
Subject: Re: swapcontext and free memory
Date: Thu, 19 Mar 2009 03:21:50 -0700
Message-ID: <e694f9e00903190321y1c5280ebx26bb9d7a2dd7fae6@mail.gmail.com>
References: <18142048.1237399551641.JavaMail.ngmail@webmail17.arcor-online.net>
	 <49C149E5.4020309@yahoo.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=+3jR40u6TXjUhqw/yw30/LUt4oce8V5sxiaMC49Cjz8=;
        b=acK260UNYoSkM3bRJY/Uqg5JoZjnczQdCEv2bkA6q0IHGR4qwOsuKc5qh24XRnYwM6
         gQq98SNzYSHRD3j/D/fXGdq00KblcvcO/jwl60C2o6yUurnDUFfMa6WU6OcpQ8hxPXgF
         GCs+azKLwjre+68RPXHokKOK5wn9QwgSaEWMo=
In-Reply-To: <49C149E5.4020309@yahoo.com.br>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Tiago Maluta <maluta_tiago@yahoo.com.br>
Cc: linux-c-programming@vger.kernel.org

On Wed, Mar 18, 2009 at 12:22 PM, Tiago Maluta
<maluta_tiago@yahoo.com.br> wrote:
> xcomp@arcor.de wrote:
>> Hi all,
>> I have written a small test case which simply creates a new context,=
 swaps to it and returns to the main function. I am allocating memory f=
or the ucontext_t structures and the stack on which the context is exec=
uted using malloc.
> Because of this I also want to deallocate the memory again using free=
=2E
> The problem is I can't deallocate the memory after swapping back. It
> runs only if all three free() calls are commented out. Otherwise a
> segmentation fault occurs. Does swapcontext handle this on its own? C=
an
> anyone explain this behavior? I didn't find anything concerning this
> problem in the web.
>> I am running this program on Ubuntu 8.04 with the following system i=
nformation: Linux
> ubuntu8041 2.6.24-23-generic #1 SMP i686 GNU/Linux
>
> (...)
>
>> =C2=A0 =C2=A0 =C2=A0 main_context =3D (ucontext*) malloc(sizeof(ucon=
text));
>> =C2=A0 =C2=A0 =C2=A0 thread_context =3D (ucontext*) malloc(sizeof(uc=
ontext));
>
> changing:
>
> main_context =3D (ucontext_t*) malloc(sizeof(ucontext_t));
> thread_context =3D (ucontext_t*) malloc(sizeof(ucontext_t));
>
> and compiling with free() I got:
>
> #./a.out
> start
>
> Allocated memory:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0main_context: =C2=A0 0x804b008
> =C2=A0 =C2=A0 =C2=A0 =C2=A0thread_context: 0x804b168
> =C2=A0 =C2=A0 =C2=A0 =C2=A0thread_stack: =C2=A0 0x804b2c8
> thread_function was called...
>
> swapcontext() returned. Freeing memory starts now...
> thread_stack was deallocated...
> thread_context was deallocated...
> main_context was deallocated...
>
> I'm using glibc version 2.8.
>
> --tm
>
>
>

I think you should be able to free() them fine. Could you post a short
bit of source that exhibits the problem? Also I tend to mmap() some
anonymous memory instead of using malloc() for things like makecontext
and sigaltstack. Because I want to put guard pages on my stacks due to
them generally being very small.

--=20
Jon Mayo
<jon.mayo@gmail.com>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
