From: "Yan Lin" <yanlin@fortinet.com>
Subject: Re: c preprocessor expansion
Date: Thu, 8 Jan 2009 09:53:48 -0800
Message-ID: <AAA5666725A149B2A882E90858347F9A@ftnjoe>
References: <ef37ea20901080949i2cd875fbk58b4ae3605655812@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: Task Struct From Hell <taskstructfromhell@googlemail.com>, linux-c-programming@vger.kernel.org

gcc -E would do this.


----- Original Message ----- 
From: "Task Struct From Hell" <taskstructfromhell@googlemail.com>
To: <linux-c-programming@vger.kernel.org>
Sent: Thursday, January 08, 2009 9:49 AM
Subject: c preprocessor expansion


> Hi,
>
> I was wondering if gcc has any argument which allows for the expansion
> of all macros in a file, just so if we have something like the
> following:
>
>
> #define FOO "bar"
>
> int main() {
>   printf(FOO);
> }
>
> It will output this:
>
> int main() {
>   printf("bar");
> }
>
> Thanks,
> TSFH
> --
> To unsubscribe from this list: send the line "unsubscribe 
> linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
> 


*** This email and any attachments thereto may contain private, confidential, and privileged material for the sole use of the intended recipient.  Any review, copying, or distribution of this email (or any attachments thereto) by others is strictly prohibited.  If you are not the intended recipient, please contact the sender immediately and permanently delete the original and any copies of this email and any attachments thereto. ***

