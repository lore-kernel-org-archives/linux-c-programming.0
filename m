From: Mihai RUSU <dizzy@roedu.net>
Subject: i18n questions
Date: Thu, 1 Apr 2004 13:43:31 +0300 (EEST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.58L0.0404011331350.11046@ahriman.bucharest.roedu.net>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hi

I am developer on a TCP network server project where the server sends some
text messages to clients which are displayed unmodified. I am curently
trying to find out the best way to support different language types
(please note that I have no control over the clients, they are binary only
comercial applications made by organizations with absolutly no relation to
me or my project) . I have read the man pages of gettext family functions.
However they dont seem to me very flexible. Because I can have clients
from different countries connecting to the same server (they send their
"locale"  identification data in the initial packets) I want to be able to
send korean messages to korean users, french messages to french users,
english to english ones etc. As I see it gettext uses the language set
with setlocale. I dont see it as a solution to call setlocale() before
translating every message to send depending on the clients locale. Do I
miss something about gettext ?

Other thing I want is to have the codes compatible with win32 too but I 
guess I can solve that easily by including a gettext lib with the project 
(I saw "gaim" does something like that too).

Another solution whould be to "make my own". For this I have thought to 
take advantage of the already included "CDB" codes in the project (based 
on some tinycdb release) and have "dictionary" files in CDB format, have 
my own translation function, so then Im not restricted to the locally set 
locale as I have read it is with gettext (I can have an API where I send 
the language to translate to in the translation function call). This also 
will automatically enabled me to support WIN32 too (if I wrote my codes 
portably of course ;)). The big disadvantage here whould be that having my 
own format for dictionary files I cannot take advantage of existent 
projects like KBabel to write such dictionary files. Anyone here has a 
pointer to some detalied explanation of the .po and .gpo files (I see in 
"gaim" that .gpo is some "compiled" form) ? Couse I might do some ".po to 
CDB" compiler and go with this solution :)

Thanks!

-- 
Mihai RUSU                                    Email: dizzy@roedu.net
GPG : http://dizzy.roedu.net/dizzy-gpg.txt    WWW: http://dizzy.roedu.net
                       "Linux is obsolete" -- AST
