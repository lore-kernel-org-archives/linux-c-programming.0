From: =?iso-8859-1?Q?H=E5kon?= Hallingstad <hakon@ion.no>
Subject: Re: View hidden characters in a textfile
Date: Mon, 27 Jun 2005 22:19:23 +0200
Message-ID: <20050627201923.GA15257@hydrogen.ion.no>
References: <1492.196.40.85.4.1119901509.squirrel@www.crearium.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1492.196.40.85.4.1119901509.squirrel@www.crearium.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Linux C Programming <linux-c-programming@vger.kernel.org>

On Mon, Jun 27, 2005 at 12:45:09PM -0700, fabio@crearium.com wrote:
> Hello,
>=20
> Anyone know a tool (or c code) that allow a programmer to see hidden
> characters like "\n" or "\t" or "\r\n" ?
>=20
> The command cat, tr or sed can help manipulate this character to make=
 them
> visible but I wonder if there is a tool like a hex editor or somethin=
g
> that detailed show each character that a file contain.

hexl-mode in Emacs. It shows (e.g.) a newline '\n' as '0x0a'.

Regards,
H=E5kon Hallingstad
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
