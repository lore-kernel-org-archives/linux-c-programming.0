From: Steve Graegert <graegerts@gmail.com>
Subject: Re: How does one get the description of an errno value
Date: Sun, 15 Mar 2009 12:20:44 +0100
Message-ID: <6a00c8d50903150420ke10afcfs7c78a11355c5957a@mail.gmail.com>
References: <gpim9l$dia$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=7lSc0UnbdrJaETTZ/wuFoQG+DUxNE+2x/A6TEz5csdQ=;
        b=mbQKLdNP/5qGy1FHw9ME1fWddZxETJ5dv9hG6F9rRYuuZ8rW4lhRRCw6WksBPuUXu8
         UuE4klYF38QFR4yr3WND46h+WYurlVYuLzzD8QA3djaNZgu/r1TKopPJvXHc246mbxLf
         S+Trup/+Vam46DvMGVqgZzeEeTw2K7pzQLX+Y=
In-Reply-To: <gpim9l$dia$1@ger.gmane.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Angel Tsankov <fn42551@fmi.uni-sofia.bg>
Cc: linux-c-programming@vger.kernel.org

Angel,

The following code snippet should do it.  It basically sets errno
manually and outputs the associated error message.

--- BEGIN ---

#define _ALL_SOURCE

#include <stdio.h>
#include <errno.h> /* for _MAX_ERRNO */

int main(void) {
	int i;
	extern int errno;
=09
	for (i =3D 0; i < MAX_ERRNO; i++) {
		fprintf(stderr, "%3d", i);
		errno =3D i;
		perror(" ");
	}
=09
	return (0);
}

--- END ---

	\Steve

--

Steve Graegert
www.graegert.com



On Sun, Mar 15, 2009 at 11:46 AM, Angel Tsankov
<fn42551@fmi.uni-sofia.bg> wrote:
> Hello,
>
> Is there a function which returns the description of an errno value a=
nd, if
> so, which is it?
>
> Regards,
> Angel Tsankov
>
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
