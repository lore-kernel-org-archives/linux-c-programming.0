From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Reading from pipe
Date: Tue, 4 Feb 2003 21:06:56 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15936.11120.748235.577740@cerise.nosuchdomain.co.uk>
References: <20030204153158.46580.qmail@web40606.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20030204153158.46580.qmail@web40606.mail.yahoo.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alexi Jordanov <alexi91@yahoo.com>
Cc: linux-c-programming@vger.kernel.org


Alexi Jordanov wrote:

> I'm using pipes at this moment and I try decrease
> threads in my application. Therefore I need to know
> whether there is a way to check if there are any
> available bytes in pipe. I don't want to use blocking
> read operation. Just to check and if there are then to
> read them.

select() will indicate whether or not there is any data available; if
there is, then read() will read whatever data is available, up to a
maximum of the size of its buffer (it won't block trying to read the
specified number of bytes).

Alternatively, ioctl(FIONREAD) will return (in the int to which its
third argument points) the number of bytes currently available.

-- 
Glynn Clements <glynn.clements@virgin.net>
