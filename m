From: Rafael Santos <rafael@thinkfreak.com.br>
Subject: Re: Returning pointer to array of structures
Date: Thu, 01 May 2003 03:03:16 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3VYW3Z71NIB705KJVUEC87GE53ZKFRL.3eb0b8a4@rafaelnote.ns1.lhost.com.br>
References: <16048.28433.119139.292067@cerise.nosuchdomain.co.uk>
Reply-To: rafael@thinkfreak.com.br
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <16048.28433.119139.292067@cerise.nosuchdomain.co.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Glynn Clements <glynn.clements@virgin.net>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>

Excelente explanation.... Totally Agreed
Better than just fixing as I have done.

Great.


4/30/03 9:49:21 PM, Glynn Clements <glynn.clements@virgin.net> wrote:

>
>Martin Buchan wrote:
>
>> > Try the modifications above.
>> >
>> > - menuentry parseSubmenu (xmlDocPtr doc, xmlNodePtr cur, menuentry *me=
Ptr, int i)
>> > + void parseSubmenu (xmlDocPtr doc, xmlNodePtr cur, menuentry *mePtr, =
int i)
>>=20
>> Thanks. Ive done as you suggested and it all works.=20
>>=20
>> As the way i had coded it before where i was returning the structure
>> each time worked, I am assuming this is a better way to code it (seeing =

>> as you guys have suggested it and i know diddly squat :-)
>>=20
>> Why is this so?
>> Is it just because i do not have the extra overhead of
>> passing/returning the structure for each function call or is there
>> something more fundamental?
>
>The main issue is that it's unnecessary in this case. That lead me
>(and probably others) to suspect that you might have misunderstood
>what was happening and/or meant to do something else.
>
>E.g. parseSection() calls parseSubmenu(), passing mePtr as an
>argument. parseSubmenu() stores data in the elements of mePtr, and
>also returns the first element (*mePtr, equivalent to mePtr[0]) as a
>result. parseSection() then stores the result in *mePtr, even though
>the value it's storing is bound to be exactly what's already there.
>
>In general, there are two ways to return values from a function:
>
>1. Return the value as the function's result.
>
>2. Pass in a pointer to where you want the value to be stored, and
>have the function store it there.
>
>Option 2 is normally chosen if you want to return:
>
>a) multiple values,
>b) an array, or
>c) large structures.
>
>Option 1 is normally chosen if you only want to return a single, small
>value (usually a primitive type such as int, float etc).
>
>Case a) is due to C functions only being able return a single value.=20
>Case b) is because arrays are always passed by reference (a pointer to
>the first element of the array). Case c) is for efficiency; returning
>a result typically involves the callee copying it onto the stack, then
>the caller copying it from the stack.
>
>--=20
>Glynn Clements <glynn.clements@virgin.net>
>-
>To unsubscribe from this list: send the line "unsubscribe linux-c-programm=
ing" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
Rafael Costa dos Santos
ThinkFreak Com=E9rcio e Solu=E7=F5es em Hardware e Software
Rio de Janeiro / RJ / Brazil
rafael@thinkfreak.com.br
+ 55 21 9432-9266


-
To unsubscribe from this list: send the line "unsubscribe linux-c-programmi=
ng" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
