From: "Markus Rechberger" <mrechberger@gmail.com>
Subject: Re: Compile error caused by case of filename extension
Date: Tue, 28 Mar 2006 08:26:01 +0200
Message-ID: <d9def9db0603272226n2ffe9584w5accc39647ca9833@mail.gmail.com>
References: <200603251333.50127.samjnaa@gmail.com>
	 <1143275731.18472.44.camel@avirat>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1143275731.18472.44.camel@avirat>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: B S Srinidhi <srinidhi-c@deeproot.co.in>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>

Hi,

don't use void main() functions.. use int main instead.
The c++ standard defines the return value of main being int, though
compiler also support void.
In general int should be better since other applications could check
for the return value if the application exited successfully or not..

Markus

On 3/25/06, B S Srinidhi <srinidhi-c@deeproot.co.in> wrote:
> Hi,
>
> On Sat, 2006-03-25 at 13:33 +0530, Shriramana Sharma wrote:
> [..]
> > $ gcc -o TESTING TESTING.C
> > /tmp/ccEnQk4o.o:(.eh_frame+0x11): undefined reference to
> > `__gxx_personality_v0'
> > collect2: ld returned 1 exit status
> >
> > But if I change the input file name extension to testing.c or even TESTING.c
> > (small letters) no problems were got. Why is this?
> >
>
> >From the man page of gcc(1):
>
> file.cc
> file.cp
> file.cxx
> file.cpp
> file.CPP
> file.c++
> file.C
>     C++ source code which must be preprocessed. Note that in .cxx, the
> last two letters must both be literally x.  Likewise, .C refers to a
> literal capital C.
>
> That means, gcc will consider a source file with name TESTING.C to be a
> C++ source code. Thus trying to include / link with some special
> libraries.
>
> To compile your TESTING.C, use something like:
>
> $ g++ -o TESTING TESTING.C
>
> It 'll compile correctly.
>
> Hope this helps.
>
> Srinidhi.
> --
> ASCII ribbon campaign ( )         B S Srinidhi
>  - against HTML email  X          http://srinidhi.deeproot.co.in
>              & vCards / \         DeepRoot Linux
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


--
Markus Rechberger
