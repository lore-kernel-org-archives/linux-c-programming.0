From: Edward Parrilla <eparrilla@comcast.net>
Subject: Re: passing host name from a structure.
Date: 07 Oct 2004 01:23:33 -0500
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1097130210.4086.825.camel@localhost.localdomain>
References: <20041006104403.96723.qmail@web52903.mail.yahoo.com>
	 <1097099245.4086.421.camel@localhost.localdomain>
	 <6.1.1.1.0.20041006171515.04d4c6b8@no.incoming.mail>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <6.1.1.1.0.20041006171515.04d4c6b8@no.incoming.mail>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux prg <linux-c-programming@vger.kernel.org>

Thanks, 
you were right, it was my mistake I was putting "fprintff" instead of
"fprintf"
On Thu, 2004-10-07 at 00:03, Jeff Woods wrote:
> At 10/6/2004 04:47 PM -0500, Edward Parrilla wrote:
> >#define bcopy(a,b,c) strncpy(b,a,c)
> >
> >    struct sockaddr_in  sa;  /* socket addr. structure           */
> >    struct hostent * hp;     /* host entry                       */
> >    char *hostname;
> >
> >hostname=argv[3];
> >
> >hp=gethostbyname(hostname);  <-- get this error " warning: assignment 
> >makes pointer from integer without a cast"
> 
> This error looks really peculiar.  IIUC, it's complaining that 
> gethostbyname() returns an int (or other ordinal value) which must be 
> converted to a pointer for assignment to "hp".  However, on my system "man 
> gethostbyname" says "struct hostent *gethostbyname(const char *name);" 
> which says it should be returning a pointer (even one of the same type as 
> you declared "hp").  Have you declared a prototype for gethostbyname()?  If 
> not, then the compiler assumes the function returns an int.  The same man 
> page indicates you should include this line in your source:  "#include 
> <netdb.h>".  Just to be sure, check "man gethostbyname" on your system and 
> see what include files it recommends and what type gethostbyname() 
> returns.  If you've confirmed that's not the problem, then you might dig 
> into the include file(s), find the prototype being used for gethostbyname() 
> and see that it's correct; but that's very unlikely to be the 
> problem.  (Someone else would have seen it a long time ago.)
> 
> >bcopy((char *)hp->h_addr, (char *)&sa.sin_addr, hp->h_length);  <-- 
> >getting  dereferencing pointer to incomplete type
> 
> The problem is the precedence of "(char *)hp->h_addr".  The cast "()" and 
> indirection "->" operators have equal precedence level and so left-to-right 
> order determines precedence, which means you told the compile to access the 
> h_addr struct field of what you just told it is a char.  I think you mean 
> "(char *)(hp->h_addr)".  Note also that some groups of operators at the 
> same precedence level operate left to right [e.g., arithmetic: (a + b - c)] 
> and others operate right to left [e.g., assignments: (a *= b +=2)].
> 
> --
> Jeff Woods <kazrak+kernel@cesmail.net> 
> 
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

