From: Eric Polino <aluink@gmail.com>
Subject: =?windows-1252?Q?Re=3A_warning=3A_=91struct_=92_declared_inside_parameter?=
	=?windows-1252?Q?_list?=
Date: Sat, 14 Feb 2009 21:20:04 -0500
Message-ID: <b21328ed0902141820jc23e299q2cc1163da6c02a38@mail.gmail.com>
References: <875251.26275.qm@web63406.mail.re1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=w0Gm2Yy8vWT2E2poeUu2M3ZzF3A2yhj9HKt0w2rneA8=;
        b=YIg4/Wj14UYa9MsUm00CT9HHffvBj7uc32YIQrdyL10V3ox5pd7/SbLM/MhjUs5Spx
         bFUyAmrqtb8JFiBeG1iZM98sZTi46xfnDQjB2I/+I+y1FVzVB6kTRtRs6yKkoPcj4BPN
         /wm0GbtFF5qo10HpJ+zaezLFgwCJzqm6Awxns=
In-Reply-To: <875251.26275.qm@web63406.mail.re1.yahoo.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: fundu_1999@yahoo.com
Cc: linux-c-programming@vger.kernel.org

"None are more hopelessly enslaved than those who falsely believe they
are free."
                                      --Goethe

"Freedom is living without government coercion."
                   --Ron Paul (www.ronpaul2008.com)



On Sat, Feb 14, 2009 at 20:16, Fundu <fundu_1999@yahoo.com> wrote:
> i'm running ubuntu 8.04 with gcc-4.2
> and i'm getting
>
> mb_con.h:43: warning: 'struct query_resp' declared inside parameter list
> mb_con.h:43: warning: its scope is only this definition or declaration, which is probably not what you want
>
> here's a snippet of how .h file looks
>
> struct query_resp_type
> {
>  int type;
> } query_resp;
};
>
> void send_req(struct query_resp* resp);
void send_req(struct query_resp_type* resp);
>
>
> what i don't understand is why this warning when i have declared the struct before the function in the header.
>
> what am i missing ?
>
> thanks in advance !
>
>
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
