From: Christoph Bussenius <busseniu@cip.physik.uni-muenchen.de>
Subject: Re: Initializer element is not constant
Date: Sat, 22 Jan 2005 22:12:06 +0100
Message-ID: <20050122211206.GC12029@opaque>
References: <20050120232132.GE1279@drmemory.local> <41F06AC1.2000605@hq.ntsp.nec.co.jp> <41F06AD8.7080206@hq.ntsp.nec.co.jp> <20050121162726.GA977@drmemory.local> <41F13FF7.4020802@hq.ntsp.nec.co.jp> <20050121185454.GB977@drmemory.local> <41F15CEA.2070806@hq.ntsp.nec.co.jp> <20050121213157.GC977@drmemory.local>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20050121213157.GC977@drmemory.local>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hi Scott,

On Fri, Jan 21, 2005 at 02:31:57PM -0700, Scott wrote:
>  recip_data[0].var = namectrl;

namectrl is NULL, so why would you want to do this?  This is just like
writing

recip_data[0] = NULL;

I am not quite sure what you intend to do, but I guess that you want
namectrl to change when you change recip_data[0].  To accomplish this,
you could make recip_data[0] a pointer to a pointer:

char *namectrl = NULL;
char *name1 = NULL;
char *name2 = NULL;

typedef struct {
        char **var;      /* destination for storage of the data */
        size_t len;     /* max len of the data */
        char *(*xlat)();        /* translation routine */
} DATUM;                                                                                        

DATUM recip_data[] = {
{  &namectrl, NAMECTRL_LEN, make_upper },
{  &name1, NAME1_LEN, make_upper },
{  &name2, NAME2_LEN, make_upper },
[...]

Now you can change namectrl by saying
*recip_data[0].var = "test string";

Hope this helps,
Christoph

-- 
``There's no dark side of the moon, really
Matter of fact, it's all dark''

--Pink Floyd
