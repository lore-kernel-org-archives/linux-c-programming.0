From: Bert Wesarg <bert.wesarg@googlemail.com>
Subject: Re: function instrumentation
Date: Fri, 27 Jan 2012 08:08:28 +0100
Message-ID: <CAKPyHN2pD88aFXsBOgmjiYJbPqjxZfRrm4kV7To6p=gt3QRzog@mail.gmail.com>
References: <CAGZFCEEzkEH9SQ3+C9uuCfbZhJW2QqOKP58=kVpjrfcjmhSi2w@mail.gmail.com>
	<CAGZFCEEzAe=Ypruw362puyoCPXnc5dcjUfqgRwNCBbArheMkkA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=faZZ8ia2mHQpuiU7us06TOYhCCMRbDXsnyJgcMiuPOE=;
        b=LST1k7CODhAiNXd6pYDoRo1+nKoEDptnq7XA87u/xQZSw112wXDd8WYOqYZnNVz3oP
         ULqG4s6NI5pgaic5shxp9PPh/b50WaRUVWYrE5jt/Gw8kKxBOuKElEWU46Xev785o+Ps
         RBqLMagS0/Ga5qmptiIUWdndPhAtnCRLLfC5M=
In-Reply-To: <CAGZFCEEzAe=Ypruw362puyoCPXnc5dcjUfqgRwNCBbArheMkkA@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: ratheesh kannoth <ratheesh.ksz@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On Thu, Jan 26, 2012 at 19:04, ratheesh kannoth <ratheesh.ksz@gmail.com=
> wrote:
> Hi,
>
> I would like to instrument cpp file using finstrument functions of gc=
c
> (4.4.3) =C2=A0. I
> have written all the files and build script.
> I noticed that =C2=A0- the moment i add =C2=A0 iostream header file i=
nto
> test.cpp file , the program segmentaion faults.
> What is the problem.

GCC also instruments inline functions, and iostream is probably full
of them. You could try to exclude them with the
-finstrument-functions-exclude-file-list=3D/usr/include flag.

Bert

>
> (gdb) r
> Starting program: /home/fox/project_profile/a.out
>
> Program received signal SIGSEGV, Segmentation fault.
> 0x00007ffff7b65bd1 in std::ostream::sentry::sentry(std::ostream&) ()
> from /usr/lib/libstdc++.so.6
> (gdb) bt
> #0 =C2=A00x00007ffff7b65bd1 in std::ostream::sentry::sentry(std::ostr=
eam&)
> () from /usr/lib/libstdc++.so.6
> #1 =C2=A00x00007ffff7b664b8 in std::basic_ostream<char,
> std::char_traits<char> >& std::__ostream_insert<char,
> std::char_traits<char> >(std::basic_ostream<char,
> std::char_traits<char> >&, char const*, long) () from
> /usr/lib/libstdc++.so.6
> #2 =C2=A00x00007ffff7b668bf in std::basic_ostream<char,
> std::char_traits<char> >& std::operator<< <std::char_traits<char>
>>(std::basic_ostream<char, std::char_traits<char> >&, char const*) ()
> from /usr/lib/libstdc++.so.6
> #3 =C2=A00x00000000004008cf in helloworld () at possol.cpp:5
> #4 =C2=A00x00000000004008a9 in __cyg_profile_func_enter (func=3D0x400=
9e2,
> caller=3D0x400ae6) at inst.cpp:13
> #5 =C2=A00x00000000004009f4 in global constructors keyed to main () a=
t test.cpp:7
> #6 =C2=A00x0000000000400ae6 in __do_global_ctors_aux ()
> #7 =C2=A00x000000000040072b in _init ()
> #8 =C2=A00x00007fffffffe398 in ?? ()
> #9 =C2=A00x0000000000400a75 in __libc_csu_init ()
> #10 0x00007ffff72cabe0 in __libc_start_main () from /lib/libc.so.6
> #11 0x00000000004007d9 in _start ()
>
>
>
>
>
>
>
>
>
> ********************************* =C2=A0inst.cpp
> *************************************
> #include <stdio.h>
> extern "C"
> {
> void __cyg_profile_func_enter (void *, void *)
> __attribute__((no_instrument_function));
> void __cyg_profile_func_exit (void *, void *)
> __attribute__((no_instrument_function));
> }
>
> int =C2=A0helloworld();
> void __cyg_profile_func_enter (void *func, =C2=A0void *caller)
> {
> =C2=A0 =C2=A0 helloworld() ;
> }
> void __cyg_profile_func_exit (void *func, void *caller)
> {
> }
>
>
>
>
> ************************** possol.cpp *******************************=
******
> #include <iostream>
> int =C2=A0 helloworld ()
> {
> =C2=A0std::cout << "hello " ;
> }
>
>
>
> ******************************** test.cpp
> ***************************************
>
> #inclde <iostream> =C2=A0 /// You can avoid the segmentation fault, i=
f u remove this.
> int main()
> {
> =C2=A0return 0;
> }
>
>
> ************************ build.sh *****************************
>
> set -x
> rm *.o
> g++ -g -c inst.cpp
> g++ -g -c possol.cpp
> g++ -g -c test.cpp =C2=A0-finstrument-functions
> g++ -g inst.o possol.o test.o
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.ht=
ml
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
