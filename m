From: Ron Michael Khu <ronkhu@ntsp.nec.co.jp>
Subject: Re: Into the Void
Date: Wed, 26 Jan 2005 10:18:46 +0800
Message-ID: <41F6FE06.7020001@hq.ntsp.nec.co.jp>
References: <20050126000910.GC888@drmemory.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20050126000910.GC888@drmemory.local>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Scott <drmemory@3rivers.net>, linux-c-programming@vger.kernel.org

why dont u try casting the whole thing??
(putting an enclosing parenthesis on ur memcpy oper)

((char *) memcpy(*data_buf,bp,len))[len] = '\0';


Scott wrote:

>Years ago, I learned this trick from somebody in the C/C++ Journal, or
>whatever that rag was called:
>
>           memcpy(*data_buf,bp,len)[len] = '\0';
>
>I get the following error:
>
>indatax.c: In function `read_datum':
>indatax.c:374: warning: dereferencing `void *' pointer
>indatax.c:374: invalid use of void expression
>
>and if I cast the function:
>
>           (char *) memcpy(*data_buf,bp,len)[len] = '\0';
>
>I get:
>
>indatax.c: In function `read_datum':
>indatax.c:374: warning: dereferencing `void *' pointer
>indatax.c:374: void value not ignored as it ought to be
>
>What aren't I understanding here? Tell me to go away if these
>questions are too elementary for the list....
>-
>To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>  
>


