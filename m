From: Vadiraj <vadiraj.cs@gmail.com>
Subject: Re: Variable to sizeof function.
Date: Sun, 17 Jul 2005 21:57:33 +0530
Message-ID: <6eee1c405071709277b5568dd@mail.gmail.com>
References: <6a00c8d505071515355f041394@mail.gmail.com>
	 <20050716064421.85333.qmail@web31901.mail.mud.yahoo.com>
Reply-To: Vadiraj <vadiraj.cs@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20050716064421.85333.qmail@web31901.mail.mud.yahoo.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vikas S <vikas_soolapani@yahoo.com>
Cc: Steve Graegert <graegerts@gmail.com>, Rechberger Markus <mrechberger@gmail.com>, linux-c-programming@vger.kernel.org

On 7/16/05, Vikas S <vikas_soolapani@yahoo.com> wrote:
> 
> Thanks, This is a workable solution.
> But the issue is I've some 100+ structures. So, writing
> a if or case is going to be difficult.

 Another way I can suggest would be passing the file name at command prompt.
./size foo.txt

 foo.txt should contain 100+ structure names.

read the file contents and follow steve's suggestion.


  




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
> 
> > On 7/15/05, Vikas S <vikas_soolapani@yahoo.com> wrote:
> > >
> > > I guess I was not clear. Say, we have two structures.
> > >
> > > str1 {int x, char y} and str2 {int x, char *y};
> >
> > OK...
> >
> > > printf(sizeof(struct str1)); will give proper output. ie memory occupied
> > > by str1.
> >
> > ...reasonable...
> >
> > > What I want is, instead of hard-coding str1 etc., I want to find
> > > the size of structure which I will give as 1st argument. So, if the
> > > program name is size, i'll give:
> > > $ ./size str1 --- to get size of str1
> > > $ ./size str2 --- to get size of str2
> >
> > This makes things even more confusing to me.  So, you want
> >
> >     (a)    query the size of a particular structure among others
> >     (b)    provide a structure as an argument to your program
> >
> > identified by name?  Obviously (b) is something completely impossible,
> > obscure at least.  The solution to (a) is simple:
> >
> >     struct s1 { int i; char *c; } str1;
> >     struct s2 { int i; char c[5]; } str2;
> >
> >     if (argc != 2) return 0;
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
> >
> > > The code which I gave earlier is giving compile-time error message.
> > >
> > > Thanks,
> > > Vikas
> > > --- Rechberger Markus <mrechberger@gmail.com> wrote:
> > >
> > > > strlen on a null pointer will segfault...
> > > > if arc is 1 then argv[0] will contain a pointer to an array of char
> > > > if arc is 2 then argv[1] (the users first argument) will contain an
> > > > array of char..
> > > > so don't forget to check the number of arguments ..
> > > >
> > > > On 7/15/05, Vadiraj <vadiraj.cs@gmail.com> wrote:
> > > > > Vikas,
> > > > >
> > > > > On 7/15/05, Vikas S <vikas_soolapani@yahoo.com> wrote:
> > > > > > I want to find out the size of a structure which the user will give as an argument
> > > > > > as follows.
> > > > > >
> > > > > > #include <>  -- All includes..
> > > > > > ..
> > > > > > main(int arc, char *argv[])
> > > > >
> > > > >    argv is a charecter pointer . You cannot pass struct * as an
> > > > > arguement to main.
> > > > >
> > > > > > {
> > > > > > printf("Size of structure %s is: %d\n", argv[1], sizeof(struct argv[1]));
> > > > >
> > > > > use strlen(argv[1]) to find the lenght of the string.
> > > > >
> > > > > --
> > > > > cheers,
> > > > > Vadi
> > > > > -
> > > > > To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> > > > > the body of a message to majordomo@vger.kernel.org
> > > > > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> > > > >
> > > > -
> > > > To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> > > > the body of a message to majordomo@vger.kernel.org
> > > > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> > > >
> > >
> > >
> > >
> > >
> > >
> > > __________________________________
> > > Do you Yahoo!?
> > > Yahoo! Mail - You care about security. So do we.
> > > http://promotions.yahoo.com/new_mail
> > > -
> > > To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> > > the body of a message to majordomo@vger.kernel.org
> > > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> > >
> >
> >
> > --
> >                                  ______________________________________
> > Steve Graegert                  //
> > Software Consultancy           //    Whether you know it or not, if you
> > Mobile: +49 (176)  21248869   // are a hacker, you are a revolutionary.
> > Office: +49 (9131) 7126409   //  Don't worry, you're on the right side.
> > ____________________________//         -- Dr Crash / Phrack 6 / phile 3
> > -
> > To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >
> 
> 
> __________________________________________________
> Do You Yahoo!?
> Tired of spam?  Yahoo! Mail has the best spam protection around
> http://mail.yahoo.com
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 


-- 
cheers,
Vadi
