From: rinku rathore <rinku_ques@yahoo.com>
Subject: Re: corrected:what is fcntl function
Date: Mon, 4 Oct 2004 04:33:52 -0700 (PDT)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20041004113352.23628.qmail@web53008.mail.yahoo.com>
References: <cjra7o$4qb$1@sea.gmane.org>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <cjra7o$4qb$1@sea.gmane.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Suciu Flavius <suciuflavius@tiscali.de>, Vger Kernel <linux-c-programming@vger.kernel.org>

hello,

fcntl (fd, F_SETFL, fcntl (fd, F_GETFL, NULL) |
 O_ASYNC));
 
 when somebody are reading / writing or delete your
 file, the operating 
 system will generate a SIGNAL to your program
 (default is SIGIO )
basically fcntl handle the file descriptor that means
when system generate a Signal SIGIO it is handled by
that fd(file descriptor),passed as first argument can
I get more information about O_ASYNC

--- Suciu Flavius <suciuflavius@tiscali.de> wrote:

> fcntl (fd, F_SETOWN, getpid());
> 
> the user of the program will became the owner of the
> opened file
> 
> fcntl (fd, F_SETFL, fcntl (fd, F_GETFL, NULL) |
> O_ASYNC));
> 
> when somebody are reading / writing or delete your
> file, the operating 
> system will generate a SIGNAL to your program
> (default is SIGIO )
> 
> check man 2 fcntl for more detailed explanation.
> 
> 
> rinku rathore wrote:
> > Hello,
> > Actually,I wanted specifically about the following
> > fcntl functions,listed below,here fd is file
> > descriptor
> > 
> > fcntl (fd, F_SETOWN, getpid());
> > 
> > fcntl (fd, F_SETFL,fcntl (fd, F_GETFL, NULL) |
> > O_ASYNC));
> > 
> > Rinku
> > 
> > 
> > 		
> > 
> > 
> > 		
> > __________________________________
> > Do you Yahoo!?
> > Yahoo! Mail is new and improved - Check it out!
> > http://promotions.yahoo.com/new_mail
> > -
> > To unsubscribe from this list: send the line
> "unsubscribe linux-c-programming" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at 
> http://vger.kernel.org/majordomo-info.html
> > 
> 
> -
> To unsubscribe from this list: send the line
> "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at 
> http://vger.kernel.org/majordomo-info.html
> 



		
_______________________________
Do you Yahoo!?
Declare Yourself - Register online to vote today!
http://vote.yahoo.com
