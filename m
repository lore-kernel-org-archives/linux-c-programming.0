From: "Nate Jenkins" <nate@uniwest.com>
Subject: Re: "double free or corruption" - how to solve this?
Date: Fri, 12 May 2006 14:06:52 -0700
Message-ID: <002801c67607$fdc5dfd0$8001a8c0@NATE>
References: <75062f40605120111s2d27c8c0gb768c50b1ae34588@mail.gmail.com> <20060512101927.136dd5df@localhost.localdomain> <6a00c8d50605120145r3319e9c6hdb15c3630aeffadd@mail.gmail.com>
Reply-To: "Nate Jenkins" <nate@uniwest.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed	reply-type=response"
To: linux-c-programming@vger.kernel.org


>> Hello Shriramana,
>>
>>
>> On Fri, 12 May 2006 13:41:12 +0530 "Shriramana Sharma"=20
>> <samjnaa@gmail.com> wrote:
>>
>> > One of my programs, which was working quite well till now, suddenl=
y
>> > gives me the error:
>> >
>> > *** glibc detected *** double free or corruption (top): 0x0808a338=
 ***
>> > Aborted
>> >
>> > It is a pure C program compiled with GCC 4.02 -- I do not understa=
nd
>> > why it does not work suddenly. Please tell me what the above error=
 can
>> > be.
>>
>> Would be nice to run it from gdb, in order to get the backtrace when=
 it
>> crashes. This should help you understand where and why :).
>
> Additionally, you can try valgrind, which reports typical programming
> errors like calling free() twice on the same object.
>
> \Steve
> -

Steve,

I just saw that utility the other day.  It looks interesting.  How do y=
ou=20
typically use it?  or grindcall-grindval?  Do you know of a good tutori=
al=20
you could point me/us to?

TIA,

N8=E2=84=A2


-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
