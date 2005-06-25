From: wwp <subscript@free.fr>
Subject: Re: How to prototype functions that return pointers
Date: Sat, 25 Jun 2005 08:22:18 +0200
Message-ID: <20050625082218.344489e9@localhost.localdomain>
References: <42BC7A4F.60304@colannino.org>
	<op.ssv8s2eyizdgzp@mail.nairnconsulting.ca>
	<42BC8043.9030904@colannino.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <42BC8043.9030904@colannino.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hello James,


On Fri, 24 Jun 2005 14:50:59 -0700 James Colannino <james@colannino.org>
wrote:

> Richard Nairn wrote:
> > Believe the correct decleration is (char *) readline();
> > 
> > Order of ops.
> 
> That was the next one I tried.  That yielded a syntax error.  I found
> out though that the "two or more data types" error was the result of a
> more difficult bug to find that had to do with something in another
> header file.  Once I fixed that, the declaration char * readline();
> worked.  Needless to say I'm very embarassed now... :-P

Moreover, the following ones are (should be) identical towards the C parser,
spaces between those tokens are not mandatory or can be repeated, and depend
on the coding style and recommendation/standard you follow:

char * readline();
char *readline();


Regards,

-- 
wwp
