From: Ron Michael Khu <ronkhu@ntsp.nec.co.jp>
Subject: re: memory problem
Date: Mon, 13 Sep 2004 19:51:20 +0800
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <414589B8.6040805@hq.ntsp.nec.co.jp>
References: <20040913111103.77851.qmail@web52901.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040913111103.77851.qmail@web52901.mail.yahoo.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ankit Jain <ankitjain1580@yahoo.com>, linux prg <linux-c-programming@vger.kernel.org>, gcc-help@gcc.gnu.org

what method did u use to allocate memory??

static:
 char array[1024*1024] ;

dynamic
 char *array = (char*)calloc(  1024*1024, sizeof(char) );

and why r u allocating such huge chunks for an array?



Ankit Jain wrote:

>hi
>
>well i am fixed up in a new problem
>
>i am using a array of size 1024*1024
>
>it gives segmentation fault
>
>it works with 512*512
>
>my menory size is 128 mb and 512 swap
>
>i have enough memory space and using gcc 3.2 v
>
>may be i need to increase the memory size
>
>how to do that?
>
>ankit
>
>________________________________________________________________________
>Yahoo! Messenger - Communicate instantly..."Ping" 
>your friends today! Download Messenger Now 
>http://uk.messenger.yahoo.com/download/index.html
>-
>To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>  
>

