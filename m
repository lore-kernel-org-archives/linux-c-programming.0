From: Ron Michael Khu <ronkhu@ntsp.nec.co.jp>
Subject: Re: Initializer element is not constant
Date: Sat, 22 Jan 2005 03:50:02 +0800
Message-ID: <41F15CEA.2070806@hq.ntsp.nec.co.jp>
References: <20050120232132.GE1279@drmemory.local> <41F06AC1.2000605@hq.ntsp.nec.co.jp> <41F06AD8.7080206@hq.ntsp.nec.co.jp> <20050121162726.GA977@drmemory.local> <41F13FF7.4020802@hq.ntsp.nec.co.jp> <20050121185454.GB977@drmemory.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20050121185454.GB977@drmemory.local>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Scott <drmemory@3rivers.net>, linux-c-programming@vger.kernel.org

but u can.... =)
have u tried dynamically allocating space for recip_data?? instead of 
the usual static declaration?
char a[10] <-- this is static
char a[]= {'1','2','3','4'} <-- this is static with definition and 
declartion in one
char *a = calloc.....

have u tried it? using malloc/calloc for defining DATUM recip_data??

im not good with explanations....
but i bet the gurus like JBG could explain the solution/scenario alot 
better. =)


Scott wrote:

>On Sat, Jan 22, 2005 at 01:46:31AM +0800, Ron Michael Khu wrote:
>  
>
>>have u tried changing the first field of each element??
>>something like... replacing those char ptrs with something static?
>>
>>example:
>>
>>DATUM recip_data[] = {
>>{  "i am a constant str", NAMECTRL_LEN, make_upper },       
>>{  "i am a constant str", NAME1_LEN, make_upper },
>>    
>>
>
>As I recalled, the ability to HAVE dynamic pointers was one of the
>primary benefits of using c in the first place! Later in the file I
>have this routine which allocates space for each pointer in the
>structure:
>
>alloc_space(r) RECORD *r;
>{	register size_t i;
>	register char **v;
>	
>	for(i=0; i<r->n; i++)
>	{	if(r->data[i].len == 0 || r->data[i].len == 0xFFFF) continue;
>		v = (r->data[i].var);
>		if (*v == NULL)
>		{	*v = (char *) calloc(1,r->data[i].len + 1);
>			memset(*v,'A'+i,r->data[i].len);
>		}
>	}
>}
>
>I guess i just don't understand why a "modern" compiler wants to
>restrict my options in this fashion....
>-
>To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>  
>


