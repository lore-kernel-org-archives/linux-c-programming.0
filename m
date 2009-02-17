From: Fundu <fundu_1999@yahoo.com>
Subject: Re: strtok, bus error
Date: Mon, 16 Feb 2009 22:31:57 -0800 (PST)
Message-ID: <167627.59267.qm@web63403.mail.re1.yahoo.com>
References: <444391460902161957h1f8cf10cl25cd8c57df55d33d@mail.gmail.com>
Reply-To: fundu_1999@yahoo.com
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <444391460902161957h1f8cf10cl25cd8c57df55d33d@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bryan Christ <bryan.christ@gmail.com>
Cc: linux-c-programming@vger.kernel.org

Thanks Bryan and Ben. 
it makes sense now.


--- On Mon, 2/16/09, Bryan Christ <bryan.christ@gmail.com> wrote:

> From: Bryan Christ <bryan.christ@gmail.com>
> Subject: Re: strtok, bus error
> To: fundu_1999@yahoo.com
> Cc: linux-c-programming@vger.kernel.org
> Date: Monday, February 16, 2009, 7:57 PM
> char src[]  = "hello world #"; is an automatic
> variable (char array)
> which is both read and write.
> char *other = "hello world #"; is a char * (which
> points to a string)
> of text allocated in the program's text (Data/BSS) area
> which is read
> only.
> 
> On Mon, Feb 16, 2009 at 8:52 PM, Fundu
> <fundu_1999@yahoo.com> wrote:
> > i'm trying to do pretty simple replacement using
> strtok.
> > but it looks like i have missed some subtle difference
> between the two following
> >
> >  char src[]  = "hello world #";
> >  char *other = "hello world #";
> >
> > because if i use "char * other" with strtok
> it fails with bus error but i use src it works, don't
> understand what's the difference.
> >
> > here's the code for strtok.
> >     char delims[] = "#";
> >     char *result = NULL;
> >     // this works
> >     result = strtok( src, delims );
> >     // this doesnot work and give a bus error
> >     // result = strtok(other, delims);
> >     while( result != NULL ) {
> >         printf( "result is
> \"%s\"\n", result );
> >         result = strtok( NULL, delims );
> >     }
> >
> > what am i missing here ? i thought both way of
> declaration(mentioned above ) were the same apparently the r
> not, whats the diff ?
> >
> > any insight would be appreciated, TIA!
> >
> >
> >
> > --
> > To unsubscribe from this list: send the line
> "unsubscribe linux-c-programming" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at 
> http://vger.kernel.org/majordomo-info.html
> >
> 
> 
> 
> -- 
> Bryan
> <><
> --
> To unsubscribe from this list: send the line
> "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at 
> http://vger.kernel.org/majordomo-info.html


      
