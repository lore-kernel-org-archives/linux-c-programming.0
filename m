From: jnf <xjnfx@doityourself.com>
Subject: sock-ops->connect()
Date: Sun, 6 Oct 2002 03:15:21 -0700 (PDT)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20021006101521.B253E11E0B@sitemail.everyone.net>
Reply-To: xjnfx@doityourself.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

I'm working in the kernel trying to learn it better and how it implements networking, and i seem to have the honor of recieving a kernel panic (invalid operand 0000) when i try to make a call to connect(), the code is as follows:

char *ip;
MODULE_PARM(ip,"s");

// ...

struct socket *sock;
struct sockaddr_in adr;
int err,port;

// ...

port = 5260;

err = sock_create(AF_INET,SOCK_STREAM,IPPROTO_TCP,&sock);
if(err < 0) {
     printk("err sock_create\n");
     goto drop;
}

adr.sin_family      = AF_INET;
adr.sin_port        = htons(port);
adr.sin_addr.s_addr = in_aton(ip);
memset(&(adr.sin_zero,'\0',8);

err = sock->ops->connect(sock,(struct sockaddr *)&adr,sizeof(adr),0);

// ... etc

it doesnt make it past the connect() line, and im not sure why, any help would be greatly appreciated. Also what is the suggested method for creating sockets in the kernel? Is it necessary for me to use kernel_thread() ?

thank you
jnf


_____________________________________________________________
Sign up for FREE email from DoItYourself.com at http://doityourself.com

_____________________________________________________________
Select your own custom email address for FREE! Get you@yourchoice.com w/No Ads, 6MB, POP & more! http://www.everyone.net/selectmail?campaign=tag
