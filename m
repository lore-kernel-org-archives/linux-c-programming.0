From: =?ISO-8859-1?Q?=22J=F8rgen_P=2E_Tjern=F8=22?= <jorgen@devsoft.no>
Subject: Re: execve-type memory-based function, possible?
Date: Mon, 23 Oct 2006 12:20:12 +0200
Message-ID: <453C975C.1010402@devsoft.no>
References: <453C893E.9060901@devsoft.no>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <453C893E.9060901@devsoft.no>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-c-programming@vger.kernel.org

J=F8rgen P. Tjern=F8 wrote:
 > [ .. a lot of stuff .. ]

It might've been a bit unclear, so here goes:

I'm thinking something like if you read the contents of the file=20
"/bin/ls" into a buffer, and then want to execute that.
Wouldn't that require that you allocate the memory, do relocation, set=20
the correct memory page protection (to execute for code, etc), etcetera=
?

--=20
Kindest regards / Med vennlig hilsen,
  J=F8rgen P. Tjern=F8
  <jorgen@devsoft.no>
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
