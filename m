From: =?ISO-2022-JP?B?U3RldmUgR3JhZWdlcnQgKBskQiU5JUYlIyE8JVYbKEIp?= 
	<graegerts@gmail.com>
Subject: Re: c++ code - not getting compiled !!!!!!!!!
Date: Fri, 29 Jul 2011 08:40:22 +0200
Message-ID: <CALC0UTm2XrznifP=m63sibg931vmzrQP+8FVzvxYgqvTNrG7sA@mail.gmail.com>
References: <CAGZFCEFvwrbscViED2ZEC3Yh9p4EstTLkxxfQD8FJZS03OpsLw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=Li+6Hrv7lkOtn+qJMRHZXX23nHkxSwxhEasDPNoyfVg=;
        b=mM8Hq0M2KR1dHUL/ALpmgUiEDia6azKjQOwLA0yT5XZhtFaFIlXrreKJN6SOA0wRoC
         2ayBIr1iXAiw+s7Enzed41wS7ZQWGrsRVvCJ1YvJm+4S3LTsPjzjWvT/DuIeydH/0KzI
         9bazIp1vKqW5VVbTJRe0hHqGmP2gAsTUrCH9Y=
In-Reply-To: <CAGZFCEFvwrbscViED2ZEC3Yh9p4EstTLkxxfQD8FJZS03OpsLw@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-2022-jp"
To: ratheesh kannoth <ratheesh.ksz@gmail.com>
Cc: linux-c-programming@vger.kernel.org

According to the C++ standard (6.7) you are allowed to jump past a declaration:

"It is possible to transfer into a block, but not in a way that
bypasses declarations with initialization. A program that jumps from a
point where a local variable with automatic storage duration is not in
scope to a point where it is in scope is ill-formed unless the
variable has POD type and is declared without an initializer."

    \Steve

--

Steve Graegert (スティーブ)
Mobile: +49 151 25335249
http://graegert.tel



On Fri, Jul 29, 2011 at 08:01, ratheesh kannoth <ratheesh.ksz@gmail.com> wrote:
> #include <iostream>
>
> using namespace std;
>
> int main()
> {
>    int i;
>
>    cout << "Enter value of i " << endl;
>    cin >> i;
>
>    if (i < 5)
>        goto Sri;
>
>    int j = 6;
>    cout << "j = " << j << endl;
>
>    cout << "Outside Sri" << endl;
>    return 0;
>
> Sri:
>    cout << "Inside Sri" << endl;
>    return 0;
> }
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
