From: Eric Bambach <eric@cisu.net>
Subject: Re: comparing char to other known char's
Date: Thu, 23 Jun 2005 22:34:55 -0500
Message-ID: <200506232234.55312.eric@cisu.net>
References: <42B9F2C7.2030205@colannino.org> <200506231757.58518.eric@cisu.net> <42BB52E4.5090504@colannino.org>
Reply-To: eric@cisu.net
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <42BB52E4.5090504@colannino.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: James Colannino <james@colannino.org>
Cc: linux-c-programming@vger.kernel.org

On Thursday 23 June 2005 07:25 pm, James Colannino wrote:
> Eric Bambach wrote:
> > Generally speaking (in terms of input validation), its better pract=
ice to
> > check against a LEGAL set of characters rather than an illegal set.=
 That
> > way you can get all the characters you need, but everything else is
> > blocked. If you block illegal ones you're bound to miss a few or ev=
en
> > ones from extended charsets and input methods that you might not ha=
ve
> > thought of that could wreck havoc in your program.
>
> Here's what I've whipped up based on your suggestion that I should lo=
ok
> for legal characters instead of the other way around:
>
> <CODE>
>
> /* This function returns 1 if the character being checked is legal an=
d 0
> if it isn't. */
>
> int legal_characters(char character_to_check) {
>
>  int index;
>  legal_characters[] =3D
> "abcdefghijklmnopqrstuvwxyzAVCDEFGHIJKLMNOPQRSTUVWXYZ1234567890_-";
>
>  int number_of_legal_chars =3D sizeof(legal_characters) / sizeof(char=
);
>
>  for (index =3D 0; index < number_of_legal_chars; ++index) {
>   if (character_to_check =3D=3D legal_characters[index])
>    return 1;
>  }
>
>  return 0;
>
> </CODE>
>
> How does this function look?

A solution at best. Inneficient at worst. I suppose if you are only com=
paring=20
a few characters it will get you by or if you dont need them processed =
fast.=20
The problem is that for each character you want to validate you have a=20
minimum of 1 and a maximum of 65ish loop iterations. That could easily =
add up=20
on a long string. Even a sentence with 30 characters is a minimum of 30=
=20
itterations, max of 1800 with the average probably being a few to sever=
al=20
hundred.

It does do the job nicely though of returning true if the character is =
legal=20
and you did implement my second suggestion well. Try my code below (not=
=20
tested, might not compile but the general idea is there. Its C++ code b=
ecause=20
of the bool type and the comments, but it could easily be C99 with a li=
ttle=20
editing). See how the whole function collapses to a single line after i=
t is=20
first run? You pay for it with a little extra memory but if you need to=
 throw=20
hundreds or more characters at the function it will do it fast-It will =
be=20
super-fast no matter how many characters you throw at it. Each charater=
 is=20
analyzed by a quick memory jump. The computer only has to execute a few=
=20
instructions per character you pump into the function as opposed to ten=
s to=20
hundreds of instructions in your function(compare, jump, add, compare, =
jump,=20
add). There is still a jump at entry to my function each time though be=
cause =20
I did the lazy initialization. If you want to optimize further hand cod=
e the=20
table as static and you will see extra performance.=20

Perhaps someone can tell me if the compiler is smart enough to optimize=
 out my=20
static initialization of the array and collapse it into a single static=
=20
initialization without all the code. I would be very interested in know=
ing=20
that.

e.g. table[256] =3D { 0,0,1,1,0... };

But maybe im being too pedantic ....your function DOES do the job ;)
I just dont know how you plan to use it.


HTH!

bool legal(unsigned char *character) {

 // legal_characters[] =3D
 //"abcdefghijklmnopqrstuvwxyzAVCDEFGHIJKLMNOPQRSTUVWXYZ1234567890_-";
 static unsigned char table[256];
 static bool initialized =3D false;
 if ( !initialized){
 //Set up the whole table as false
 memcpy(table,0,sizeof(table)); //did i get the memcpy args right? Its =
been  a=20
few months since ive done C/c++
 //Set up 0-9 as true
 for(int j =3D 48; j <=3D58;j++){
  table[j] =3D 1;
 }
 //A-Z is true
  for(int j =3D 65; j <=3D90;j++){
    table[j] =3D 1;
  }=20
 //a-z is true
   for(int j =3D 97; j <=3D122;j++){
      table[j] =3D 1;
   }=20
        //The stragglers
 table[95] =3D 1;
 table[45] =3D 1;
        initialized =3D true;
  }
  return table[*charater];
}

> James

--=20
----------------------------------------
--EB

> All is fine except that I can reliably "oops" it simply by trying to =
read
> from /proc/apm (e.g. cat /proc/apm).
> oops output and ksymoops-2.3.4 output is attached.
> Is there anything else I can contribute?

The latitude and longtitude of the bios writers current position, and
a ballistic missile.

=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0--Alan Cox LKML-Decembe=
r 08,2000=20

----------------------------------------
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
