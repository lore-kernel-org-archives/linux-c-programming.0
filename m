From: Ian Lance Taylor <iant@google.com>
Subject: Re: c inline assembly
Date: Sat, 18 Feb 2012 21:14:54 -0800
Message-ID: <mcrk43jwgj5.fsf@dhcp-172-18-216-180.mtv.corp.google.com>
References: <CAGZFCEEaJ7ZsNAmWCF-nDtsjs70U7fqEVvTXEaCt9Tmk1dcemQ@mail.gmail.com>	<CAGZFCEH_NWJQid+DgOGrDp0nAS6odH2fLamT1k-vWP1ceAiMzQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <gcc-help-return-49008-gcc-help=m.gmane.org@gcc.gnu.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed;
	d=gcc.gnu.org; s=default; x=1330233338; h=Comment:
	DomainKey-Signature:Received:Received:Received:Received:
	Received-SPF:Received:Received:Received:Received:From:To:Cc:
	Subject:References:Date:In-Reply-To:Message-ID:User-Agent:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Mailing-List:
	Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:
	List-Help:Sender:Delivered-To; bh=T4hOOiJxaVivUiyvmp2a/WdU5LU=;
	b=bA3FYnmi8S9W8kKFcsupTpCkeRWEBFCxm7ShETFTvjCFDqLbpe3YzuEeUBmGf2
	asTxNmVXPXcKCPI9QbEeehV24dtMVJtL1RZN0MRIGMZMsjGrgcmuAPlSgsaMG+kY
	1PaBWrx7zYhhyHjsHaVrEB0J2k6iFvarBc6kub7BU8BWI=
In-Reply-To: <CAGZFCEH_NWJQid+DgOGrDp0nAS6odH2fLamT1k-vWP1ceAiMzQ@mail.gmail.com>	(ratheesh kannoth's message of "Sat, 18 Feb 2012 11:31:12 +0530")
List-Id: <linux-c-programming.vger.kernel.org>
List-Unsubscribe: <mailto:gcc-help-unsubscribe-gcc-help=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc-help/>
List-Post: <mailto:gcc-help@gcc.gnu.org>
List-Help: <mailto:gcc-help-help@gcc.gnu.org>
Sender: gcc-help-owner@gcc.gnu.org
Content-Type: text/plain; charset="utf-8"
To: ratheesh kannoth <ratheesh.ksz@gmail.com>
Cc: linux-c-programming@vger.kernel.org, gcc-help@gcc.gnu.org

ratheesh kannoth <ratheesh.ksz@gmail.com> writes:

> This function is inline .=C2=A0 what all registers needs to pushed and
> poped in the inline assembly so that the functions wont
> disturb the registers in=C2=A0 the function ( in which it is C inlined=C2=
=A0 ).

Your asm statement should list the registers that it clobbers.

One i386 you normally can not clobber %ebp.  When compiling with
-fpic/-fPIC you normally can not clobber %ebx.

Ian
