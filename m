From: Jon Mayo <jon@rm-f.net>
Subject: Re: Pointer to a char
Date: Wed, 19 Sep 2012 11:09:49 -0700
Message-ID: <CADWT_cOZYtdm1c4H8TVAn4YYaDaHNp0tPwVh=FCFDN1bjUs9Cw@mail.gmail.com>
References: <CAA6iF_7=j6J+wOyYcQgwvSO1dG92kVNcJcYXFY7BiiRZ4d0UKQ@mail.gmail.com>
	<CADWT_cNu9u0Ni9aP0f3YBu6drLavU+ZY+kncG5Ae-BmcOEqk0g@mail.gmail.com>
	<CAA6iF_4qvxTyJi5Ex8hhURjttv94oVHrNxVzNXUWEEE0GHdcZA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <CAA6iF_4qvxTyJi5Ex8hhURjttv94oVHrNxVzNXUWEEE0GHdcZA@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Randi Botse <nightdecoder@gmail.com>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>

On Wed, Sep 19, 2012 at 12:59 AM, Randi Botse <nightdecoder@gmail.com> wrote:
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
> Because,
>
> printf("%u", i) will be different to printf("%i", i)
> - but -
> printf("%u", i) wlll be same as printf("%u", j)
>
>

most architectures will work that way. some are a little nutty, but
standard C allows for implementation defined behavior when you
interpret a data type the wrong way. (it gets pretty specific about
signed versus unsigned representations)

I will readily admit that years of FORTH programming has warped my
mind and I no longer worry too much about signed int and unsigned int.
I tend to think more in terms of how big a data type is. The 'union'
keyword is especially useful for dealing with different ways to
interpret the same sized piece of memory.

float is often the same size as int. so this potentially works on some
platforms:

float f = 1;
int i = *(int*)&f;
printf("%u", i);

it would print some weird number that shows you how dramatic an
internal representation can differ if you manage to interpret it
incorrectly. (this trick is often used to dump float values in
hexidecimal "%x" for debugging purposes)

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

I would have made process_data take a void * instead, so people
wouldn't have to hack around C's simple type checking with casts.

casting struct a_data* to char* doesn't change the value of the
pointer. if you ignore compiler warnings it will work without the
cast.

now inside process_data, the char* type is useful, because the pointer
math will use sizeof(char) [which is always 1] for calculating
offsets. while your sizeof(struct a_data) will be around 14 bytes.
Some people don't like to use void* here, because the compiler will
not like pointer math done on a void* as sizeof(void) doesn't make
sense. Old compilers hacked around this by treating it as 1. New
compilers will prefer that you cast or load the void* into a char*
(which is how i usually implement these sorts of functions)

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

casting to a pointer won't alter the data. it just changes how you
would interpreter the data when dereferencing it. if process_data
doesn't dereference, then there is probably not a problem.

(also char can be signed or unsigned. in gcc you could use something
like -funsigned-char to override the default setting. which can
potentially break a lot of assumptions in your system and library
headers)

> I think process_data() should be declared with
>
> int process_data(unsigned char *buffer, size_t len)
>

you should use:
signed char *  - if you need signed
unsigned char * - if you need unsigned
char * - if you don't care either way. as long as the pointer points
to something char-sized.
void * - if you don't even care about what type it points to. (maybe a struct)

note- this rule is different than signed/unsigned int. int is always signed.

I use char* when dealing with strings, because I won't be using them
in situations where negative values could be a problem. but one
terrible issue you can run into is a simple function like this:

int isupper(char c)
{
const int upper_table[256] = { ... }; /* UCHAR_MAX is more appropriate here. */
return upper_table[c]; /* oops what if c is negative, that would be a
terrible array index. */
/* we would actually want to cast c to unsigned char, or at least
check x >= 0 && x < upper_table_len */
}


> this declaration in seem correct and work for me.
>
> However, now I'm conceptually understand why this works.
>
> Thanks.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
