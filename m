From: Fundu <fundu_1999@yahoo.com>
Subject: Re: strstr and strchr
Date: Tue, 17 Feb 2009 03:52:12 -0800 (PST)
Message-ID: <937267.9085.qm@web63401.mail.re1.yahoo.com>
References: <36ca99e90902170248y5ae1dc8heb5e4873429f3ae@mail.gmail.com>
Reply-To: fundu_1999@yahoo.com
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <36ca99e90902170248y5ae1dc8heb5e4873429f3ae@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bert Wesarg <bert.wesarg@googlemail.com>
Cc: linux-c-programming@vger.kernel.org

Bert,
i did try that but got same response. 


--- On Tue, 2/17/09, Bert Wesarg <bert.wesarg@googlemail.com> wrote:

> From: Bert Wesarg <bert.wesarg@googlemail.com>
> Subject: Re: strstr and strchr
> To: fundu_1999@yahoo.com
> Cc: linux-c-programming@vger.kernel.org
> Date: Tuesday, February 17, 2009, 2:48 AM
> On Tue, Feb 17, 2009 at 09:30, Fundu
> <fundu_1999@yahoo.com> wrote:
> > looks strange to me
> > if i look for a str using strstr it gives me the
> starting index of the string. so let say if i'm looking
> for "firstName" in "<Info
> firstName=\"sam\"
> lastName=\"Smith\" />" using
> > strstr(ptr, "firstName");  i would get the
> pointer pointing to the f in firstName.
> >
> >
> > whereas if i use strchr and using a slight variation
> of the string mentioned above(suing ' instead of ")
>  "<Info firstName='sam'
> lastName='Smith'/>"
> > strchr(ptr, "'") returns a pointer
> pointing after the '
> strchr() takes a int as second argument, not a 'char
> *', I suggest trying:
> 
> strchr(ptr, '\'')
> 
> > so a printf("[%s]\n", strchr(ptr,
> "'"));
> > would print [  lastName='Smith'/>]
> >
> > which doesn't make sense to me.
> >
> > can someone shed some light. TIA !
> --
> To unsubscribe from this list: send the line
> "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at 
> http://vger.kernel.org/majordomo-info.html


      
