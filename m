From: "Vineet Joglekar" <vintya@excite.com>
Subject: Re: Problem in accessing executable files
Date: Mon,  7 Feb 2005 21:33:26 -0500 (EST)
Message-ID: <20050208023326.4D8A5109EF7@xprdmailfe1.nwk.excite.com>
Reply-To: vintya@excite.com
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: glynn@gclements.plus.com
Cc: linux-c-programming@vger.kernel.org




Hi Glynn,



Thanks a lot for the reply. I will try that too.



I forgot to mention 1 thing, that I had put printk() in the do_generic_file_read function to see if it is getting executed, and I saw the printed message for executables too. Thats why I assumed that these functions do get executed while accessing executable files. Is it someting like other mmap functions get executed before calling regular read?



Thanks and regards,



Vineet 



 --- On Mon 02/07, Glynn Clements < glynn@gclements.plus.com > wrote:

From: Glynn Clements [mailto: glynn@gclements.plus.com]

To: vintya@excite.com

     Cc: jtwilliams@vt.edu, linux-c-programming@vger.kernel.org

Date: Mon, 7 Feb 2005 18:31:24 +0000

Subject: Re: Problem in accessing executable files



<br>Vineet Joglekar wrote:<br><br>> Thanks for suggesting the single / few bytes encryption test. I tried<br>> doing that, but in vain. Maybe I am going wrong somewhere else.<br><br>I'm pretty sure that mmap'ed access doesn't go through<br>do_generic_file_read().<br><br>Executable files (programs and shared libraries) are normally mmap'ed<br>rather than read, which would explain why you have problems with<br>executable files.<br><br>Try writing a test program which reads the contents of a file using<br>mmap() rather than read(). If my assumption is correct, the decryption<br>code will be bypassed, so you will get the encrypted data.<br><br>-- <br>Glynn Clements <glynn@gclements.plus.com><br>

_______________________________________________
Join Excite! - http://www.excite.com
The most personalized portal on the Web!
