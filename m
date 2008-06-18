From: Alfeiks <tirra.newly@gmail.com>
Subject: Re: Libfprint
Date: Wed, 18 Jun 2008 14:39:55 +0400
Message-ID: <4858E5FB.5050504@gmail.com>
References: <F0F77800ED208443A33E6202DF9CE1A801E1C26D@bgsmsx413.gar.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:user-agent
         :mime-version:to:cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding:from;
        bh=f5LTiSxbHTEIEIKMeNlO00VoWmnQsz2mWmv8qj4b7j4=;
        b=xC0PcxOtP9G4PqDxod4CKrmuB0aOvkjhCUgtB0YvwxWf9t22OWsCVITTfFZ7B0SlaW
         92oLYu60cN7d0tBN6XidtB9Ay1CEOrrPftDMnqsqRXf7pP6z24zxiOxlsd8K1G9gIwVT
         KalyvV/awNcgsyqX7sZi7D0cn8JNwbUPSv2aA=
In-Reply-To: <F0F77800ED208443A33E6202DF9CE1A801E1C26D@bgsmsx413.gar.corp.intel.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Kumar, Vinoth R" <vinoth.r.kumar@intel.com>
Cc: linux-c-programming@vger.kernel.org

use -l flag to gcc - when it calls linker (ld)

Kumar, Vinoth R wrote:
> I am currently working on a project which uses a fingerprint reader. I
> thought of using libfprint . The problem is I am very new to gcc. Could
> anyone say how to compile and link it with the library my program say
> myfprint.c
>
> Thanks,
> R.Vinoth Kumar
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>   

