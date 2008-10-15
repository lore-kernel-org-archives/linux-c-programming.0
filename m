From: "johnny_xing" <johnny_xing@banshing.com>
Subject: RE: How to call another separate program and passing some variables in C?
Date: Wed, 15 Oct 2008 17:35:14 +0800
Message-ID: <D0CBC9B054604F0AAC837C5D302F0A33@johnny>
References: <DF93814AEDB44B7484B8BF8F416AA50D@johnny> <c15440c50810140412r7df6c411xdf24dd6a16590132@mail.gmail.com> <0E415EA45AC641298E702FBDEDADEA87@johnny> <4f5c2ba10810142334o6dbca046r52eb267c8da28aa9@mail.gmail.com> <5F844C5CE0B949348F25CDBF9B3FA11D@johnny> <4f5c2ba10810150150k153b051fod1440a14037cd16c@mail.gmail.com> <4f5c2ba10810150152s6c6307fi1fde09505b31a8bc@mail.gmail.com> <E1AF7D141DDA48EEA3461954C013405E@johnny> <4f5c2ba10810150227k44321974n4fe51ff28e470e2c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <4f5c2ba10810150227k44321974n4fe51ff28e470e2c@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: 'Halesh S' <halesh.tux@gmail.com>
Cc: korfuri@gmail.com, linux-c-programming@vger.kernel.org

Yes that works for me as well.

Thanks a lot guys.

Thanks & Best Regards,
=20
Johnny Xing
________________________________________
=46rom: Halesh S [mailto:halesh.tux@gmail.com]=20
Sent: 2008=E5=B9=B410=E6=9C=8815=E6=97=A5 17:28
To: johnny_xing
Cc: korfuri@gmail.com; linux-c-programming@vger.kernel.org
Subject: Re: How to call another separate program and passing some vari=
ables in C?

Please check below
argv[0] will have prgram name itself...so its giving 0...
Start from argv[1] :)


Try below, I am able to valid result.

prog1.c
------------
int main()
{
  system("./prog2 1 2 3");
  exit(0);
}

prog2.c
-------------

int main(int argc, char *argv[])
{
  int input1,i;
  for (i=3D1; i<argc; i++) {
- Hide quoted text -

    printf("buffer is %s\n", argv[i]);
    input1 =3Datoi(argv[i]);

   printf("input1 value is %d\n",input1);
 }
}
run prog1, i am able to get proper result.

Thanks,
Halesh
On Wed, Oct 15, 2008 at 2:40 PM, johnny_xing <johnny_xing@banshing.com>=
 wrote:
Hi, Halesh,

Same result as above, I am wondering if system() should be used if we w=
ant to pass some arguments as well.

Thanks & Best Regards,

Johnny Xing

________________________________________
=46rom: Halesh S [mailto:halesh.tux@gmail.com]
Sent: 2008=E5=B9=B410=E6=9C=8815=E6=97=A5 16:52
To: johnny_xing
Cc: korfuri@gmail.com; linux-c-programming@vger.kernel.org
Subject: Re: How to call another separate program and passing some vari=
ables in C?

Try program 2 as below, no need to use sprintf

In program 2:
int main(int argc, char *argv[])
{
int input1;
printf("buffer is %s\n", argv[0]);
input1 =3Datoi(argv[0]);
printf("input1 value is %d\n",input1);
}
Halesh



Try program 2 as below, no need to use sprintf

In program 2:
int main(int argc, char *argv[])
{
int input1;
char buffer[10];
printf("buffer is %s\n", buffer);
input1 =3Datoi(buffer);
printf("input1 value is %d\n",input1);
}
 - Halesh

2008/10/15 johnny_xing <johnny_xing@banshing.com>
2008/10/15 johnny_xing <johnny_xing@banshing.com>
Hi,

I tried as what Hlalesh said and it doesn't work.

Here is what I have:

In program 1:

system("/usr/local/src/program2 1");

In program 2:
int main(int argc, char *argv[])
{
int input1;
char buffer[10];
sprintf(buffer, argv[0]);

printf("buffer is %s\n", buffer);
input1 =3Datoi(buffer);
printf("input1 value is %d\n",input1);
}

The output is:

buffer is /usr/local/src/parallel/asterisk
input1 value is 0


Anything wrong with it?


Thanks & Best Regards,

Johnny Xing

________________________________________
=46rom: Halesh S [mailto:halesh.tux@gmail.com]
Sent: 2008=E5=B9=B410=E6=9C=8815=E6=97=A5 14:34
To: johnny_xing
Cc: korfuri@gmail.com; linux-c-programming@vger.kernel.org

Subject: Re: How to call another separate program and passing some vari=
ables in C?


2008/10/15 johnny_xing <johnny_xing@banshing.com>
Hi, Uriel

Yes I need to execute two separate programs although I know it would be=
 much
easier if I could put into one program.

The reason is the first program invokes lots of other modules and progr=
am
and it has been fixed and running that I don't know how to add in the s=
econd
program.

However, if I could invoke the second program using system() and pass s=
ome
integers to the second program to generate the output I want, it will b=
e
good enough.

Eg: system("/usr/local/src/program2");

The problem is I don't know how to pass some integers upon invoking it.

Is it something like this if I want to pass an integer 1?
system("/usr/local/src/program2" 1);

 Use system("/usr/local/src/program2 1");

 the argument will stored as string in *argv[] in 2nd prog.
 Convert back to integer using sprintf / any of ur own method.

 Halesh



Thanks & Best Regards,

Johnny Xing
-----Original Message-----
=46rom: linux-c-programming-owner@vger.kernel.org
[mailto:linux-c-programming-owner@vger.kernel.org] On Behalf Of
korfuri@gmail.com
Sent: 2008=E5=B9=B410=E6=9C=8814=E6=97=A5 19:12
To: johnny_xing
Cc: linux-c-programming@vger.kernel.org
Subject: Re : How to call another separate program and passing some
variables in C?

2008/10/14, johnny_xing <johnny_xing@banshing.com>:
> Hi,
>
> Forgive me if my question is so simple as I am a newbie to programmin=
g..
>
> I have two C programming and I want to call second C file within my f=
irst
C
> program, upon calling, I need to pass some variables (like 1 or 0) to=
 the
> second program.
>
> Can anyone tell me how to do? I searched system() but it seems not be=
 able
> to do this.
>
> Thanks & Best Regards,
>
> Johnny
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

Hi,

You can use system() if you build the command-line (e.g. with
sprintf()) to pass the arguments you want. Then you can access it in
your 2nd program with argc/argv.

An alternative is to use fork() and execve(). Please note that you
have to convert each argument to a string so execve() can use it. Here
again you can use sprintf() for this purpose.

But are you sure you need two separate programs ? You can build 2 C
files together into one binary. That makes passing variables much
easier as it results to a normal function call.

Hope this will help
Regards,
Uriel

--
Uriel "Korfuri" Corfa
Epitech student
--
To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html





--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
