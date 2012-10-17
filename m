From: Randi Botse <nightdecoder@gmail.com>
Subject: Re: UDP message boundary
Date: Wed, 17 Oct 2012 10:24:08 +0700
Message-ID: <CAA6iF_5RAWCB47=woDjb39aTfRH6qzUVsn2YdyTydUbyreL7Yg@mail.gmail.com>
References: <CAA6iF_7Hmu4c2FyGFRUw12QxK=t_tMvyu_xhMUjFGe7fCTxw5Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=0SYp8rENI50iOd3AOeFXL+JcI4FC4ORFkZqrg378mEU=;
        b=sggdAYC1gTcJeasJmLlJATkAgiH0DecOZdkXmsHSD57PfNCz3yPqUr1G+YptgMJ29T
         grKBMbSut1x2fJck3uFPc+fV7dxtiBRoDPDYrbkL4FQAjjDIKuLE2cxypbtzgmiMcrPr
         HblCz/a0h4Q0ur14A5noUvXeVMeUeTX5jK+7QtbiWcCKmN1DwF7LUNtM2MdfmQIzVtno
         6xIN8Q8IDnhXXr2edRHvgswSuD8YkRuv3eCIpQpJs+EHgu6inrdVoRxOjlekDf9h03YI
         RsUPaUTiuUGkdVPASqi9477HC+Gch+WW9Oq6Gq3gHEZOHaXvS8vnjGs2H1H1Qn57dLKW
         IamA==
In-Reply-To: <CAA6iF_7Hmu4c2FyGFRUw12QxK=t_tMvyu_xhMUjFGe7fCTxw5Q@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Anyone can share? :)

Thanks


On Mon, Oct 15, 2012 at 11:50 AM, Randi Botse <nightdecoder@gmail.com> wrote:
> Hi All
>
> When using TCP socket, I loop send() or recv() until ALL the data has
> been transmitted (or error, disconnect, etc.), because TCP socket
> packet is transmitted in stream nature, maybe a byte, bytes or all
> bytes in one transfer.
>
> The UDP socket preserve message boundary which TCP socket doesn't.
> Does this means single call to sendto() will processed by single call
> recvfrom()?, and how about packet that exceeds UDP data MAX size?.
>
> So in code, do I need to loop sendto() or recvfrom() to transmit the data?.
>
> Example codes is:
>
> char packet[100];
> size_t nbytes = 0;
> int ret;
>
> while (nbytes < sizeof(packet)) {
>     ret = recvfrom(socket, packet + nbytes, addr, 0,  sizeof(packet) - nbytes);
>     if (ret <= 0) {
>         /* deal with recvfrom() error */
>     }
>     nbytes += ret
> }
>
>
> Thanks
