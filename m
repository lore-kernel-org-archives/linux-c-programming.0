From: Hareesh Nagarajan <hareesh.nagarajan@gmail.com>
Subject: Re: Pattern matching programming
Date: Thu, 19 May 2005 20:55:25 -0500
Message-ID: <7728232c050519185517fc01f9@mail.gmail.com>
References: <33128.200.91.100.219.1116437772.squirrel@www.crearium.com>
	 <200505182009.29868.lain@neotes.org>
Reply-To: Hareesh Nagarajan <hareesh.nagarajan@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200505182009.29868.lain@neotes.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: fabio@crearium.com
Cc: linux-c-programming@vger.kernel.org

On 5/18/05, Fabrizio Sestito <lain@neotes.org> wrote:
> On Wednesday 18 May 2005 17:36, fabio@crearium.com wrote:
> > Hello,
> >
> > I am trying to code a small C program that basically takes a long text
> > file with data that comes from a mysql server.

If you know the exact syntax of the incoming text, you could hand
write a parser. Essentially, you need to know all the states you can
be in.

For e.g.: You cannot encounter a </p> before you a <p>. Etc.

HTH,

Hareesh

PS: But you should use an existing library which Fabrizio mentions,
instead of reinventing the wheel.

> >
> > But I realize It is better to use regular expression. This is an examples
> > of the text:
> >
> > =1 <p> blah </p> <div foo>{$foobar}</div>blah.... <p>linux rulez</p>
> > misc characters.... =2 blah blah <p> linux rulez again</p>....
> > <p>foo</p?blah
> >
> >
> > And so on.
> >
> > The patterns are:
> >
> > The record is represented by an equal. Ej, record 1 is "=1", record 2 is
> > "=2" and so on.
> >
> > The desired text is where "linux rulez" is inside, it is the FIRST <p>
> > </p> AFTER a record.
> >
> > So, I see that program this makes no sense because it is better to use sed
> > and awk.
> >
> > The result I want to have is something like:
> >
> > 1 linux rulez
> > 2 linux rulez again
> > 3 linux rulez so far
> > ...etc
> >
> > The idea is elimate all <div>'s tags, then get the numbers (maybe with awk
> > -F"="), and then get the next <p> taq, remove the tags themself and
> > numbers and then the text and do the same procedure for all the 65230
> > records.
> >
> > Thanks alot for any comment, sorry for the 'offtopic'
> >
> > Kind regards,
> >
> > fabio
> >
> Why don't you use an XML parser library?
> 
> Fabrizio
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
