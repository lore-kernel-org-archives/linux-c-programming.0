From: Edward Parrilla <eparrilla@comcast.net>
Subject: Re: Returned mail: delivery problems encountered
Date: 27 Oct 2004 22:34:05 -0500
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1098934436.6437.7.camel@localhost.localdomain>
References: <2004102722581901500p7n00e@A@000000000000@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <2004102722581901500p7n00e@A@000000000000@comcast.net>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux prg <linux-c-programming@vger.kernel.org>


> 
> Hi all,
> I have the following:
> #define STDIN 0
> /* .......*/
>  
> int nfds;
> struct timeval tv;
> fd_set rfds;
> fd_set afds;
> FD_ZERO(&afds);
> tv.tv_sec=0;
> tv.tv_usec=0
> FD_SET(STDIN, &afds);
> FD_SET(msock, &afds);
> nfds=getdtablesize();
> msock=passiveTCP(service, 5); <--listening socket
> while(1)
> {
>    memcpy(&rfds,&afds, sizeof(rfds));
>    if (select(nfds, &rfds, (fd_set *)0, (fd_set *)0, &tv)<0)
>          errexit (" error ");
>   if (FD_ISSET(STDIN,&rfds)
>      handle(stdin);
>  
>  
> /*  it is not making to this line */  <-- here is the prolem, it does
> not make to the next line, it does work to the line before(i.e. takes
> input from STDIN), but it doesn't take something coming to the socket.
>  
> if (FD_ISSET(msock, &rfds))
>    {
>       handle _incoming _request()
>   }
>  
> }
>  
> Any idea why it couldn't be taking the incoming calls for the socket. 
> Thanks in advance
> Ed


