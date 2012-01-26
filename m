From: ratheesh kannoth <ratheesh.ksz@gmail.com>
Subject: function instrumentation
Date: Thu, 26 Jan 2012 23:34:34 +0530
Message-ID: <CAGZFCEEzAe=Ypruw362puyoCPXnc5dcjUfqgRwNCBbArheMkkA@mail.gmail.com>
References: <CAGZFCEEzkEH9SQ3+C9uuCfbZhJW2QqOKP58=kVpjrfcjmhSi2w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=eRLD6oUOKB2y4uWMkQrwV4+4ZS87Ad4NbwnyTcozoJ4=;
        b=F7UcpgCf++yB5KYISC41qqY2+OOvqHRdfG7I8lCoBkGILphcrmoC7BPfe8GvA93+Gc
         8OaIPh8XSiSAOAH0JxObzWxnxtz517WkE264YRReubCqD0JgLaeHQznJUdgk9UN0JuYJ
         7mqr0zlX6xYvzVncHMTc+UT0ytmT5U+vyqu0Y=
In-Reply-To: <CAGZFCEEzkEH9SQ3+C9uuCfbZhJW2QqOKP58=kVpjrfcjmhSi2w@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-c-programming@vger.kernel.org

Hi,

I would like to instrument cpp file using finstrument functions of gcc
(4.4.3)  . I
have written all the files and build script.
I noticed that =A0- the moment i add =A0 iostream header file into
test.cpp file , the program segmentaion faults.
What is the problem.

(gdb) r
Starting program: /home/fox/project_profile/a.out

Program received signal SIGSEGV, Segmentation fault.
0x00007ffff7b65bd1 in std::ostream::sentry::sentry(std::ostream&) ()
from /usr/lib/libstdc++.so.6
(gdb) bt
#0 =A00x00007ffff7b65bd1 in std::ostream::sentry::sentry(std::ostream&)
() from /usr/lib/libstdc++.so.6
#1 =A00x00007ffff7b664b8 in std::basic_ostream<char,
std::char_traits<char> >& std::__ostream_insert<char,
std::char_traits<char> >(std::basic_ostream<char,
std::char_traits<char> >&, char const*, long) () from
/usr/lib/libstdc++.so.6
#2 =A00x00007ffff7b668bf in std::basic_ostream<char,
std::char_traits<char> >& std::operator<< <std::char_traits<char>
>(std::basic_ostream<char, std::char_traits<char> >&, char const*) ()
from /usr/lib/libstdc++.so.6
#3 =A00x00000000004008cf in helloworld () at possol.cpp:5
#4 =A00x00000000004008a9 in __cyg_profile_func_enter (func=3D0x4009e2,
caller=3D0x400ae6) at inst.cpp:13
#5 =A00x00000000004009f4 in global constructors keyed to main () at tes=
t.cpp:7
#6 =A00x0000000000400ae6 in __do_global_ctors_aux ()
#7 =A00x000000000040072b in _init ()
#8 =A00x00007fffffffe398 in ?? ()
#9 =A00x0000000000400a75 in __libc_csu_init ()
#10 0x00007ffff72cabe0 in __libc_start_main () from /lib/libc.so.6
#11 0x00000000004007d9 in _start ()









********************************* =A0inst.cpp
*************************************
#include <stdio.h>
extern "C"
{
void __cyg_profile_func_enter (void *, void *)
__attribute__((no_instrument_function));
void __cyg_profile_func_exit (void *, void *)
__attribute__((no_instrument_function));
}

int =A0helloworld();
void __cyg_profile_func_enter (void *func, =A0void *caller)
{
=A0 =A0 helloworld() ;
}
void __cyg_profile_func_exit (void *func, void *caller)
{
}




************************** possol.cpp *********************************=
****
#include <iostream>
int =A0 helloworld ()
{
=A0std::cout << "hello " ;
}



******************************** test.cpp
***************************************

#inclde <iostream> =A0 /// You can avoid the segmentation fault, if u r=
emove this.
int main()
{
=A0return 0;
}


************************ build.sh *****************************

set -x
rm *.o
g++ -g -c inst.cpp
g++ -g -c possol.cpp
g++ -g -c test.cpp =A0-finstrument-functions
g++ -g inst.o possol.o test.o
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
