From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: strange message received after posting to here
Date: Tue, 16 Oct 2007 19:56:09 +0100
Message-ID: <18197.2377.777481.565497@cerise.gclements.plus.com>
References: <20071015200548.a26892be.dh@triple-media.com>
	<18196.39844.92376.495601@cerise.gclements.plus.com>
	<20071016193456.a11cc0c1.dh@triple-media.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20071016193456.a11cc0c1.dh@triple-media.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dennis Heuer <dh@triple-media.com>
Cc: linux-c-programming@vger.kernel.org


Dennis Heuer wrote:

> > One of the subscribed accounts is on a broken mail server which sends
> > bounce messages back to the "author" (i.e. the person posting the
> > message) rather than to the envelope sender (the listserv address,
> > linux-c-programming-owner@vger.kernel.org).
> > 
> > On a popular list (e.g. bugtraq), you can easily get a dozen or more
> > bogus replies for each post (more if you post during common vacation
> > times, due to broken auto-responders).
> 
> possbly there's more to this. i get all responding messages to the list
> (and only the messages responding to my messages) twice, one time from
> the 'author' and another time from the listserv. possibly your listserv
> is strangely configured and remarking the original author's address in
> the reply-to list so that responding messages are sent to both listserv
> and the original author.

The vger listserv doesn't modify headers. It adds the Return-Path and
Sender headers, but From, To, Reply-To (if it exists) etc are all left
untouched.

You get two copies because I reply using "follow-up", i.e. reply to
sender and all recipients. So one copy goes to the sender (author),
and one goes to each recipient, which will include the list address. 
So you get one copy directly from me and one via the listserv.

Some lists add a Reply-To header which prevents any replies from going
directly to the author (Reply-To supersedes From when determining
where to send replies).

This behaviour is generally frowned upon by people who are familiar
with email (including the vger adminstrators). Partly because it can
result in messages which were meant to be private being posted to a
public mailing list, and partly because the Reply-To header "belongs"
to the author. If the author doesn't want private replies, they can
add the Reply-To header themselves.

Modifying (or adding) the Reply-To header is normally only implemented
on lists where many of the users have relatively poor computer
literacy and have trouble figuring out how to reply to the list rather
than just to the author.

-- 
Glynn Clements <glynn@gclements.plus.com>
