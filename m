From: "Igor A. Deruga" <ingvarrr@hotbox.ru>
Subject: Raw Sockets
Date: Sun, 19 Dec 2004 11:19:13 +0700
Message-ID: <200412191119.14034.ingvarrr@hotbox.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Greetings, fellows!

Hope you'll be able to help me with your useful advice...
I need to establish a connection using a Raw socket. That's what I'm doing:

int sock = socket(AF_PACKET, SOCK_RAW, IPPROTO_RAW);
 sockaddr_ll addr;
        addr.sll_family = AF_PACKET;
        addr.sll_protocol = 0;
        addr.sll_ifindex = 0;
        addr.sll_hatype = 0;
        addr.sll_pkttype = 0;
        addr.sll_halen = 0;

But where can I get a value for addr.sll_addr? And what is it? "man 7 packet" 
sais it's a Physical layer address, which is MAC, i guess... so, how do I 
retreive it?

If it's possible, could anybody send me an example that uses sockaddr_ll to 
SEND packets via RAW SOCKET? That'd be great!

Sincerely 
        Igor	


P.S.: I've set the encoding to iso-8859-5. Hope this time it goes through...
