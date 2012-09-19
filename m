From: Randi Botse <nightdecoder@gmail.com>
Subject: Re: Pointer to a char
Date: Wed, 19 Sep 2012 14:59:40 +0700
Message-ID: <CAA6iF_4qvxTyJi5Ex8hhURjttv94oVHrNxVzNXUWEEE0GHdcZA@mail.gmail.com>
References: <CAA6iF_7=j6J+wOyYcQgwvSO1dG92kVNcJcYXFY7BiiRZ4d0UKQ@mail.gmail.com>
	<CADWT_cNu9u0Ni9aP0f3YBu6drLavU+ZY+kncG5Ae-BmcOEqk0g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=YO7TB2h5b6vbxSowGs1vSynSoHYzjMeBiIPhGI2xP0w=;
        b=NIRHsDOBPBw9Mfpog1BgpaBI48ypsT5WXFEtuoULUApI1iw0zLtozgK6QahM/4nX6f
         cPEel+JWWbYUgePyZehBkGq/fj8A8PYkeAe5vxLCjDahsX0KGqmnm7VZmxt5zZCV+2QO
         RE0UOdiIFsZd9sM0H2QJkhLcSLPiangxZTlqjgpmgNf2NrkmsgzAhCrbVDgyqPr7C9hx
         nN+0Ls00Cbolnx3sI0utuLZTrvcMEiVLyaIyFh0d8lzjhKNcPJnyGVv/ugPCTm0MjhFK
         fwZBQlMFyPDmDURP3uSsxGJidoorlPsx9v3V7P4TaY7bU4ntZTqn/cV2F45mfeA4p2l7
         T0cQ==
In-Reply-To: <CADWT_cNu9u0Ni9aP0f3YBu6drLavU+ZY+kncG5Ae-BmcOEqk0g@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming <linux-c-programming@vger.kernel.org>

Hi Phil, Jon

Thanks, now I'm clear with this, assignment doesn't care with type modifier.

Code such as

unsigned int j = 0xffeeddcc;
int i = j;

Both has the same value depending on how them interpreted (is this
assumption correct?)

Because,

printf("%u", i) will be different to printf("%i", i)
- but -
printf("%u", i) wlll be same as printf("%u", j)


Actually why asking this because I often see a pointer to a char* cast

Let me show you with this example.
Consider some structures...

struct a_data {
    unsigned char f1[4];
    unsigned char f2[6];
    unsigned short f3[2];
};

and another struct named b_data, c_data, etc.

Then there is a general function to process all type of structure,
maybe something like this:

int process_data(char *buffer, size_t len);

Then if we cast for example a pointer to a_data struct to a char* as follow:

struct a_data a;
process_data((char*) &a, sizeof(a));

I though since it was cast to char*, the cast is "problem" because
every signed char buffer will have a range CHAR_MIN to CHAR_MAX,
therefore value of CHAR_MAX to UCHAR_MAX will broken (signed char
overflow)

I think process_data() should be declared with

int process_data(unsigned char *buffer, size_t len)

this declaration in seem correct and work for me.

However, now I'm conceptually understand why this works.

Thanks.
