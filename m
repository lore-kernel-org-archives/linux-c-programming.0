From: "John T. Williams" <jtwilliams@vt.edu>
Subject: Re: socket send and recv
Date: Thu, 7 Aug 2003 18:03:35 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <001f01c35d2f$d48ca8e0$ed64a8c0@descartes>
References: <3F322DFA.2030509@hq.ntsp.nec.co.jp> <20030807114057.GA19378@lsd.di.uminho.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: jtwlliams@vt.edu
Cc: linux-c-programming@vger.kernel.org


I common delimiter used by many protocols is either a single \n\r for
messages which are known to me less then on line (ie have not \n in them) or
a \n\r.\n\r for messages that could have multiple lines




----- Original Message ----- 
From: "Luciano Miguel Ferreira Rocha" <luciano@lsd.di.uminho.pt>
To: "ronkhu" <ronkhu@ntsp.nec.co.jp>
Cc: "Earl Lapus" <lapuz.rl@mp.ncos.nec.co.jp>; "Lejanson C. Go"
<g_l-go@tmg99.ntes.nec.co.jp>; <linux-c-programming@vger.kernel.org>
Sent: Thursday, August 07, 2003 7:40 AM
Subject: Re: socket send and recv


> On Thu, Aug 07, 2003 at 06:46:18PM +0800, ronkhu wrote:
> > i have a client program which sends a sequence of bytes everytime
> > anything(plus carriage return)  is inputted into STDIN...
> >
> > but the problem lies in the receiving end of the socket connection...
> > with a single call of the recv() function, multiple messages sent by the
> > client are concatenated into one stream..
> Yes, STREAM sockets have no knowledge of messages, but DGRAM do (but
> are unreliable).
>
> So you need to have a way to know what is a single message, either by
> using delimiters (like \n) or by using headers, with the length of the
message.
> (Or use DGRAM sockets.)
>
> Also, you can use the TCP_NODELAY socket(7) option to force the data to
> be sent immediately, but there's no gaurantee it won't be buffered at the
> receiver.
>
> Regards,
> Luciano Rocha
> -
> To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

