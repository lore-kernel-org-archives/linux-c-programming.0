From: =?ISO-8859-1?Q?Dar=EDo_Mariani?= <dmarian@fi.uba.ar>
Subject: Re: Debug flag for libraries.
Date: Tue, 01 Jul 2003 12:00:13 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3F01A1FD.8020903@fi.uba.ar>
References: <DD9E117A8BE9F34FA4130376EC9C1F6A048B48B7@BANMLVEM01.e2k.ad.ge.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Ramanan, Venkat (MED)" <Venkat.ramanan@geind.ge.com>
Cc: linux-c-programming@vger.kernel.org

   In general you will have no problems, I did not work with static 
libraries, but with shared ones never had a problem. I do not think that 
recompiling the libraries with debug info provides much help, unless the 
libraries are buggy.

Ramanan, Venkat (MED) wrote:
> Hi all,
> 
> I need to compile a program with the debug flag "-g". The program uses some (static) libraries which have already been compiled without the "-g" flag. So, if I need all the debugging information ( line numbers etc. ) even from the libraries, do I need to recompile the libraries? Or is the "-g" flag just for the program, enough to bring all info?
> 
> I use "gcc" and "gdb".
> 
> What is the "correct" thing to do? Any advice would be greatly appreciated.
> 
> Thanks in advance,
> Venkat.
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 


