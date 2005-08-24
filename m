From: r_zaca <r_zaca@ig.com.br>
Subject: Nanoseconds
Date: Wed, 24 Aug 2005 16:08:54 -0300
Message-ID: <20050824_190854_092976.r_zaca@ig.com.br>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="Message-Boundary-by-Mail-Sender-1124910534"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

--Message-Boundary-by-Mail-Sender-1124910534
Content-type: text/plain; charset=ISO-8859-1
Content-description: Mail message body
Content-transfer-encoding: 8bit
Content-disposition: inline

  Hello all, 

  I need a way to get the date of my linux machine in seconds and 
nanoseconds. In seconds I know I can you some of the standards function of 
lib C (that give me the date since the "epoch"), but my problem is to get 
the nanoseconds. I was reading about clock_gettime. It seems to solve my 
problem, but when I try to compile and link it, I get an error message like 
that: 

cc     time.c   -o time 
/tmp/ccOKP0zk.o(.text+0x21): In function `main': 
: undefined reference to `clock_gettime' 
collect2: ld returned 1 exit status 
make: *** [time] Error 1 

I know its a linker error, that is, the linker doesn't not know here to find 
this function. 
Doesn't this function belong to the standard gnu libc? 
Have anyone heard about "clock_gettime"? If someone knows how it is 
implemented, I'd appreciate so much. 

Thanks. 

--Message-Boundary-by-Mail-Sender-1124910534--

