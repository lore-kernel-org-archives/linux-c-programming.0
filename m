From: Fabrizio Sestito <lain@neotes.org>
Subject: Re: Pattern matching programming
Date: Wed, 18 May 2005 20:09:29 +0000
Message-ID: <200505182009.29868.lain@neotes.org>
References: <33128.200.91.100.219.1116437772.squirrel@www.crearium.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <33128.200.91.100.219.1116437772.squirrel@www.crearium.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

On Wednesday 18 May 2005 17:36, fabio@crearium.com wrote:
> Hello,
>
> I am trying to code a small C program that basically takes a long text
> file with data that comes from a mysql server.
>
> But I realize It is better to use regular expression. This is an examples
> of the text:
>
> =1 <p> blah </p> <div foo>{$foobar}</div>blah.... <p>linux rulez</p>
> misc characters.... =2 blah blah <p> linux rulez again</p>....
> <p>foo</p?blah
>
>
> And so on.
>
> The patterns are:
>
> The record is represented by an equal. Ej, record 1 is "=1", record 2 is
> "=2" and so on.
>
> The desired text is where "linux rulez" is inside, it is the FIRST <p>
> </p> AFTER a record.
>
> So, I see that program this makes no sense because it is better to use sed
> and awk.
>
> The result I want to have is something like:
>
> 1 linux rulez
> 2 linux rulez again
> 3 linux rulez so far
> ...etc
>
> The idea is elimate all <div>'s tags, then get the numbers (maybe with awk
> -F"="), and then get the next <p> taq, remove the tags themself and
> numbers and then the text and do the same procedure for all the 65230
> records.
>
> Thanks alot for any comment, sorry for the 'offtopic'
>
> Kind regards,
>
> fabio
>
Why don't you use an XML parser library?

Fabrizio
