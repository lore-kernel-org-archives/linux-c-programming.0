From: Eric Bambach <eric@cisu.net>
Subject: FIFO question
Date: Thu, 6 Jan 2005 06:27:28 -0600
Message-ID: <200501060627.28270.eric@cisu.net>
Reply-To: eric@cisu.net
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: linux-c-programming@vger.kernel.org

Hello,
=20
 This is the first time I am using named pipes. I have a process with t=
his C++=20
code that creates a named pipe and loops on writing the character "2" t=
o it.

stringstream ssbuffer;
string buffer;
int pipeFD;

while (true){
    pipeFD =3D open("my_pipe", O_WRONLY);
    ssbuffer << 2;
    buffer =3D ssbuffer.str();
    write( pipeFD, buffer.c_str(), 1 );
    close(pipeFD);
  }

 It happily sits on the pipe. When I open up another console and type "=
cat=20
my_pipe" it prints an arbitrary number of 2s. Usually many tens of them=
=2E From=20
what I read I thought that when I close the pipe using the close() call=
 then=20
the readers will quit. Furthermore the main program doesnt receive a br=
oken=20
pipe after the reader quits like it should. This is test code and I wan=
t just=20
ONE "2" to be read by cat. Perhaps I am missing something simple? Can a=
nyone=20
enlighten me?

I plan to have only one reader and one writer on the pipe at a time so=20
synchronization is not neccesary.

I have also tried nanosleeping after the close. It seems sleep(1) fixes=
 the=20
problem, but the main program still doesnt get a broken pipe after cat =
exits=20
and this causes an unacceptable and unpredicate delay before the start =
of the=20
read.

=46uthermore I have also tried writing a very simple read program that =
tries to=20
read 10 bytes from the FIFO. It succeeds and actually gets 10 bytes fro=
m the=20
=46IFO! Shouldnt the read be short because the main program called clos=
e after=20
1 byte?

----------------------------------------
--EB

> All is fine except that I can reliably "oops" it simply by trying to =
read
> from /proc/apm (e.g. cat /proc/apm).
> oops output and ksymoops-2.3.4 output is attached.
> Is there anything else I can contribute?

The latitude and longtitude of the bios writers current position, and
a ballistic missile.

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0--Alan Cox LKML-December 08,2000=20

----------------------------------------
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
