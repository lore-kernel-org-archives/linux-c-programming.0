From: Honnavalli_Sreevathsa@emc.com
Subject: RE: Function call
Date: Wed, 1 Mar 2006 10:47:08 -0000
Message-ID: <50C05B7AA7D6924FB5E384EF14BC647B04D9A8A3@inba1mx2.corp.emc.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

The statement 

funckey;

does not have any effect and the compiler does not generate any extra
assembly code for it. You are just mentioning a valid symbol name in your
program without assigning it to any other variable, which the compiler deems
as 'not wrong'. You can compile your program with -Wall option to see a
warning message saying this.

Sreevathsa



> -----Original Message-----
> From: linux-c-programming-owner@vger.kernel.org 
> [mailto:linux-c-programming-owner@vger.kernel.org] 
> Sent: Wednesday, March 01, 2006 10:54 AM
> To: Linux C Programming List
> Subject: Function call 
> 
> 
> Hello,
> 
> I have a doubt regarding the following code. There is a void function
> funckey().
> 
> void funckey()
> {
> ;
> }
> 
> void main()
> {
> funckey;
> funckey();
> }
> 
> During execution, the second statement calls the function funckey().
> 
> What does the compiler do in the first statement funckey?
> 
> Thanks in advance, 
> Subbulakshmi Sadagopal 
> 
> -
> To unsubscribe from this list: send the line "unsubscribe 
> linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
