From: r_zaca <r_zaca@ig.com.br>
Subject: [Re] Linux source code malloc
Date: Thu, 6 Jan 2005 08:34:05 -0200
Message-ID: <20050106_103405_056621.r_zaca@ig.com.br>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="Message-Boundary-by-Mail-Sender-1105007645"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

--Message-Boundary-by-Mail-Sender-1105007645
Content-type: text/plain; charset=ISO-8859-1
Content-description: Mail message body
Content-transfer-encoding: 8bit
Content-disposition: inline

   Hi venkatesh 

   These two functions are part of glibc, so I suggest you look for  them in 
/usr/include directory. I think it is very difficult to find a file called 
malloc.c, but you can try. If you are using linux, try "man malloc" and you 
will see in what header file these functions are referenced in, and maybe 
you can trace where the source code of them are. 
   Good luck! 

Hi, 

Where can I see the implementation of free() and malloc() in Linux 
source code? I am not able to locate the file malloc.c. 

thanks, 
venkatesh 
- 
To unsubscribe from this list: send the line "unsubscribe 
linux-c-programming" in 
the body of a message to majordomo@vger.kernel.org 
More majordomo info at  http://vger.kernel.org/majordomo-info.html 

--Message-Boundary-by-Mail-Sender-1105007645--

