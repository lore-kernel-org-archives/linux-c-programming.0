From: Suciu Flavius <suciuflavius@tiscali.de>
Subject: Re: corrected:what is fcntl function
Date: Mon, 04 Oct 2004 13:06:11 -0700
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <cjra7o$4qb$1@sea.gmane.org>
References: <20041004083839.61843.qmail@web53008.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20041004083839.61843.qmail@web53008.mail.yahoo.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

fcntl (fd, F_SETOWN, getpid());

the user of the program will became the owner of the opened file

fcntl (fd, F_SETFL, fcntl (fd, F_GETFL, NULL) | O_ASYNC));

when somebody are reading / writing or delete your file, the operating 
system will generate a SIGNAL to your program (default is SIGIO )

check man 2 fcntl for more detailed explanation.


rinku rathore wrote:
> Hello,
> Actually,I wanted specifically about the following
> fcntl functions,listed below,here fd is file
> descriptor
> 
> fcntl (fd, F_SETOWN, getpid());
> 
> fcntl (fd, F_SETFL,fcntl (fd, F_GETFL, NULL) |
> O_ASYNC));
> 
> Rinku
> 
> 
> 		
> 
> 
> 		
> __________________________________
> Do you Yahoo!?
> Yahoo! Mail is new and improved - Check it out!
> http://promotions.yahoo.com/new_mail
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

