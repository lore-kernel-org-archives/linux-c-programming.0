From: r_zaca <r_zaca@ig.com.br>
Subject: Re: Dylibs
Date: Mon, 15 Aug 2005 08:17:19 -0300
Message-ID: <20050815_111719_052668.r_zaca@ig.com.br>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="Message-Boundary-by-Mail-Sender-1124104639"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

--Message-Boundary-by-Mail-Sender-1124104639
Content-type: text/plain; charset=ISO-8859-1
Content-description: Mail message body
Content-transfer-encoding: 8bit
Content-disposition: inline

  Hello, 

  These are construction of code that you can use before the return of 
dlopen and after dlclose. For example: 

void _init () 
{ 
   printf ("init print.\n"); 
} 

void _fini () 
{ 
   printf ("fini print.\n"); 
} 

  The code in _init function will be run before the return of dlopen to your 
program and the code in _fini will be run before the return of dlopen to 
your program. You just have to put the code you actually need inside these 
functions. 

  I hope it can help you. 
  Good Luck. 

>Hi, 
>     While loading Dylibs i want to write my own __init,__fini 
>functions.Would you please tell me how to write those functions >please. 
> 
>Raja 

--Message-Boundary-by-Mail-Sender-1124104639--

