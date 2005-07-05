From: Frederik Deweerdt <frederik.deweerdt@gmail.com>
Subject: Re: LKM function call on kernel function call?
Date: Tue, 5 Jul 2005 10:38:57 +0200
Message-ID: <20050705083857.GC19742@gilgamesh.home.res>
References: <1458d9610507050123124d6cb@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1458d9610507050123124d6cb@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: S <talk2sumit@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux prg <linux-c-programming@vger.kernel.org>

Le 05/07/05 16:23 +0800, S =E9crivit:
> I want function1() to be called, everytime the function
> ide_do_rw_disk() of ide-disk.c is called. I do not want to re-compile
> the complete kernel to do this.
>=20
You're looking for kprobes=20
http://www-106.ibm.com/developerworks/library/l-kprobes.html?ca=3Ddgr-l=
nxw07Kprobe
Regards,
=46rederik Deweerdt
--=20
o---------------------------------------------o
| http://open-news.net : l'info alternative   |
| Tech - Sciences - Politique - International |
o---------------------------------------------o
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
