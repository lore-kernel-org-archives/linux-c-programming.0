From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Message queue
Date: Wed, 20 Dec 2006 14:45:33 +0000
Message-ID: <17801.19597.919047.309779@cerise.gclements.plus.com>
References: <45891A09.1060204@sun.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <45891A09.1060204@sun.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Prasanta Sadhukhan <Prasanta.Sadhukhan@Sun.COM>
Cc: linux-c-programming@vger.kernel.org


Prasanta Sadhukhan wrote:

> I was trying to use the message queue implementation of linux through a 
> simple client/server program.
> The client will get text from stdin and send to server through message 
> queue and server will convert to upper case and resend to back to client
> Attached is the client and server program I used
> However, while sending in client and receiving in server, I am getting 
> errno as 13(EACCESS). Can anyone tell me what I need to do extra?

For a start, the side which creates the message queue (probably the
server) needs to set the permissions, e.g.:

	#include <sys/stat.h>
	...
	toinput_id=msgget(key_out, IPC_CREAT|S_IRUSR|S_IWUSR);
	...
	tooutput_id=msgget(key_in, IPC_CREAT|S_IRUSR|S_IWUSR);

Otherwise, access will be refused, hence EACCESS.

Some other issues:

The third argument to msgrcv() needs to be the size of the buffer,
e.g. sizeof(text) not strlen(text).

The return value from main should be non-negative, zero for success
and greater than zero for failure. In practice, a value of -1 will
typically result in an exit code of 255 due to being truncated to 8
bits.

-- 
Glynn Clements <glynn@gclements.plus.com>
