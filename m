From: "Huber, George K RDECOM CERDEC STCD SRI" <George.K.Huber@us.army.mil>
Subject: RE: Use of htons function
Date: Mon, 20 Sep 2004 14:14:52 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <E3E30069B061524E90BCEE4417E30661138531@monm207.monmouth.army.mil>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Ronaldo wrote:

>  Some one could tell me what the function "htons" realy does? Where can I 
>  use it? I tryed to find its purpose in the "man htons", but it seems a
little 
>  bit confusing. 

`htons' (host to network short) converts a short from the native byte-order
for 
platform to the "network byte-order".  The TCP/IP standard specifies 
that the network byte-order will be big-endian (i.e. the most significant
byte of
a mult-byte value will be stored in the lowest memory addrss).  

Based on this the overall effect of `htons' depends on the architecture of
the 
platform.  For example, if developing on an intel platform (which is
little-endian) 
then `htons' will convert to big-endian.  However, on a Sparc platform
(which is
big-endian) `htons' will do nothing.

You can use `htons' anywhere where you need a value in big-endian format.
You should 
use `htons' in any network related code when sending a short (say a port
number) across 
the network, regardless of the platform you are developing on - this aids
portability 
of your code.

Finally, you should be aware of the following functions:

htonl  -- host to network long
ntohs  -- network to host short
ntohl  -- network to host long

George

