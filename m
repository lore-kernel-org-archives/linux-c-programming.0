From: mspiegelmock@gmail.com
Subject: Re: Show application performance/errors from pseudo file
Date: Thu, 16 Oct 2014 13:00:43 -0700
Message-ID: <881A5814-FF80-438E-98AD-30B709DB08D8@gmail.com>
References: <5440216C.3010207@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=content-type:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references;
        bh=t6o3k/sOAld4KVXT6swKxfJCz+NW0I3GrKXmQkS+nEA=;
        b=RxoGsWCf//gWvf+Tg8u9tH0Rn3WE7g+5e+W3d0g21VPDI50jaU6yFQ59VYZCKpRmAn
         yvrf5DAk0RXwGX7DYKD0ak2dlljdkt1ihAy/cU+p0EaRjWAtkDSBaGba+Q2+ALKoWqxF
         kXt1I1d/oFUAt8iWmoA5IgUL01oaOVGBTWK0oty0Xn0rovTz0egaXmKtmhDjavgiTpqX
         X4xAqT6eD3lEklGCDrdEBlw975AQZDdKF4dbtB216lSkbf07DfjFnXEerDSeDRZUK9p2
         fk2DT6iHhcH+E3Yr4nT46uaEPeilKFgQ4DJrSkgqPzC+zQ0dpm/JgkShh0elyrUbmsP9
         peXw==
In-Reply-To: <5440216C.3010207@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: 
Cc: linux-c-programming@vger.kernel.org

I=92m no expert but I believe you=92d need a kernel module to create th=
e char device, then have your application talk to it somehow?
http://stackoverflow.com/questions/5970595/create-a-device-node-in-code

On Oct 16, 2014, at 12:50 PM, Daniel Hilst Selli <danielhilst@gmail.com=
> wrote:

> I'm writing a new application and would be nice to have a pseudo file=
 showing its status, just the way that procfs does with kernel.
> I'm looking for sugestions, I want to `cat' files contents and have s=
omething similar to /proc/meminfo
>=20
> First I think using named pipes, but, AFAIK, pipes would retain data =
writed until someone read it, what I thought is a kind of read
> hook that only show data when asked for. Here are a few requisites,
>=20
> - Don't retain data
> - Don't generate disk I/O
> - Vanish when application stops
> - Work with a simple cat or something similar..
>=20
> With that in mind I think about using unix domain sockets.. it seems =
to fit all requisites, for
> the fourth requisite I could use netcat, that is almost cat,
>=20
> Cheers
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
