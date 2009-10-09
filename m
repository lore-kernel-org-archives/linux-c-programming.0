From: SriKrishna Erra <erra_krishna@yahoo.co.in>
Subject: Reading UTF16 input from STDIN using fgetws()
Date: Fri, 9 Oct 2009 08:12:58 -0700 (PDT)
Message-ID: <25822791.post@talk.nabble.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org


Hi all,
I am trying to read UTF16 input from STDIN using fgetws() on LINUX.

man pages of fgetws() says,
fgetws() converts the input string from the encoding either specified by
"LC_CTYPE" or specified in fopen() to wide character string.

My intention is to read UTF16 input from STDIN not from a file. For this i
will not use any fopen() because  the input is direct from STDIN. 

So i will use direct "STDIN" in fgetws() like
fgetws(buf,count,stdin);

As deault LC_CTYPE value is "utf-8" on linux (also on all unix flavours),
fgetws() is treating the input as utf-8 and trying to convert to a wide
character string.

My input contains UTF16 strings and it has "0xfeff" BOM as first character.
As fgetws() treating the input is in utf-8, 0xfe(first byte of BOM) will be
an invalid sequence in utf-8 and also 0xff (second byte of BOM) is an EOF.
So fgetws() is returning nothing.

If i use fopen() then there will be no issues because i will pass the input
ecnoding as parameter to fopen() like  fopen("filename","r,ccs=UTF16-LE");

With this fgetws() will treat the input as UTF16 and will convert the input
from UTF16 to a wide character string.

So no issues with fopen().

But my requirement is input from STDIN.

Please let me know how to set the encoding "ccs=UTF-16LE" to STDIN so that
fgetws() will consider the STDIN input in UTF16 form.

I have also tried fdopen() but no use. 
fdopen(int fd,mode);

There is a requirement that the mode parameter vaues in fdopen() should be
the same as of the one used in fopen().

But we are not at all using fopen() and the default encoding of STDIN is
utf-8. 
So when fdopen(fd,"ccs=utf-16le"); is used, it returns nothing as there is a
mismatch in encodings i.e defualt of STDIN is utf-8 and fdopen is passing
utf-16LE.

So please let me know how to change the encoding of STDIN i.e how to set
encoding "ccs=UTF-16LE" to STDIN 

In windows, we hava _setmode() but in LINUX no such provision because LINUX
will treat text & Binary files as same.

Thanks in Advance.

regards,
Srikrishna Erra.
-- 
View this message in context: http://www.nabble.com/Reading-UTF16-input-from-STDIN-using-fgetws%28%29-tp25822791p25822791.html
Sent from the linux-c-programming mailing list archive at Nabble.com.

