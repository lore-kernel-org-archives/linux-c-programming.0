From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: sequence of steps that goes from compilation to execution
Date: Wed, 18 Aug 2004 14:10:58 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040818121058.GG16935@lug-owl.de>
References: <55ee29e004081712346075d5b4@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CUR78EuMd8EhT3+C"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <55ee29e004081712346075d5b4@mail.gmail.com>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--CUR78EuMd8EhT3+C
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, 2004-08-18 01:04:51 +0530, Sudheer Vutukuru <sudheer.vutukuru@gmail=
=2Ecom>
wrote in message <55ee29e004081712346075d5b4@mail.gmail.com>:
> Hi all,
>=20
>     Why a program which is compiled on linux does not execute on windows.=
=2E=20
> (though the machine architecture is same)..

It's not enough that both operating system / game loader use the same
(or at least widely compatible) CPUs. Also, the whole ABI (Application
Binary Interface) and the backing file format need to be supported.

Linux uses the ELF format, while Windows uses something that's IIRC
called PEXEC (paged executable) format. That is, Windows doesn't simply
know where to load the binary to, how to initialize BSS and the like.
However, one can try to play some dirty tricks like Wine (running
Windows binaries on Linux) does. You do all the loading manually and
just start it. Upon access violations (and other things that would go
wrong), control is given back to Wine to emulate the missing parts.

>  Also   Can u please suggest me references or help me in knowing the
> details of what goes on, from compilation to execution (i.e how
> loading,linking libraries is done.. how addresses
> are known dynamically etc.. ).

C code gets translated to assembler, which is then compiled to object
code. (This format is already different on Windows vs. Linux.) The
object code then gets linked to the resulting final binary.

(The Linuxish view) upon startup of a dynamically linked ELF binary,
binfmt_elf.c starts the binary's "interpreter", which has to finally
(dynamically) link the binary. This is basically done by mmap()ing the
needed libraries and correcting all symbol references (so by now, the
program really knows about "printf").

After linking, control is transferred to the libc's startup function,
which will initialize the buffered IO subsystem (fprintf and friends),
call any constructor functions and (finally) jump to main(), your
program's user-visible start function.

After main() returns, control is given back to libc's shutdown functions
which may do some cleanups (like calling destructors, flushing buffers,
calling atexit functions and so on).

I guess it's quite similar on Windows, but a different file format is
used for binaries and libraries.

>  for string literals whether memory is allocated in heap or in code
> segment only..
> i.e char* ptr =3D "Hello World";
>   the ptr points into code segement or heap..

It points to a read-only data segment:)

Basically, it depends on where you define a variable and how/if you
initialize it at all where backing storage is taken from.

MfG, JBG

--=20
Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481             =
_ O _
"Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg  =
_ _ O
 fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Irak! =
  O O O
ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TCPA)=
);

--CUR78EuMd8EhT3+C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFBI0dSHb1edYOZ4bsRAkeaAJ9u+Z0ALN1vIHirawo0lJgx1Sl1FQCeI2xh
rVOeGpwWHF54SLZ4nx1ASxk=
=iCj0
-----END PGP SIGNATURE-----

--CUR78EuMd8EhT3+C--
