From: Scott <drmemory@3rivers.net>
Subject: Re: Initializer element is not constant
Date: Fri, 21 Jan 2005 11:54:54 -0700
Message-ID: <20050121185454.GB977@drmemory.local>
References: <20050120232132.GE1279@drmemory.local> <41F06AC1.2000605@hq.ntsp.nec.co.jp> <41F06AD8.7080206@hq.ntsp.nec.co.jp> <20050121162726.GA977@drmemory.local> <41F13FF7.4020802@hq.ntsp.nec.co.jp>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <41F13FF7.4020802@hq.ntsp.nec.co.jp>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

On Sat, Jan 22, 2005 at 01:46:31AM +0800, Ron Michael Khu wrote:
> have u tried changing the first field of each element??
> something like... replacing those char ptrs with something static?
> 
> example:
> 
> DATUM recip_data[] = {
> {  "i am a constant str", NAMECTRL_LEN, make_upper },       
> {  "i am a constant str", NAME1_LEN, make_upper },

As I recalled, the ability to HAVE dynamic pointers was one of the
primary benefits of using c in the first place! Later in the file I
have this routine which allocates space for each pointer in the
structure:

alloc_space(r) RECORD *r;
{	register size_t i;
	register char **v;
	
	for(i=0; i<r->n; i++)
	{	if(r->data[i].len == 0 || r->data[i].len == 0xFFFF) continue;
		v = (r->data[i].var);
		if (*v == NULL)
		{	*v = (char *) calloc(1,r->data[i].len + 1);
			memset(*v,'A'+i,r->data[i].len);
		}
	}
}

I guess i just don't understand why a "modern" compiler wants to
restrict my options in this fashion....
