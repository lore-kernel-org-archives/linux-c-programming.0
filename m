From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: quotactl
Date: Wed, 2 Jul 2003 22:45:09 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16131.21093.151750.179494@cerise.nosuchdomain.co.uk>
References: <Pine.LNX.4.44.0307021401270.20193-100000@gpu.utcc>
	<3F03225D.30601@fi.uba.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <3F03225D.30601@fi.uba.ar>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-c-programming@vger.kernel.org
Cc: Francis Lau <fkwlau@utcc.utoronto.ca>, =?ISO-8859-1?Q?Dar=EDo_Mariani?= <dmarian@fi.uba.ar>


Dar=EDo Mariani wrote:

>    If you did not recompile the kernel, it has quota support. Has the=
 FS=20
> you are quering been mounted with the usrquota option?

The mount(8) manpage says (in regard of ext2):

       grpquota / noquota / quota / usrquota
              These options are accepted but ignored.

Examination of the kernel source code (fs/ext2/super.c) confirms this:

		/* Silently ignore the quota options */
		else if (!strcmp (this_char, "grpquota")
		         || !strcmp (this_char, "noquota")
		         || !strcmp (this_char, "quota")
		         || !strcmp (this_char, "usrquota"))
			/* Don't do anything ;-) */ ;

Also, if quota support is disabled (i.e. "!defined(CONFIG_QUOTA)"),
quotactl() will fail with ENOSYS rather than EINVAL (at least in
2.4.x).

--=20
Glynn Clements <glynn.clements@virgin.net>
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
