From: Steve Graegert <graegerts@gmail.com>
Subject: Re: How does one get the description of an errno value
Date: Sun, 15 Mar 2009 14:10:21 +0100
Message-ID: <6a00c8d50903150610i53825905n6e8a2512bd04d567@mail.gmail.com>
References: <gpim9l$dia$1@ger.gmane.org>
	 <6a00c8d50903150420ke10afcfs7c78a11355c5957a@mail.gmail.com>
	 <49BCDBBA.3000209@yahoo.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=M3gboxjldCALJJlnyB3yUDxzMiwuXZlKRfoJxq8+nNY=;
        b=wqD3+jo42SPNuxeWCVzVQzozLz4JvFyPP3qHzqyyNy+HESaAamDgJOnY/krhtu33fK
         7maaREIYgY24hgeCLgmbIPKjv5T3Hzw3yVZY28JOozYqVTqSMxmgDL32cO8YWsZu6QYj
         Pfd6gDzqXV3Qv10pN99ZH6p8BSPfqIeq/wQ9Q=
In-Reply-To: <49BCDBBA.3000209@yahoo.com.br>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Tiago Maluta <maluta_tiago@yahoo.com.br>
Cc: Angel Tsankov <fn42551@fmi.uni-sofia.bg>, linux-c-programming@vger.kernel.org

Tiago,

You're correct.  MAX_ERRNO is a custom macro being defined elsewhere
and actually expands to to sys_nerr.  I picked that code from some
examples I've prepared some years ago.  Sorry for the inconvenience
but I think you get the idea.  see perror(3) for more info.

	\Steve

--

Steve Graegert
www.graegert.com



On Sun, Mar 15, 2009 at 11:43 AM, Tiago Maluta
<maluta_tiago@yahoo.com.br> wrote:
> Steve,
>
>> The following code snippet should do it. =A0It basically sets errno
>> manually and outputs the associated error message.
>>
>> --- BEGIN ---
>>
>> #define _ALL_SOURCE
>>
>> #include <stdio.h>
>> #include <errno.h> /* for _MAX_ERRNO */
>>
>
> I've searched in headers on /usr/include for MAX_ERRNO but not found.
> Where MAX_ERRNO is defined?
>
> A *very* simple workaround was check for "Unknown" word, so I tried:
>
> int main(void) {
> =A0 =A0 =A0 =A0int i=3D0;
> =A0 =A0 =A0 =A0extern int errno;
> =A0 =A0 =A0 =A0char str[128];
>
> =A0 =A0 =A0 =A0while (strncmp(str,"Unknown",7)) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sprintf(str,"%s",strerror(i));
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fprintf(stderr, "%3d", i);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0errno =3D i;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0perror(" ");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0i++;
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0return (0);
> }
>
>
> But there is "Unknown" between valid error messages.
> I think there is a better way to do it....
>
>
> Best regards,
>
> --tm
>
>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
