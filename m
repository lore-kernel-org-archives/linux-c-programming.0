From: ben <brouits@free.fr>
Subject: Re: Unable set the priority for a pthread through pthread_setschedparam
Date: Wed, 04 Feb 2009 16:32:46 +0100
Message-ID: <4989B51E.8010009@free.fr>
References: <F5BA82141F7AA94885B9643C77EEA5F2103C73@mail.esntechnologies.co.in> <18824.62496.424541.675373@cerise.gclements.plus.com> <F5BA82141F7AA94885B9643C77EEA5F2103CF8@mail.esntechnologies.co.in>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <F5BA82141F7AA94885B9643C77EEA5F2103CF8@mail.esntechnologies.co.in>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-c-programming@vger.kernel.org

Srinivas G. a =E9crit :
> I have tried to set the RLIMIT_RTPRIO to 100 through
> /etc/security/limits.conf. It was not defined previously, so I have
> defined in the following way.
>=20
> domain       type    item     value
> #@srinivasg  soft    rtprio   100
you must uncomment the line (remove the #)
then, the given group will have a soft rtprio limit to 100.
This will work, assuming your PAM configuration uses pam_limits.

> After adding the above statement, I have restarted the system.
>=20
> Then, I run my simple thread program. There is no luck. I got the sam=
e
> error. I have posted the simple thread program in my first email.
>=20
> What am I missing here? Please advice.
>=20
> Thanks and Regards,
> Srinivas G
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
