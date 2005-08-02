From: Steve Graegert <graegerts@gmail.com>
Subject: Re: Any pointer to Byte Alignment & Structure Padding?
Date: Tue, 2 Aug 2005 13:32:55 +0200
Message-ID: <6a00c8d5050802043274528ec6@mail.gmail.com>
References: <014001c5968e$4e30ca70$9900a8c0@ispl091>
	 <6eee1c40508010514517b5b90@mail.gmail.com>
	 <015a01c59694$80662070$9900a8c0@ispl091>
	 <20050801161125.716db5ff@localhost.localdomain>
	 <003b01c59715$d3ffef00$9900a8c0@ispl091>
	 <6a00c8d5050801234267dd0f7f@mail.gmail.com>
	 <01dd01c5972f$5c3b62a0$9900a8c0@ispl091>
	 <17135.20687.821822.269575@cerise.gclements.plus.com>
	 <02c401c59745$2aaa0410$9900a8c0@ispl091>
Reply-To: Steve Graegert <graegerts@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <02c401c59745$2aaa0410$9900a8c0@ispl091>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Amit Dang <amit_dang@intersolutions.stpn.soft.net>
Cc: linux-c-programming@vger.kernel.org

On 8/2/05, Amit Dang <amit_dang@intersolutions.stpn.soft.net> wrote:
> Hi Glynn,
>    You are very right in saying that "there is no need for structures to
> have same layout on different platform" until structures are being written
> directly to the file system. But many time there is a requirement that the
> data file can be moved across platforms.

Reading and writing binary files in a portable way is not possible as
is.  Unless it is absolutely necessary to read/write binary data you
should always prefer a portable solution like XML and its derivatives.

An easy way to improve portability of binary files is to prepend a
header that contains enough information to discover byte ordering,
floating-point format, etc.  That makes it easy enough to write simple
tools that are able to read/write binary data.

All other techniques used for binary data are quite complex and rely
on other (quasi-)standards like XDR (invented by Sun and used for NFS
and RPC), CCITT X.409 or ASN.1.  They can be seen as a meta-languages
that specify the data representation for particular file formats.
 
> ----- Original Message -----
> From: "Glynn Clements" <glynn@gclements.plus.com>
> To: "Amit Dang" <amit_dang@intersolutions.stpn.soft.net>
> Cc: <linux-c-programming@vger.kernel.org>
> Sent: Tuesday, August 02, 2005 4:24 PM
> Subject: Re: Any pointer to Byte Alignment & Structure Padding?
> 
> 
> >
> > Amit Dang wrote:
> >
> > > Thanks Steve. So what is the best way of laying down a structure
> definition
> > > to over come cross platform issues?
> > > I read about introducing some explicit padding in the structure to take
> care
> > > for cross platform issues but for that I suppose one should have
> information
> > > about byte alignment & structure padding on all targeted platforms. Is
> that
> > > true or there is some generic way of doing that? (Apart from using
> compiler
> > > option to remove any padding )
> >
> > Structure layout has nothing to do with portability. There's no reason
> > why a structure needs to have the same layout on different platforms.
> > In most situations, you don't need to know anything about how the
> > structure is laid out; you just reference the fields.
> >
> > --
> > Glynn Clements <glynn@gclements.plus.com>
> > -
> > To unsubscribe from this list: send the line "unsubscribe
> linux-c-programming" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 


-- 
                                 ______________________________________
Steve Graegert                  //
Software Consultancy           //    Whether you know it or not, if you
Mobile: +49 (176)  21248869   // are a hacker, you are a revolutionary.   
Office: +49 (9131) 7126409   //  Don't worry, you're on the right side.
____________________________//         -- Dr Crash / Phrack 6 / phile 3
