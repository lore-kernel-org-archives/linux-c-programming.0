From: =?iso-8859-1?Q?Patrik_J=F6nsson?= <mailme-linux@illuvatar.nu>
Subject: RE: using the same port with two sockets
Date: Fri, 26 Sep 2003 07:51:19 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <001d01c383f2$3571ca80$bac7f082@campus.luth.se>
References: <Pine.A41.4.20.0309252133350.71280-100000@delfin.unideb.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.A41.4.20.0309252133350.71280-100000@delfin.unideb.hu>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Fekete Gabor' <feketga@delfin.unideb.hu>
Cc: 'linux-c-programming' <linux-c-programming@vger.kernel.org>

One possible way should be to have a master process wich recieves the data,
looks the source IP:port pair up in a table and starts a new process if it
is not found, and otherwise uses some IPC (like pipes) mean to forward it to
the right process, the processes could then use another pipe to send replies
to the other host.



> -----Original Message-----
> From: linux-c-programming-owner@vger.kernel.org 
> [mailto:linux-c-programming-owner@vger.kernel.org] On Behalf 
> Of Fekete Gabor
> Sent: Thursday, September 25, 2003 9:36 PM
> To: unlisted-recipients:; no To-header on input
> Cc: linux-c-programming
> Subject: Re: using the same port with two sockets
> 
> 
> 
> 
> On Thu, 25 Sep 2003, Jeff Woods wrote:
> 
> > Unlike SOCK_STREAM (aka TCP sockets) SOCK_DGRAM (aka UDP 
> sockets) are
> > connectionless.  Every new UDP packet arrives at the single 
> listening 
> > socket which is bound to the UDP port addressed.  You can 
> not have two 
> > sockets listening on the same UDP port (IIUC).
> > 
> it's ok. i know it.
> i mean i would like to emulate the TCP connections with UDP.
> ok the truth is, i need it because i want to make a 
> client/server stuff with udp.
> 
> 
> -
> To unsubscribe from this list: send the line "unsubscribe 
> linux-c-programming" in the body of a message to 
> majordomo@vger.kernel.org More majordomo info at  
http://vger.kernel.org/majordomo-info.html

