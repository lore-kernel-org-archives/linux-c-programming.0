From: Ron Michael Khu <ronkhu@ntsp.nec.co.jp>
Subject: Re: Raw Sockets
Date: Sun, 19 Dec 2004 19:07:54 +0800
Message-ID: <41C5610A.7030207@hq.ntsp.nec.co.jp>
References: <200412191119.14034.ingvarrr@hotbox.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200412191119.14034.ingvarrr@hotbox.ru>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Igor A. Deruga" <ingvarrr@hotbox.ru>
Cc: linux-c-programming@vger.kernel.org

i dont know how to use raw sockets....
but u could try using "ifconfig" (located usually in the /sbin directory)
to get the mach address...

*the mach address(or hwaddr is usually shown on the first line
of the output)

hope this helps.


Igor A. Deruga wrote:

>Greetings, fellows!
>
>Hope you'll be able to help me with your useful advice...
>I need to establish a connection using a Raw socket. That's what I'm doing:
>
>int sock = socket(AF_PACKET, SOCK_RAW, IPPROTO_RAW);
> sockaddr_ll addr;
>        addr.sll_family = AF_PACKET;
>        addr.sll_protocol = 0;
>        addr.sll_ifindex = 0;
>        addr.sll_hatype = 0;
>        addr.sll_pkttype = 0;
>        addr.sll_halen = 0;
>
>But where can I get a value for addr.sll_addr? And what is it? "man 7 packet" 
>sais it's a Physical layer address, which is MAC, i guess... so, how do I 
>retreive it?
>
>If it's possible, could anybody send me an example that uses sockaddr_ll to 
>SEND packets via RAW SOCKET? That'd be great!
>
>Sincerely 
>        Igor	
>
>
>P.S.: I've set the encoding to iso-8859-5. Hope this time it goes through...
>-
>To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>  
>


