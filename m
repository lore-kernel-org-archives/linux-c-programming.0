From: Krishna Mohan <gkmohan@rocsys.com>
Subject: Re: scanf with pointers as arguments
Date: 17 Nov 2004 14:26:04 +0530
Message-ID: <1100681765.1157.18.camel@KrishnaMohan>
References: <1100670616.1157.15.camel@KrishnaMohan> 
	<200411170720.22222.mayday@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200411170720.22222.mayday@gmx.net>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Benjamin Sobotta <mayday@gmx.net>
Cc: Linux c programming list <linux-c-programming@vger.kernel.org>

Hi
thanqs alot benjamin sobotta.
it's working fine. i need to give exact pointer type.
Regards
krishna mohan

On Wed, 2004-11-17 at 11:50, Benjamin Sobotta wrote:
> Hi!
> 
> Will the problem is not the pointer but the type. Since you use short you have 
> to adjust that.
> That works for me:
> 
> #include<stdio.h>
> 
> int main()
> {
>  int i,*iptr = &i;
>         short int s,*shptr = &s;
>         printf("enter 2 values:\n");
>         scanf("%d %hd",iptr,shptr);
>         printf("%d %hd\n",*iptr,*shptr);
>         printf("%d %hd\n",i,s);
> 
>  return 0;
> }
> 
> 
> 
> On Wednesday 17 November 2004 06:50, Krishna Mohan wrote:
> > Hi
> > Can anybody plz tell me what's wrong with this code!
> > I am getting SEGMENTATION FAULT. ofcourse, if i use &i, &s as arguments
> > in scanf, it's work fine as usual. can't i use pointers which hold the
> > address of i and s. plz clarify this. THANKS IN ADVANCE.
> >
> >  int i,*iptr = &i;
> >         short s,*shptr = &s;
> >         printf("enter 2 values:\n");
> >         scanf("%d %d",iptr,shptr);
> >         printf("%d %d\n",*iptr,*shptr);
> >  printf("%d %d\n",i,s);
> >
> >
> >
> > -
> > To unsubscribe from this list: send the line "unsubscribe
> > linux-c-programming" in the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html


