From: Scott <drmemory@3rivers.net>
Subject: Re: Initializer element is not constant
Date: Mon, 24 Jan 2005 13:44:38 -0700
Message-ID: <20050124204438.GB833@drmemory.local>
References: <20050120232132.GE1279@drmemory.local> <41F06AC1.2000605@hq.ntsp.nec.co.jp> <41F06AD8.7080206@hq.ntsp.nec.co.jp> <20050121162726.GA977@drmemory.local> <41F13FF7.4020802@hq.ntsp.nec.co.jp> <20050121185454.GB977@drmemory.local> <41F15CEA.2070806@hq.ntsp.nec.co.jp> <20050121213157.GC977@drmemory.local> <20050122211206.GC12029@opaque>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20050122211206.GC12029@opaque>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

On Sat, Jan 22, 2005 at 10:12:06PM +0100, Christoph Bussenius wrote:
> I am not quite sure what you intend to do, but I guess that you want
> namectrl to change when you change recip_data[0].  To accomplish this,
> you could make recip_data[0] a pointer to a pointer:
> 
> char *namectrl = NULL;
> char *name1 = NULL;
> char *name2 = NULL;
> 
> typedef struct {
>         char **var;      /* destination for storage of the data */
>         size_t len;     /* max len of the data */
>         char *(*xlat)();        /* translation routine */
> } DATUM;                                                                                        
> 
> DATUM recip_data[] = {
> {  &namectrl, NAMECTRL_LEN, make_upper },
> {  &name1, NAME1_LEN, make_upper },
> {  &name2, NAME2_LEN, make_upper },
> [...]
> 

Right! As I said, my c is quite rusty. Now as I recall, there was some
problem with the old dos compiler which prevented this syntax but
allowed the erroneous one. That, or I didn't understand what I was
doing and the compiler let me get away with it.... Looking at the code
in more detail, I see that it relies upon some bcd math module I'd written
in assembler, so the odds of this getting ported are pretty
slim. Thanks for the help, though!

Scott Swanson

