From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Alignment of variables in gcc
Date: Sun, 24 Nov 2002 07:34:17 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15840.33017.726026.921775@cerise.nosuchdomain.co.uk>
References: <20021123234207.35576.qmail@web14402.mail.yahoo.com>
	<200211232351.gANNpO5K020868@grinch.txt.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200211232351.gANNpO5K020868@grinch.txt.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Jason P. Winters" <jason@txt.com>
Cc: Reinaldo Nolasco Sanches <r_linux@yahoo.com>, linux-c-programming@vger.kernel.org


Jason P. Winters wrote:

> > i.e
> > In a struct is I put 
> > 
> > typedef struct myStruct {
> >   char variable1;
> >   int variable2;
> > } myStruct;
> > 
> > The sizeof() myStruct is 8, I read some documents and see with this not a bug, this occurs because
> > "Alignment requeriments"...
> 
> Yep. This is not a bug... It has to do with the _hardware_
> requirements of the CPU, and speed accessing memory...
> 
> With a 32 bit processor, all 'words' must be accessed on a 'word'
> boundry for maximum speed... I.e., when the least significant two
> bits of the address are 0.

Actually, on many architectures, it isn't just a performance issue;
words must be aligned otherwise either an exception occurs or you get
the wrong data. x86 is one of the few architectures where the CPU
allows unaligned accesses.

> If you swap the int and char definitions, you'll probably end up
> with what you think is the right size.. i.e.,
> 
> typedef struct myStruct {
>    int variable2;
>    char variable1;
> } myStruct;
> 
> Will probably (but not *always*) yeild you sizeof = 5.

No it won't. The size of a structure needs to be a multiple of the
largest alignment of any of its members; otherwise you would have
problems with arrays.

-- 
Glynn Clements <glynn.clements@virgin.net>
