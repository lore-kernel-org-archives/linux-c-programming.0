From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Unix Domain Sockets
Date: Sun, 30 Jan 2005 11:35:02 +0000
Message-ID: <16892.50790.943483.954593@gargle.gargle.HOWL>
References: <20050124_191803_058538.r_zaca@ig.com.br>
	<20050124193200.GD28037@lug-owl.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20050124193200.GD28037@lug-owl.de>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Cc: linux-c-programming@vger.kernel.org, r_zaca <r_zaca@ig.com.br>


Jan-Benedict Glaw wrote:

> >   Does anyone know what a "unix domain socket" is, and how it differ from an 
> > "Internet domain socket"? 
> 
> Internet domain sockets work with IP addresses and port numbers. A unix
> socket merely is a special file on a local file system, a so calles
> "fifo". It's created with the "mkfifo" library call or userspace
> command.

This is incorrect. A Unix-domain socket isn't quite the same thing as
a pipe or FIFO. Differences include:

1. Unix-domain sockets are created and accessed using the BSD sockets
API (socket(), bind(), accept(), connect() etc). You can't connect to
one with open() (you can create one with mknod(), but there isn't much
point, as there won't be a process listening on it).

2. Unix-domain sockets are bidirectional (i.e. you can use both read()
and write() on a single descriptor), whereas pipes and FIFOs are
uni-directional (i.e. one end is read-only and the other is
write-only).

To get back to the original question: a Unix-domain socket behaves
similar to an internet-domain socket, but uses a different transport
mechanism and different addressing scheme.

Internet-domain sockets transfer data via TCP/IP-compatible network
interfaces (e.g. ethernet, PPP etc). Unix-domain sockets are can only
transfer data locally, i.e. between processes running on the same
host; they cannot be used to transfer data between hosts.

Internet-domain sockets are addressed using an IP address and a port
number. Unix-domain sockets are addressed using a pathname.

The most common example of a Unix-domain socket is connecting to a
local X server via the sockets in the /tmp/.X11-unix directory. Each
local display will normally have a corresponding socket in that
directory; e.g. the display :0 can be accessed via the socket named
"/tmp/.X11-unix/X0".

From a programming perspective, the differences are:

1. You specify a value of PF_UNIX or PF_LOCAL (these two macros both
have the same value) for the first argument (protocol) to the socket()
function (rather than PF_INET for an internet-domain socket).

2. For functions which take a socket address (e.g. bind(), connect())
as an argument, the address is a "struct sockaddr_un" (rather than
"struct sockaddr_in" for an internet-domain socket), and the
sun_family field contains AF_UNIX or AF_LOCAL (rather than AF_INET for
the sin_family field for an internet-domain socket).

Other than that, you use the same functions as you would for
internet-domain sockets.

-- 
Glynn Clements <glynn@gclements.plus.com>
