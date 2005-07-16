From: Eric Bambach <eric@cisu.net>
Subject: Re: Variable to sizeof function.
Date: Sat, 16 Jul 2005 09:30:19 -0500
Message-ID: <200507160930.19077.eric@cisu.net>
References: <20050716064421.85333.qmail@web31901.mail.mud.yahoo.com>
Reply-To: eric@cisu.net
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20050716064421.85333.qmail@web31901.mail.mud.yahoo.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Vikas S <vikas_soolapani@yahoo.com>
Cc: linux-c-programming@vger.kernel.org

Vika,

 Perhaps you can add a sizeof field to your structures and query it?

 struct s{
   int a;
   float b;
   int mysize =3D sizeof(s);
 };

 int function(struct *s){
  return s->mysize;
 }

Pardon my code, its more like psuedocode than anything that will compil=
e, but=20
the idea is there. The problem is if you have pointers to strings in yo=
ur=20
struct, then it won't get the size properly at run-time, but if they're=
 all=20
static elements, it may work.
=20
On Saturday 16 July 2005 01:44 am, Vikas S wrote:
> Thanks, This is a workable solution.
> But the issue is I've some 100+ structures. So, writing
> a if or case is going to be difficult.
>
> a) You are right.
> b) Yes. I want to pass a structure name. ie, make sizeof
> accept a variable.
>
> Is this impossible?
>
> Thanks,
> Vikas
>
> --- Steve Graegert <graegerts@gmail.com> wrote:
> > On 7/15/05, Vikas S <vikas_soolapani@yahoo.com> wrote:
> > > I guess I was not clear. Say, we have two structures.
> > >
> > > str1 {int x, char y} and str2 {int x, char *y};
> >
> > OK...
> >
> > > printf(sizeof(struct str1)); will give proper output. ie memory
> > > occupied by str1.
> >
> > ...reasonable...
> >
> > > What I want is, instead of hard-coding str1 etc., I want to find
> > > the size of structure which I will give as 1st argument. So, if t=
he
> > > program name is size, i'll give:
> > > $ ./size str1 --- to get size of str1
> > > $ ./size str2 --- to get size of str2
> >
> > This makes things even more confusing to me.  So, you want
> >
> >     (a)    query the size of a particular structure among others
> >     (b)    provide a structure as an argument to your program
> >
> > identified by name?  Obviously (b) is something completely impossib=
le,
> > obscure at least.  The solution to (a) is simple:
> >
> >     struct s1 { int i; char *c; } str1;
> >     struct s2 { int i; char c[5]; } str2;
> >
> >     if (argc !=3D 2) return 0;
> >
> >     if (!strcmp(argv[1], "str1"))
> >         printf("sizeof(str1): %d\n", sizeof(str1));
> >     else
> >         printf("sizeof(str2): %d\n", sizeof(str2))
> >
> > $ cc -o test test.c
> >
> > $ ./test str2
> > sizeof(str2): 12
> >
> > > The code which I gave earlier is giving compile-time error messag=
e.
> > >
> > > Thanks,
> > > Vikas
> > >
> > > --- Rechberger Markus <mrechberger@gmail.com> wrote:
> > > > strlen on a null pointer will segfault...
> > > > if arc is 1 then argv[0] will contain a pointer to an array of =
char
> > > > if arc is 2 then argv[1] (the users first argument) will contai=
n an
> > > > array of char..
> > > > so don't forget to check the number of arguments ..
> > > >
> > > > On 7/15/05, Vadiraj <vadiraj.cs@gmail.com> wrote:
> > > > > Vikas,
> > > > >
> > > > > On 7/15/05, Vikas S <vikas_soolapani@yahoo.com> wrote:
> > > > > > I want to find out the size of a structure which the user w=
ill
> > > > > > give as an argument as follows.
> > > > > >
> > > > > > #include <>  -- All includes..
> > > > > > ..
> > > > > > main(int arc, char *argv[])
> > > > >
> > > > >    argv is a charecter pointer . You cannot pass struct * as =
an
> > > > > arguement to main.
> > > > >
> > > > > > {
> > > > > > printf("Size of structure %s is: %d\n", argv[1], sizeof(str=
uct
> > > > > > argv[1]));
> > > > >
> > > > > use strlen(argv[1]) to find the lenght of the string.
> > > > >
> > > > > --
> > > > > cheers,
> > > > > Vadi
> > > > > -
> > > > > To unsubscribe from this list: send the line "unsubscribe
> > > > > linux-c-programming" in the body of a message to
> > > > > majordomo@vger.kernel.org
> > > > > More majordomo info at  http://vger.kernel.org/majordomo-info=
=2Ehtml
> > > >
> > > > -
> > > > To unsubscribe from this list: send the line "unsubscribe
> > > > linux-c-programming" in the body of a message to
> > > > majordomo@vger.kernel.org
> > > > More majordomo info at  http://vger.kernel.org/majordomo-info.h=
tml
> > >
> > > __________________________________
> > > Do you Yahoo!?
> > > Yahoo! Mail - You care about security. So do we.
> > > http://promotions.yahoo.com/new_mail
> > > -
> > > To unsubscribe from this list: send the line "unsubscribe
> > > linux-c-programming" in the body of a message to
> > > majordomo@vger.kernel.org
> > > More majordomo info at  http://vger.kernel.org/majordomo-info.htm=
l
> >
> > --
> >                                  __________________________________=
____
> > Steve Graegert                  //
> > Software Consultancy           //    Whether you know it or not, if=
 you
> > Mobile: +49 (176)  21248869   // are a hacker, you are a revolution=
ary.
> > Office: +49 (9131) 7126409   //  Don't worry, you're on the right s=
ide.
> > ____________________________//         -- Dr Crash / Phrack 6 / phi=
le 3
> > -
> > To unsubscribe from this list: send the line "unsubscribe
> > linux-c-programming" in the body of a message to
> > majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
> __________________________________________________
> Do You Yahoo!?
> Tired of spam?  Yahoo! Mail has the best spam protection around
> http://mail.yahoo.com
> -
> To unsubscribe from this list: send the line "unsubscribe
> linux-c-programming" in the body of a message to majordomo@vger.kerne=
l.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

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
