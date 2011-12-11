From: Jesse Ruffin <jesse@adminpaste.com>
Subject: Re: program icon
Date: Sun, 11 Dec 2011 05:19:36 -0500
Message-ID: <4EE483B8.6070807@adminpaste.com>
References: <jc1oua$sdn$1@dough.gmane.org> <CAAwP0s31Ccx=jhmq3Y0NQehHA5gHOh5WAbdRNdOHfSRedbON4Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=adminpaste.com;
	s=2011; t=1323598794;
	bh=LZ07P/K3Q8g8V+dF12i2ChjAqZP72T0rViGb8ekSAe4=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:References:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	b=eGpwKGCdHiuDY3K4PEqwMUgWP4fdXULbf8SDJkxjKs9UrugkS4+FBZDrL5Ht0Wm4e
	 fmOn4zXxCa07zkUQmfBc38IJGmvR2QRQFmMLGnRjNkyhkIPu5Yt/3k7rP3ui5z6PDG
	 OShMacvKA4VQP2rWjdvpNkKG93Wcu5lpRjehDXDp7x+6e9yj/WJ2MZKqA1KUMND2Yn
	 SZ/ef/FU3M7j8YHjCs4QdMDBoOLno5Rkc9xz+eiM+EAuxJTJdOIJ/SYVV4WRS4AEAG
	 bSolwk0NnPqOjiX6Kg5xvXTVAwUjJ7XPrzH/qGu0WQmA5DXdM4rUVz+qoCJ616OgKe
	 mJn7EtDlCVeyA==
In-Reply-To: <CAAwP0s31Ccx=jhmq3Y0NQehHA5gHOh5WAbdRNdOHfSRedbON4Q@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Javier Martinez Canillas <martinez.javier@gmail.com>
Cc: Krzysztof <kj@limes.com.pl>, linux-c-programming@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

The standard for desktop entries, including associated icons:

http://standards.freedesktop.org/desktop-entry-spec/latest/

On 12/11/2011 03:57, Javier Martinez Canillas wrote:
> On Sun, Dec 11, 2011 at 9:17 AM, Krzysztof <kj@limes.com.pl>
> wrote:
>> How to set the program icon to be showed e.g. on GUI desktop?
>> 
>> -- Regards Krzysztof J.
>> 
>> 
> 
> Not sure if I understand your question, but if what you want is to 
> have an application launcher with an icon in your desktop. You have
> to create an .desktop file an copy it to ~/Desktop/. For example 
> app.desktop could be:
> 
> #!/usr/bin/env xdg-open
> 
> [Desktop Entry] Version=1.0 Type=Application Terminal=false 
> Exec=/usr/local/myapp/bin/myapp Name=MyApp 
> Icon=//usr/local/myapp/img.png
> 
> Hope it helps,
> 
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (MingW32)

iQIcBAEBAgAGBQJO5IO4AAoJEO7eCtQ2Ge2pHSkP+gMEBhUUnfX5JBwWC7biUwC4
DrTLlcEu+bB6HUivkDUp04XEICbv43C/bQlx5QwW05T7Gvdg+Zdw1QSwLwRZ+J/A
t9voEnlx+hOdMm+rTWNiudB0j584oIgb4oo2zHXH7enrWW5SYOyEPBRu1fTpwA73
SZiEj1grlRsu3TrgxNNNK3NfhVBo++/+hijDoVUjOIaPVDXsYtWDEu2VYRHYHuEv
zzomQCF0Kt7jiE71Qnb+BcXTFxHOfUZqipj46WdW+j34SRZo1kE2iOhnF+Uu39wL
OI0uRdqWl+LJSysEXdOgSCKaEQ/DH/UCG4BcpnK2koLPBCdzyGrZ+/thrcBCE9ei
+ziUvP8QqrGLP5dIWlDonfKmHnUTLkGahEWeG5PyMnt804oZhP3HqdkWAFjvWoJh
iNllY3rvtwaC63ttBPV5bOxJrW0fEYWKd3e+Q7ikn0tfmu9bJjCCmZ0OMXWxakoL
c70YvVs2zUMF0d4Ps4CvXts30+P4zK3trzkmJ6//dG/sBZz3oX8hCQAk5QgvcDqk
RZ2LNXCvmaI3Gq1gbO6xlDrZsvMFP5/E3FsiNyTcfxO1c+0SvGs9bojDtq0/XiyO
XizZV3RR9gTons45Skc99ySCb2TKRUyoS4iqQdCamY4KXPYvx4rSleNCDvK1nWWv
7oLGoS8OYR2An/FrkRDf
=5FLk
-----END PGP SIGNATURE-----
