From: Bert Wesarg <bert.wesarg@googlemail.com>
Subject: Re: strstr and strchr
Date: Tue, 17 Feb 2009 11:48:44 +0100
Message-ID: <36ca99e90902170248y5ae1dc8heb5e4873429f3ae@mail.gmail.com>
References: <550170.9890.qm@web63402.mail.re1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=BKpnJ5KfhGRkWn45PbP4BMzS0jNn6PIIcPzgkTMcuAc=;
        b=eKd3X8MRizmZtPWhBirsMIWA4PCg9zmT3ZctiavnKBlHP2+Ks6KOGFvtxceA2YD89a
         aFpk3ddUXb4mV5ki8UEfoN0L/vBI9EVoepegmg/PeHbXysT9jDRpNbKjNUjsaKOBc7Vq
         xWcUFgC6pNxs7UxebvpysxXtf051xvQm47DSk=
In-Reply-To: <550170.9890.qm@web63402.mail.re1.yahoo.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: fundu_1999@yahoo.com
Cc: linux-c-programming@vger.kernel.org

On Tue, Feb 17, 2009 at 09:30, Fundu <fundu_1999@yahoo.com> wrote:
> looks strange to me
> if i look for a str using strstr it gives me the starting index of the string. so let say if i'm looking for "firstName" in "<Info firstName=\"sam\" lastName=\"Smith\" />" using
> strstr(ptr, "firstName");  i would get the pointer pointing to the f in firstName.
>
>
> whereas if i use strchr and using a slight variation of the string mentioned above(suing ' instead of ")  "<Info firstName='sam' lastName='Smith'/>"
> strchr(ptr, "'") returns a pointer pointing after the '
strchr() takes a int as second argument, not a 'char *', I suggest trying:

strchr(ptr, '\'')

> so a printf("[%s]\n", strchr(ptr, "'"));
> would print [  lastName='Smith'/>]
>
> which doesn't make sense to me.
>
> can someone shed some light. TIA !
