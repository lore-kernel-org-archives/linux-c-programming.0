From: xlp <xlp@emtel.net.co>
Subject: [jason@txt.com: Re: Problem with "chars"]
Date: Wed, 17 Jul 2002 09:33:16 -0500
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020717093316.A56041@nietzsche.metrotel.net.co>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

This is Jason Winters reply, It was very usefull and My question was solved, I need to handle "strings" in my case.

thanks.

----- Forwarded message from "Jason P. Winters" <jason@txt.com> -----

From: "Jason P. Winters" <jason@txt.com>
Subject: Re: Problem with "chars"
To: xlp@emtel.net.co (xlp)
Date: Wed, 17 Jul 2002 06:45:46 -0700 (PDT)

 
> Hi C people, first of all, I'd like to thank you this mailing
> list and kernel.org project to give us a place where C programmers
> feel free to ask their questions and the support is excellent.
> I dont understand what's the way I should handle 'chars' on C. 
> I need to code a C function that returns a char, I want to do this:
> char foo();
> main(){
> 	char bar*;
> 	bar=foo();
> }

Hmmm.. Well, first, do you wish to return a single char, or a random
length of chars?  Your program kinda mixes the two, and you mention
below that you want to return a 'char', and then also mention you
want to return without a specific length.

These are two different return types.

char foo();

This returns a *single* char, always.  Just one. So your code could
have looked something like this:

main()
{
	char bar;
	bar = foo();
}

char foo
{
	char retbar;
	retbar = 'C';
	return(retbar);
}


Now, if you wish to return a random number of chars, it's called
an array.  And you'll need to return a pointer instead of a char.
So your main program could have looked like this:

char *foo();

main()
{
	char *bar;
	bar = foo();
}

Now we come to the tricky part... how to get a real string out of
foo().  You can't just do this:

char *foo()
{
	char retbar[20];
	strcpy(retbar, "Hi there!");
	return(retbar);
}

Because retbar isn't valid once you return. Local variables like that
are always created on the stack, once you return, the stack is
essentially invalidated (I mean here that it's available for reuse)
and it may or may not work, depending on when you use it again and
for what.  Bad move, that.  Causes nasty crashes when you least
expect it.

So, how do you do it?  You have to use malloc() and friends.
Your foo() routine could look something like this:

char *foo()
{
	char *retbar;
	retbar = (char *)malloc(20);
	strcpy(retbar, "Hi There!");
	return(retbar);
}

Malloc allocates a nice new set of memory on the heap, and you are
now returning the pointer to it.

NOTE!!!  In this sample code, there is NO error checking!  It's been
left out for clarity of the sample, and is NOT the way you should be
doing it!   The string "Hi There!" is obviously not something you would
bother returning, and it's only used as a point to say "copy some data
here".  A little better way to do that same routine (and the same
silly data) would be something like this:

char *foo()
{
	char *retbar;
	char *sample="Hi There!";

	if((retbar = (char *)malloc(strlen(sample)+1)) != (char *)0)
		strncpy(retbar, sample, strlen(sample));
	return(retbar);
}


So, there you have my humble offering.. hope that makes sense and
I didn't leave out *too* much (It's early here, haven't had my
coffee yet).

Ciao!

Jason
-- 
|UUCP  jason@txt.com                        Who wills, Can.
|VOICE (408) 243-3425                         Who tries, Does.
|LOCAL Hey, Jason!                              Who loves, Lives.          o_.
|Disclaimer:  Not me! I didn't do *THAT!*                                 <|
|Local Disclaimer:  I'm not here!                   A. McCaffrey           4


----- End forwarded message -----

