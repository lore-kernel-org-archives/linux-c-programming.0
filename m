From: Bert Wesarg <bert.wesarg@googlemail.com>
Subject: Re: strstr and strchr
Date: Tue, 17 Feb 2009 12:58:36 +0100
Message-ID: <36ca99e90902170358m1e0fc809p1da7a1603185e005@mail.gmail.com>
References: <36ca99e90902170248y5ae1dc8heb5e4873429f3ae@mail.gmail.com>
	 <937267.9085.qm@web63401.mail.re1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=v3DL4GWuMgvFOnpNwRbJMgeqBTZtaab19IdullgGM18=;
        b=uvyY3Ec7O0I/hBL14oc6eBPl2B1QcPbbNBao6aU9V5d8PGeIQ7nfeCVh9eqbgiB5ao
         mvurWF0y3s5duBK1B4CXJNSoSECdIcPVKhs4dSVX2nht4dTsc7IRE+NUiMqWRv0ALNFA
         V+3Q45taEgKQ1MaUnkotDSJz0EWWbJB7NUYGw=
In-Reply-To: <937267.9085.qm@web63401.mail.re1.yahoo.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: fundu_1999@yahoo.com
Cc: linux-c-programming@vger.kernel.org

On Tue, Feb 17, 2009 at 12:52, Fundu <fundu_1999@yahoo.com> wrote:
> Bert,
> i did try that but got same response.
I'm not:

int
main(int ac, char *av[])
{
    char *str = "<Info firstName='sam' lastName='Smith' />";
    char *ptr = strchr(str, '\'');

    if (!ptr)
        return 1;

    printf("%s\n", str);
    printf("%*s^\n", (int)(ptr - str), "");

    return 0;
}

prints:

<Info firstName='sam' lastName='Smith' />
                ^
