From: Bert Wesarg <bert.wesarg@googlemail.com>
Subject: Re: problems with free()
Date: Tue, 28 Apr 2009 13:22:12 +0200
Message-ID: <36ca99e90904280422u243af682qe2ea0efc4b6a4984@mail.gmail.com>
References: <c93f91ee0904280218o2f844cd0u2262db407ca8f468@mail.gmail.com>
	 <c93f91ee0904280220x663ff91fibeca0886af04458f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=VK/v2IavKRdrJWT61+4CvJqarKJxtS/s2+AhT9CvAM4=;
        b=dW6V/Xa3Y2ZX3iu+D0ajivn/V5I23kTxojtpoWJS5rHmBgPETCHSBS5mkD1G8ywARE
         9oycZnMpgJ/4x8uRysyAo8+UQciVf6QCwM5I4MrHUYL6oaCg7ESIW3gWwEQqIfPI5+SD
         3n8tcDxkN1cTftpcFvsIdHHSB6xnPfNtRj1vI=
In-Reply-To: <c93f91ee0904280220x663ff91fibeca0886af04458f@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: leo mueller <llug.dan@googlemail.com>
Cc: linux-c-programming@vger.kernel.org

On Tue, Apr 28, 2009 at 11:20, leo mueller <llug.dan@googlemail.com> wrote:
> hi all,
>
> i got a little problem with free() ... i am allocating mem for a
> special struct and putting it afterwards
> into a linked list. allocating works fine, but freeing not. i'm
> tracking the program with htop. after
> allocating, the percentage of mem usage stays constant ...
Can you at least describe what do you expect to happen, and what does
not work with freeing?

bert
>
> the test-file is attached.
>
> any help is appreciated. big thanks :)
>
