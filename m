From: Krishna Mohan <gkmohan@rocsys.com>
Subject: Re: pointer initialization of string constant
Date: 23 Jan 2005 19:06:17 +0530
Message-ID: <1106487378.1122.14.camel@KrishnaMohan>
References: <1106461572.1122.1.camel@KrishnaMohan> 
	<20050123184550.B330@Imrashi.net.bd>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20050123184550.B330@Imrashi.net.bd>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Progga <abulfazl@juniv.edu>
Cc: LinuxC <linux-c-programming@vger.kernel.org>

Dear progga 
U are right. But my doubt is : when i run gdb and execute p ptr either
just after or before printf, pbc has been displayed. I'm getting
segmentation fault only at the end, it seems, because when i run
./a.out  "pbc is not displayed" but prompted segmentation fault error.
why is it so? How does segmentation fault raises, though
pointer-pointing contents has been changed & even displayed using gdb. i
am interested to know the internals. 
Thanq for ur interest. 
Regards 
Krishna Mohan 

On Sun, 2005-01-23 at 18:15, Progga wrote: 
    On Sun, Jan 23, 2005 at 11:56:11AM +0530, Krishna Mohan wrote:
    > 
    > main()
    > {
    >         char *ptr = "abc";
    >         ptr[0] = 'p';
    
     Since ptr points to read-only mem, changing ptr[0] does not seem to be a very
    wise idea.
    

