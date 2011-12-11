From: Javier Martinez Canillas <martinez.javier@gmail.com>
Subject: Re: program icon
Date: Sun, 11 Dec 2011 09:57:49 +0100
Message-ID: <CAAwP0s31Ccx=jhmq3Y0NQehHA5gHOh5WAbdRNdOHfSRedbON4Q@mail.gmail.com>
References: <jc1oua$sdn$1@dough.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=yUJ9DqiptmdWMlithIRBQaExPAZNl0Iecbvu9WIoTU0=;
        b=WKde7Z0bAfJYc88uarJGnM4/hOT7C5leWgYODEwhmgXEhl9xGLIyW9X/UQEfoRYXNV
         T5oYIiyY78AVpEb5bP4O+BDOjWT0UNGZwWJcIxIWLLbbFgKiFlje5lXHt00Dn+J1Cg8B
         hWA58Azr6ZBKRltmeYwynNSvRYWajZrbG3r5U=
In-Reply-To: <jc1oua$sdn$1@dough.gmane.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Krzysztof <kj@limes.com.pl>
Cc: linux-c-programming@vger.kernel.org

On Sun, Dec 11, 2011 at 9:17 AM, Krzysztof <kj@limes.com.pl> wrote:
> How to set the program icon to be showed e.g. on GUI desktop?
>
> --
> Regards
> Krzysztof J.
>
>

Not sure if I understand your question, but if what you want is to
have an application launcher with an icon in your desktop. You have to
create an .desktop file an copy it to ~/Desktop/. For example
app.desktop could be:

#!/usr/bin/env xdg-open

[Desktop Entry]
Version=3D1.0
Type=3DApplication
Terminal=3Dfalse
Exec=3D/usr/local/myapp/bin/myapp
Name=3DMyApp
Icon=3D//usr/local/myapp/img.png

Hope it helps,

--=20
Javier Mart=C3=ADnez Canillas
(+34) 682 39 81 69
Barcelona, Spain
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
