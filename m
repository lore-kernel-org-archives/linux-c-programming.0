From: Leon Shaw <shaw.leon@gmail.com>
Subject: Re: Pointer to a char
Date: Wed, 19 Sep 2012 16:47:55 +0800
Message-ID: <CABAhCOTPLJWTwb=Oqnhpz3D8zoW+aAnCYd6quTXYPXhA2beOKQ@mail.gmail.com>
References: <CAA6iF_7=j6J+wOyYcQgwvSO1dG92kVNcJcYXFY7BiiRZ4d0UKQ@mail.gmail.com>
	<CADWT_cNu9u0Ni9aP0f3YBu6drLavU+ZY+kncG5Ae-BmcOEqk0g@mail.gmail.com>
	<CAA6iF_4qvxTyJi5Ex8hhURjttv94oVHrNxVzNXUWEEE0GHdcZA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=6C32WE4eBTJRiNgBdmjvKia+X3+/khOLtMvauF91JZk=;
        b=rjivG149YQX6nxedFFITH2AvnwA2vfboqdu7WIqFKvoF7lw+KMXHx0w5JFZXC/J9il
         7RA6zeLXzNcTgRIbJELzgt6+ZeJQN18oZqgm2dMH23t/Iu0LmU/GK8/VD1OjAA9YCAAP
         4cQa/iiQ9UcZ+E39wBi6wUlkb5zq9NPHTWVfx+IPJzX5QiL6NzA/zYtXljlGaGWmeTVi
         0MUhocD42+Fx7hu7AZgGcWLOac4wlwm5+TGcvPLNT9Rxj+0CXZJ4bU5/vD7TAJNDcuwN
         7dtS7obWnoCEEGgZlWogAAMhffouKkJn8lUPZmf2VVc4oNi0qmYpTbLQ7/69QPsKoetS
         +oFg==
In-Reply-To: <CAA6iF_4qvxTyJi5Ex8hhURjttv94oVHrNxVzNXUWEEE0GHdcZA@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Randi Botse <nightdecoder@gmail.com>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>

On Wed, Sep 19, 2012 at 3:59 PM, Randi Botse <nightdecoder@gmail.com> wrote:
> Hi Phil, Jon
>
> Thanks, now I'm clear with this, assignment doesn't care with type modifier.
>
> Code such as
>
> unsigned int j = 0xffeeddcc;
> int i = j;
>
> Both has the same value depending on how them interpreted (is this
> assumption correct?)
>

According to C99, when applying integer conversion, "if the new type
is signed and the value cannot be represented in it, either the result
is implementation-defined or an implementation-defined signal is
raised". But most implementation keeps the same memory representation.

> Because,
>
> printf("%u", i) will be different to printf("%i", i)
> - but -
> printf("%u", i) wlll be same as printf("%u", j)
>
>
> Actually why asking this because I often see a pointer to a char* cast
>
> Let me show you with this example.
> Consider some structures...
>
> struct a_data {
>     unsigned char f1[4];
>     unsigned char f2[6];
>     unsigned short f3[2];
> };
>
> and another struct named b_data, c_data, etc.
>
> Then there is a general function to process all type of structure,
> maybe something like this:
>
> int process_data(char *buffer, size_t len);
>
> Then if we cast for example a pointer to a_data struct to a char* as follow:
>
> struct a_data a;
> process_data((char*) &a, sizeof(a));
>
> I though since it was cast to char*, the cast is "problem" because
> every signed char buffer will have a range CHAR_MIN to CHAR_MAX,
> therefore value of CHAR_MAX to UCHAR_MAX will broken (signed char
> overflow)
>

Actually, whether char is signed or unsigned is
implementation-defined, though, normally, it is signed. SCHAR_MAX+1 ~
UCHAR_MAX can be mapped to SCHAR_MIN ~ -1.
For a pointer that denotes a memory region, what type it points to
doesn't cause much problem as long as you don't simply dereference it.
In such cases, void * might be less confusing.

Regards,
Leon


> I think process_data() should be declared with
>
> int process_data(unsigned char *buffer, size_t len)
>
> this declaration in seem correct and work for me.
>
> However, now I'm conceptually understand why this works.
>
> Thanks.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
