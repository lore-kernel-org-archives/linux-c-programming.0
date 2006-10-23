From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: execve-type memory-based function, possible?
Date: Mon, 23 Oct 2006 13:33:32 +0200
Message-ID: <6a00c8d50610230433t6f41b04dr13b57c0fd9e7cb99@mail.gmail.com>
References: <453C893E.9060901@devsoft.no> <453C975C.1010402@devsoft.no>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <453C975C.1010402@devsoft.no>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: "=?ISO-8859-1?Q?J=F8rgen_P._Tjern=F8?=" <jorgen@devsoft.no>
Cc: linux-c-programming@vger.kernel.org

On 10/23/06, "J=F8rgen P. Tjern=F8" <jorgen@devsoft.no> wrote:
> J=F8rgen P. Tjern=F8 wrote:
>  > [ .. a lot of stuff .. ]
>
> It might've been a bit unclear, so here goes:
>
> I'm thinking something like if you read the contents of the file
> "/bin/ls" into a buffer, and then want to execute that.
> Wouldn't that require that you allocate the memory, do relocation, se=
t
> the correct memory page protection (to execute for code, etc), etcete=
ra?

J=F8rgen,

(now I got it)  Looks like you'd want to implement some kind of
userland exec.  In this case the following archive will be useful:
http://www.graegert.com/code/ul_exec-v1.1.tar.gz.  Although quite
dated it illustrates basic concepts.

If you have questions about the code or the general approach, feel
free to contact me privately.

	\Steve

--

Steve Gr=E4gert <steve@graegert.com>
Jabber    xmpp://graegerts@jabber.org
Internet  http://eth0.graegert.com, http://blog.graegert.com
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
