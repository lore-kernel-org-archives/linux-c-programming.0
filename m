From: "Jason P. Winters" <jason@txt.com>
Subject: Re: Alignment of variables in gcc
Date: Sat, 23 Nov 2002 15:51:23 -0800 (PST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <200211232351.gANNpO5K020868@grinch.txt.com>
References: <20021123234207.35576.qmail@web14402.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20021123234207.35576.qmail@web14402.mail.yahoo.com> from "Reinaldo Nolasco Sanches" at Nov 23, 2002 03:42:07 PM
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reinaldo Nolasco Sanches <r_linux@yahoo.com>
Cc: linux-c-programming@vger.kernel.org

 
> Sorry for this question here... but anybody have any good doc with explain this ???

No problem..  For me, anyway!

> i.e
> In a struct is I put 
> 
> typedef struct myStruct {
>   char variable1;
>   int variable2;
> } myStruct;
> 
> The sizeof() myStruct is 8, I read some documents and see with this not a bug, this occurs because
> "Alignment requeriments"...

Yep.  This is not a bug...  It has to do with the _hardware_ requirements of the CPU, and speed
accessing memory...

With a 32 bit processor, all 'words' must be accessed on a 'word' boundry for maximum speed...
I.e., when the least significant two bits of the address are 0.

So, the structure starts out 'word' aligned.  For example, at address 0x100.  Your character
is at 0x100, so the next available address is 0x101.  Now, you specified an 'int', which must
be word aligned... so, the compiler moves to the next word aligned boundry, which happens to
be 0x104. (lower two bits are zero). 
Then it allocates 4 bytes for your int.  And thus, you have 8 bytes used in sizeof(struct),
but are really only using 5 of them.

If you swap the int and char definitions, you'll probably end up
with what you think is the right size.. i.e.,

typedef struct myStruct {
   int variable2;
   char variable1;
} myStruct;

Will probably (but not *always*) yeild you sizeof = 5.

Okay?

Ciao!

Jason
-- 
|UUCP  jason@txt.com                        Who wills, Can.
|VOICE (408) 243-3425                         Who tries, Does.
|LOCAL Hey, Jason!                              Who loves, Lives.          o_.
|Disclaimer:  Not me! I didn't do *THAT!*                                 <|
|Local Disclaimer:  I'm not here!                   A. McCaffrey           4
