From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: strange behavious
Date: Wed, 25 Dec 2002 13:58:19 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15881.47483.321140.757425@cerise.nosuchdomain.co.uk>
References: <5.2.0.9.0.20021224020627.01e09340@fluent2.pyramid.net>
	<Pine.LNX.4.33.0212251757430.11856-100000@soochak.ncst.ernet.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.33.0212251757430.11856-100000@soochak.ncst.ernet.in>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mohammed Khalid Ansari <khalid@ncst.ernet.in>
Cc: Stephen Satchell <list@fluent2.pyramid.net>, linux c programming mailing list <linux-c-programming@vger.kernel.org>


Mohammed Khalid Ansari wrote:

> > > > > #include <stdio.h>
> > > > >
> > > > > void parse (char **);
> > > > > char        *words[] = {"mohammed", "khalid", "ansari"};
> > > >
> > > > While the array of pointers will be mutable, the strings themselves
> > > > aren't; if you attempt to modify them, you will get a segmentation
> > > > fault.
> > > >
> > >
> > > Is this in ANSI C?  Will you please elaborate why is it so with this array
> > > only and how it is different from the example you have given below because
> > > ultimately both examples are same ie array of pointers.
> > > 
> > > As far as I know if there is an string in a code with sufficient memory,
> > > it can be overwritten unless it is static.
> > 
> > Look at the type for string constants.  It is "const array of char".  

Actually, no; for backwards compatibility with K&R, string literals
are treated as "char []" rather than "const char []".

If they were implicitly qualified with "const", you would get a
warning when you try to modify them or pass them to functions which
might try to modify them.

> I haven't defined them to be const, please see above.

Stephen never suggested that you had defined them as "const"; he was
saying that they are "const" automatically (which isn't technically
the case; declaring something as "const" and storing it in a read-only
segment are two different things).

-- 
Glynn Clements <glynn.clements@virgin.net>
