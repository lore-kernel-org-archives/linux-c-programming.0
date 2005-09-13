From: _z33 <timid.Gentoo@gmail.com>
Subject: Re: Confusing Prototype
Date: Tue, 13 Sep 2005 09:26:50 +0530
Message-ID: <dg5im3$etc$1@sea.gmane.org>
References: <432470B7.7050609@colannino.org> <dg3sd3$cd7$1@sea.gmane.org> <6a00c8d5050912093622607b44@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <6a00c8d5050912093622607b44@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Steve Graegert wrote:
> 
> Sorry, I do not fully agree. 

   I knew I must have gone wrong somewhere ;-)

> NULL is also returned when the system
> encountered EOF.   SUSv3 says that if EOF or an error occurred the
> stream's EOF/error indicator is set, which means that to make sure
> what happened you will have to call ferror and feof anyway.  In both
> cases the buffer is left unchanged.
> 
> From this point of view, returning an int indicating an error and EOF
> with a value of 0 and the number of bytes read otherwise would be
> sufficient.  One could then write
> 
> 	while (fgets(buf, BUFSIZE, stream) > 0)  { /* do some stuff */ }
> 

   I agree absolutely.

> For me, it is an academic discussion and I can live with the current
> solution quite well.  Besides this, I have had the opportunity to
> implement parts of an IO library for an embedded project and we have
> chosen not to return a pointer to the input buffer but the number of
> bytes actually read or 0 on EOF or error.  It was possible since
> everything was written from scratch, so nothing broke.
   nice solution.

_z33
-- 
I love TUX; well... that's an understatement :)

