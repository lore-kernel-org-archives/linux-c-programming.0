From: Hossein Mobahi <hmobahi@yahoo.com>
Subject: Re: Problem with read() and named pipe (FIFO) (fflush or fsync)
Date: Tue, 17 Aug 2004 03:58:36 -0700 (PDT)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040817105836.14496.qmail@web12703.mail.yahoo.com>
References: <20040816165745.3ccf3356.henry.margies@gmx.de>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040816165745.3ccf3356.henry.margies@gmx.de>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hello

My program, prg2, is the reader, not writer. So making
the reader flush does not make sense. If I could make
prg1 flush (its writing buffer), it would help, but I
do not have access to the source code of prg1, it is
just an executable file. 

I was wondering if we can somehow force an executable
program not to use buffered output without access to
its source code? The program originally uses printf
for writing its output.

--Hossein

--- Henry Margies <henry.margies@gmx.de> wrote:

> Hi
> 
> 
> Have you tried fflush or fsync or something like
> this?
> 
> 
> Henry



		
__________________________________
Do you Yahoo!?
Yahoo! Mail Address AutoComplete - You start. We finish.
http://promotions.yahoo.com/new_mail 
