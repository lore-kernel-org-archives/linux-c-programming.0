From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: class Q_CORE_EXPORT QFlag
Date: Fri, 4 May 2007 14:04:04 +0200
Message-ID: <6a00c8d50705040504p4fadca4vd62b074c2696c7e6@mail.gmail.com>
References: <46372A8E.5090201@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        b=C88sB4VJl01sNSj0kWG6pIXt8KT2TnJyx3Zh86hH4Vz1d9hqR2RwNR/0qBAZO1/2KlMlnJYOzAu/KiwmfiI5ZqnQpcLb+/8xq8EX17S3OHqqrtCXZh+HWTvMtmeCP+Vy/9gYrt0a3yjXPmfPQgzEX/i/sNPsKoOU0/uWRe2HuYI=
In-Reply-To: <46372A8E.5090201@gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>

On 5/1/07, Shriramana Sharma <samjnaa@gmail.com> wrote:
> I see many usages in the Qt sources like:
>
> class Q_CORE_EXPORT QFlag
> {
>         <blah blah blah>
> } ;
>
> Isn't the word immediately next to the keyword class supposed to be t=
he
> class name? Q_CORE_EXPORT etc are certainly not class names. What are
> they and how are they allowed in between the word class and the class=
 name?
>
> I searched my "Thinking in C++" for this but did not turn up an answe=
r.
> Please help.

It's a macro that expands with different results depending on the
platform and/or context.  For example when building Qt applications on
a Windows machine, it's redefined to Q_DECL_EXPORT which, in this
case, expands to __declspec(dllexport).  See
/src/corelib/global/qglobal.h in the Qt source tree.

	\Steve

--

Steve Gr=E4gert <steve@graegert.com>
Jabber    xmpp://graegerts@jabber.org
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
