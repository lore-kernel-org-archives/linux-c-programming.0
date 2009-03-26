From: Mingliang <longapple@gmail.com>
Subject: Re: pass a local variable to a function
Date: Thu, 26 Mar 2009 05:09:16 -0800
Message-ID: <56b13acf0903260609o181193a2o7c26f6ae550495b7@mail.gmail.com>
References: <56b13acf0903250921w1934942bma7280055c97a9db3@mail.gmail.com>
	 <gqdovn$pku$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=uH2q+C/T29OeY7r8sam4tAhvvaPoMqlTleZOJTko0ig=;
        b=GTRnTvZZs6wdphnHhTmxxVs9g3poYjtdnp5vGzY9cnjVcOfWC2UkVuuifumnFSVgYF
         qALscvdh7vmIwdndTtCFfP/HzFR4QwtALBQ6NDJBqjT+m09u2F2kSqwI4YJhEu4HtGP5
         5gQVskd1U+GNkwMf48vvzMXypX3fhhqjOwzL8=
In-Reply-To: <gqdovn$pku$1@ger.gmane.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Lorenzo Beretta <lory.fulgi@infinito.it>
Cc: linux-c-programming@vger.kernel.org

Wow!!! learned a lot!!!. Thanks!!!
-Mingliang

On Wed, Mar 25, 2009 at 9:17 AM, Lorenzo Beretta <lory.fulgi@infinito.i=
t> wrote:
> =E6=98=8E=E4=BA=AE ha scritto:
>>
>> Hi guys,
>>
>> This is my first email in this list, any help is much appreciated.
>> As I know, it's not allowed to pass a local variable to a function,
>> because the stack where local variable resides will be reused by oth=
er
>> functions.
>> eg:
>> =C2=A0 =C2=A0 1 =C2=A0#include <stdio.h>
>> =C2=A0 =C2=A0 2
>> =C2=A0 =C2=A0 3 =C2=A0char *fetch();
>> =C2=A0 =C2=A0 4
>> =C2=A0 =C2=A0 5 =C2=A0int main(int argc, char *argv[]){
>> =C2=A0 =C2=A0 6 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *string;
>> =C2=A0 =C2=A0 7 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0string =3D fetch()=
;
>> =C2=A0 =C2=A0 8 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf("%s\n", str=
ing);
>> =C2=A0 =C2=A0 9 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(0);
>> =C2=A0 =C2=A010 =C2=A0}
>> =C2=A0 =C2=A011
>> =C2=A0 =C2=A012 =C2=A0char *fetch(){
>> =C2=A0 =C2=A013 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char string[10];
>> =C2=A0 =C2=A014 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0scanf("%s", string=
);
>> =C2=A0 =C2=A015 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return string;
>> =C2=A0 =C2=A016 =C2=A0}
>>
>> When the application is executed, after input "a", it will produce
>> unknown characters, like "8=C5=A0=C3=A8=C2=BF=C3=B4=C3=BFO". Which i=
s like what I expect
>>
>> However, if I change line 13 to:
>> =C2=A0 =C2=A013 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char string[1024]=
;
>>
>> When I type "a", it echos "a", which is out of my expectation
>>
>> Why does it behave like this?
>>
>> Thanks in advance,
>> longapple
>> --
>> To unsubscribe from this list: send the line "unsubscribe
>> linux-c-programming" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.h=
tml
>>
>
> Try something like this
> ------
> void p(int n){
> =C2=A0 =C2=A0 =C2=A0 =C2=A0int onstack;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0printf("%p\n", &onstack);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if(n>0) p(n-1);
> }
>
> int main(){
> =C2=A0 =C2=A0 =C2=A0 =C2=A0p(5);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
> }
> ------
>
> It should (system dependant) print a sequence of decreasing hex numbe=
rs;
> that's because each time you call a function on your computer, the lo=
cal
> stack grows downwards.
>
> When you scanf() into a character array, it writes into the first cha=
racters
> of your array, that is string[0], then string[1], and so on: notice t=
hat the
> address of string[1] is GREATER than the address of string[0]...
>
> Summing up there are two cases (assume that X stands for "any value")=
:
>
> 1) string[10]
> =3D=3D> { X, X, X, X, X, X, X, X, '\0', 'a' }
> 2) string[1024]
> =3D=3D> { X, X, X, (long sequence of garbage)..., '\0', a' }
>
> When you call printf(), the printf function overwrites some bytes for=
 its
> own stack variables: if it takes more than 10 bytes (eg 42), the smal=
l array
> will be completely overwritten, while with the big array it will only
> overwrite string[1023...980] (which was garbage anyway!), leaving
> string[0...979] intact.
>
> I hope that was helpful; try gooling "buffer overflow" for more info
>
>
> lb
>
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.ht=
ml
>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
