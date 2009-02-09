From: ben <brouits@free.fr>
Subject: Re: wait for childs of a child process
Date: Mon, 09 Feb 2009 15:56:21 +0100
Message-ID: <49904415.2080606@free.fr>
References: <49903BBC.4010802@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <49903BBC.4010802@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-c-programming@vger.kernel.org

Gauvain Pocentek a =E9crit :
> Hello,
>=20
> I have to monitor applications on a system (users who run the applica=
tion, how
> long, etc.), but I'm having troubles with applications which fork dur=
ing startup
> (openoffice for instance).
>=20
> Here is a snippet of what I planned to use (checks omitted to simplif=
y):
>=20
> ####################################
> #include <stdio.h>
> #include <sys/wait.h>
> #include <sys/types.h>
>=20
> int main()
> {
>     int status;
>     pid_t p =3D fork();
>     if (p =3D=3D 0)
>         system ("soffice");
>     else if (p > 0)
>     {
>         waitpid (p, &status, 0);
>         printf ("done\n");
>     }
>=20
>     return 0;
> }
>=20
> ####################################
>=20
> Is there a way to make wait() or an other syscall monitor the process=
' children,
> or is patching openoffice (and other apps behaving in the same way) t=
he only
> solution?
>=20
> Thanks,
> Gauvain Pocentek

Would not be simpler to use Unix's pacct feature ?
It may not be enabled, though, on some linux distro.

- ben
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
