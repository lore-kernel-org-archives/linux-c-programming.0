From: Jon Mayo <jon@rm-f.net>
Subject: Re: Pointer to a char
Date: Tue, 18 Sep 2012 18:04:02 -0700
Message-ID: <CADWT_cNu9u0Ni9aP0f3YBu6drLavU+ZY+kncG5Ae-BmcOEqk0g@mail.gmail.com>
References: <CAA6iF_7=j6J+wOyYcQgwvSO1dG92kVNcJcYXFY7BiiRZ4d0UKQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <CAA6iF_7=j6J+wOyYcQgwvSO1dG92kVNcJcYXFY7BiiRZ4d0UKQ@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Randi Botse <nightdecoder@gmail.com>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>

On Tue, Sep 18, 2012 at 2:29 AM, Randi Botse <nightdecoder@gmail.com> wrote:
> Hi, having coding in C for 3 years but I'm still not clear with this one.
> Consider this code.
>
> ...
> char *p;
> unsigned int i = 0xcccccccc;
> unsigned int j;
>
> p = (char *)  &i;
> printf("%.2x %.2x %.2x %.2x\n", *p, p[1], p[2], p[3]);
>

printf (and other var arg functions) don't take char, short or float.
they take int or double and a few other types.
those [signed] chars are going to get sign extended when they are
converted to signed int. (0xcc = -52 )

> memcpy(&j, p, sizeof(unsigned int));

the data at i, pointed to by p has not changed, so this memcpy works.
The only thing that is weird is how you interpreted the data (in your
printf above).

> printf("%x\n", j);
> ...
>
> Output:
>
> ffffffcc ffffffcc ffffffcc ffffffcc
> 0xcccccccc
>
>
> My questions are:
>
> 1. Why it prints "ffffffcc ffffffcc ffffffcc ffffffcc"? (if p is
> unsigned char* then it will print correctly "cc cc cc cc")
> 2. Why pointer to char p copied to j correctly, why not every member
> in p overflow? since it is a signed char.
>
> Regards.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
