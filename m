From: Saurabh Sehgal <saurabh.r.s@gmail.com>
Subject: Re: memory address represented as a string
Date: Sun, 26 Jul 2009 04:26:04 -0400
Message-ID: <2a46ebd60907260126q5ba0f7fdr48c6af8728737f3@mail.gmail.com>
References: <2a46ebd60907260039g290268b7i3183ee785994b86@mail.gmail.com>
	 <b21328ed0907260114w547eb3fax61927111cdcf9d3c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=S7G065dUN+j4MXuTdxr727cExmaQpY6Apfe9mW1KeQk=;
        b=eCYmB6a+q35m07j+KskBsvy0wGXqjgp3eSYH1t1aCKzmZx6D5GwMVTzJO0ymGzAEeN
         rqsvUBr/woMHu68pS1CF72houip2JJauoCnjJbB86cNt5NEjEy++acthChnEqjAS1/Ie
         jiQxGo9eL1p4Knamx+fXt8k56wL0LxU8Mjlg0=
In-Reply-To: <b21328ed0907260114w547eb3fax61927111cdcf9d3c@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Eric Polino <aluink@gmail.com>
Cc: linux-c-programming@vger.kernel.org

Hi all,

Thanks for the reply !

I was able to write this function successfully.

This would lead me to my next question.

Is there anyway to test if a memory address is valid or not without cau=
sing a
segmentation fault and catching this maybe in a signal handler ?

Is there a safe way in the same function " void * foo (char * addr)"
to check that
if the address contained in the string represented by "char * addr"  is=
 valid
before returning it.

Thank you !

Saurabh

On Sun, Jul 26, 2009 at 4:14 AM, Eric Polino<aluink@gmail.com> wrote:
> sure, you can just write a function that declares a void * and uses i=
t as a
> regular numeric type such as int or whatnot and parses the string
> representation as a numeric value into that variable.=A0 You can do s=
tuff the
> same as you would with any other integer type, "x +=3D 10; x -=3D 18;=
".=A0 So the
> function would look something like
>
> void *foo(const char *addr){
> =A0 void *parsed_value =3D 0;
> =A0 ....
> =A0 /* Parse addr into parsed_value */
> =A0 ....
> =A0 /* parsed_value =3D=3D value_described_by(addr) */
>
> =A0 return parsed_value;
> }
>
> Parsing addr into parsed_value is left as an exercise to the reader ;=
)
>
> "None are more hopelessly enslaved than those who falsely believe the=
y are
> free."
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0--Goethe
>
> "Freedom is living without government coercion."
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 --Ron Paul (www.ronpaul2008.com)
>
>
> On Sun, Jul 26, 2009 at 03:39, Saurabh Sehgal <saurabh.r.s@gmail.com>=
 wrote:
>>
>> Hi all,
>>
>> I had a quick question:
>>
>> Let's say I design a function with the signature:
>>
>> void * foo( char * addr ) ; ,
>>
>> where addr is a string that represents a valid memory address =A0...
>> so the way someone can call this function is ...
>>
>> char * addr =3D "0xae456778" // assume this is a valid memory addres=
s on
>> the machine
>> foo( addr ) ;
>>
>> Is it possible to take this address in string form, and assign it to
>> an actual pointer of void * type ?
>> I want the function "foo" to return a pointer pointing to the memory
>> location as indicated
>> by the string passed in.
>>
>> Thank you !
>>
>> Saurabh
>> --
>> To unsubscribe from this list: send the line "unsubscribe
>> linux-c-programming" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
>



--=20
Saurabh Sehgal
E-mail:     saurabh.r.s@gmail.com
Phone:     647-831-5621
LinkedIn: http://www.linkedin.com/pub/1/7a3/436
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
