From: "Huber, George K CECOM RDEC STCD SRI" <George.K.Huber@us.army.mil>
Subject: RE: A exploitable C program
Date: Fri, 12 Jul 2002 10:49:38 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <DDFD9B60F648D411AD670000F80822EA03FCA961@mail7.monmouth.army.mil>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'ashtrax' <xlp@emtel.net.co>, linux-c-programming@vger.kernel.org

You might want to check out the following two books,

(1) Writing Secure Code
    Michael Howard, Davbid Leblanc
    ISBN: 0735615888
    published Nov 2001.

(2) Building Secure Software: How to Avoid Security Problems the Right Way
    John Viega, Gary McGraw
    ISBN: 020172152X
    published Oct 2001.

Both have extensive sections on buffer overflows (how to manipulate
them and how to fix/prevent them).  The first book focuses on Microsoft
technologies (MS VC++, Visual Basic, C#), but the concepts should be
widely applicable.  The second book is more general. 


George Huber
Computer Scientist
SRI, International
phone: 732-427-8064
fax    : 732-427-2065
cell   : 732-740-4018
george.huber@mail1.monmouth.army.mil

George Huber
Computer Scientist
SRI, International
phone: 732-427-8064
fax    : 732-427-2065
cell   : 732-740-4018
george.huber@mail1.monmouth.army.mil


-----Original Message-----
From: ashtrax [mailto:xlp@emtel.net.co]
Sent: Friday, July 12, 2002 12:34 AM
To: linux-c-programming@vger.kernel.org
Subject: A exploitable C program


Hi, I keep trying to understand buffer overflow, I would like you help me
finding a exploitable C program, not so complex, that demands me a serious
and deep analysis of how find shellcode, elf disamble and other process I
already ignore.
I want to have the ability of release proof of concept exploit and
understand credentials, setiud root and all secure programming topics.
What program do you suggest for have a good start?

bye.
p.s. Why I cant 'get' with majordomo all the list archives? (get
linux-c-programming <date>)



-
To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
