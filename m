From: Eric Bambach <eric@cisu.net>
Subject: Re: strace write/read output
Date: Tue, 22 Mar 2005 20:17:21 -0600
Message-ID: <200503222017.21879.eric@cisu.net>
References: <Pine.LNX.4.58.0503221104060.30671@ns.isi.ulatina.ac.cr> <200503221305.32606.eric@cisu.net> <Pine.LNX.4.58.0503221215250.31636@ns.isi.ulatina.ac.cr>
Reply-To: eric@cisu.net
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
In-Reply-To: <Pine.LNX.4.58.0503221215250.31636@ns.isi.ulatina.ac.cr>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux prg <linux-c-programming@vger.kernel.org>

(forgot to cc the list)

On Tuesday 22 March 2005 12:16 pm, you wrote:
> > On Tuesday 22 March 2005 11:05 am, Fabio Miranda Hamburger wrote:
> > > hello,
> > >
> > > I am debugging a tcpip app on linux, I would like to use strace t=
o show
> > > me *all* the data passed to read() and write() function to the so=
ckets
> > > stream.
> > >
> > > thanks,
> >
> >       Does strace with the -e option do what you want? man strace. =
It
> > seems to do read and write. Prepare for big logfiles ;)
>
> I was trying to figure out how to do it. Can you provide an example?
> Usually strace shows few characters and at the end, the total length =
of
> what was received. Well, I need the entire string of characters.

Here is a quick and dirty example on a small text file. Notice I dont k=
now=20
what fd's cat uses so I just guessed 1-5. Below is the output of the ex=
ample=20
too. It outputs the ENTIRE file that was read in hex and ascii you just=
 have=20
to know what file desciptors you want to trace. To trace write calls th=
is way=20
just change -e read=3D1,2,3,4,5 to -e write=3D1,2,3,4,5 or you could ev=
en use=20
them together.

command:
strace -e read=3D1,2,3,4,5 -o file.log cat unison.log

Outputs this to file.log (truncated for sake of the mailer and example)=
:

read(3, "Fatal error: Lost connection wit"..., 131072) =3D 270
46 61 74 61 6c 20 65 72  72 6f 72 3a 20 4c 6f 73  Fatal er ror: Los |
74 20 63 6f 6e 6e 65 63  74 69 6f 6e 20 77 69 74  t connec tion wit |
68 20 74 68 65 20 73 65  72 76 65 72 0a 46 61 74  h the se rver.Fat |
61 6c 20 65 72 72 6f 72  3a 20 4c 6f 73 74 20 63  al error : Lost c |
6f 6e 6e 65 63 74 69 6f  6e 20 77 69 74 68 20 74  onnectio n with t |
68 65 20 73 65 72 76 65  72 0a 46 61 74 61 6c 20  he serve r.Fatal  |
65 72 72 6f 72 3a 20 4c  6f 73 74 20 63 6f 6e 6e  error: L ost conn |
65 63 74 69 6f 6e 20 77  69 74 68 20 74 68 65 20  ection w ith the  |
73 65 72 76 65 72 0a 46  61 74 61 6c 20 65 72 72  server.F atal err |
6f 72 3a 20 4c 6f 73 74  20 63 6f 6e 6e 65 63 74  or: Lost  connect |
69 6f 6e 20 77 69 74 68  20 74 68 65 20 73 65 72  ion with  the ser |
76 65 72 0a 46 61 74 61  6c 20 65 72 72 6f 72 3a  ver.Fata l error: |
20 4c 6f 73 74 20 63 6f  6e 6e 65 63 74 69 6f 6e   Lost co nnection |
20 77 69 74 68 20 74 68  65 20 73 65 72 76 65 72   with th e server |
0a 46 61 74 61 6c 20 65  72 72 6f 72 3a 20 4c 6f  .Fatal e rror: Lo |
73 74 20 63 6f 6e 6e 65  63 74 69 6f 6e 20 77 69  st conne ction wi |
 74 68 20 74 68 65 20 73  65 72 76 65 72 0a        th the s erver.   |

--=20
----------------------------------------
--EB

> All is fine except that I can reliably "oops" it simply by trying to =
read
> from /proc/apm (e.g. cat /proc/apm).
> oops output and ksymoops-2.3.4 output is attached.
> Is there anything else I can contribute?

The latitude and longtitude of the bios writers current position, and
a ballistic missile.

=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0--Alan Cox LKML-Decembe=
r 08,2000=20

----------------------------------------
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
