From: Jad Saklawi <Jad@Saklawi.info>
Subject: Re: Splitter
Date: Mon, 22 Mar 2004 08:42:28 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <405E8AD4.9070402@Saklawi.info>
References: <Pine.LNX.4.44.0403222328140.3052-100000@csews32.cse.iitk.ac.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0403222328140.3052-100000@csews32.cse.iitk.ac.in>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "K.Anantha Kiran" <ananth@cse.iitk.ac.in>
Cc: linux-c-programming@vger.kernel.org

K.Anantha Kiran wrote:

>Hi,
> I want to modify the Linux code for " REDIRECTING PACKETS FROM ONE 
>INTERFACE TO ANOTHER INTERFACE OF MY INTEREST OUT OF ALL AVAILABLE 
>INTERFACES". What part of CODE , do i need to concentrate on.
>
>  
>
    This ain`t gonna be an easy task if you want to do it in kernel 
space. Why re invent the loop when iptables (netfilter) can do the job ? 
any way the networking part for the linux kernel is found the net 
directory in the root directory.

Greets,
Jad

-- 
Jad Saklawi
Lebanese American University
P.O.Box : 13-5053/492
Chouran Beirut : 1102 2801
Phone : 009613 98 98 75
http://Saklawi.info
Lebanon


