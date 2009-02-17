From: Fundu <fundu_1999@yahoo.com>
Subject: strstr and strchr
Date: Tue, 17 Feb 2009 00:30:51 -0800 (PST)
Message-ID: <550170.9890.qm@web63402.mail.re1.yahoo.com>
Reply-To: fundu_1999@yahoo.com
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

looks strange to me 
if i look for a str using strstr it gives me the starting index of the string. so let say if i'm looking for "firstName" in "<Info firstName=\"sam\" lastName=\"Smith\" />" using 
strstr(ptr, "firstName");  i would get the pointer pointing to the f in firstName.


whereas if i use strchr and using a slight variation of the string mentioned above(suing ' instead of ")  "<Info firstName='sam' lastName='Smith'/>" 
strchr(ptr, "'") returns a pointer pointing after the ' 
so a printf("[%s]\n", strchr(ptr, "'"));
would print [  lastName='Smith'/>]  

which doesn't make sense to me.

can someone shed some light. TIA !


      
