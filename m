From: Hossein Mobahi <hmobahi@yahoo.com>
Subject: Re: Problem with read() and named pipe (FIFO) (pipe not disk)
Date: Tue, 17 Aug 2004 12:25:47 -0700 (PDT)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040817192547.72085.qmail@web12708.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Sure, the stdio's buffer is limited. However, as you
said, the real-time constraint doesn't let me wait for
the buffer to become full. I need to read it as soon
as the data is written to the buffer. So I really need
to flush stdio's buffer out of that process.

--Hossein

--- joy <gracecott@sancharnet.in> wrote:
> The program cannot buffer data for all eternity and
> must eventually 
> write it to the
> pipe. So, even if read() blocks because  there is no
> data available, it 
> must return as soon as data
> is written. The real-time element will be lost
> though I doubt it will 
> buffer for a long time.
> Is this the behavior you are experiencing and is
> there a problem with this ?
>
> Hossein Mobahi wrote:
> >The solution that I know is using
> >write(STDOUT_FILENO,....) instead of printf because
> it
> >does not buffer. However, I do not have access to
> the
> >source code of prg1, and I must somehow make prg1
> >flush its standard I/O buffer from outside.



		
__________________________________
Do you Yahoo!?
Yahoo! Mail - 50x more storage than other providers!
http://promotions.yahoo.com/new_mail
