From: Scott <drmemory@3rivers.net>
Subject: Re: Initializer element is not constant
Date: Fri, 21 Jan 2005 14:31:57 -0700
Message-ID: <20050121213157.GC977@drmemory.local>
References: <20050120232132.GE1279@drmemory.local> <41F06AC1.2000605@hq.ntsp.nec.co.jp> <41F06AD8.7080206@hq.ntsp.nec.co.jp> <20050121162726.GA977@drmemory.local> <41F13FF7.4020802@hq.ntsp.nec.co.jp> <20050121185454.GB977@drmemory.local> <41F15CEA.2070806@hq.ntsp.nec.co.jp>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <41F15CEA.2070806@hq.ntsp.nec.co.jp>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

On Sat, Jan 22, 2005 at 03:50:02AM +0800, Ron Michael Khu wrote:
> but u can.... =)
> have u tried dynamically allocating space for recip_data?? instead of 
> the usual static declaration?
> char a[10] <-- this is static
> char a[]= {'1','2','3','4'} <-- this is static with definition and 
> declartion in one
> char *a = calloc.....
> 
> have u tried it? using malloc/calloc for defining DATUM recip_data??

Well yes, I guess I could [m|c]alloc the recip_data array. But how do I
then populate it?

 recip_data[0].var = namectrl;
 recip_data[0].len = NAMECTRL_LEN;
 recip_data[0].xlat = make_upper;
etc...

How tedious is THAT!? Especially considering that the code has
eight such arrays, averaging 6 elements per array.

Maybe I'm not understanding your suggestion. As I mentioned, it has
been quite a while since I did any c programming. I just find it
strange that code which compiled fine 20 years ago now will not. I
could understand if it just generated warnings....


