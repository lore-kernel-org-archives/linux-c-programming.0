From: Mulyadi Santosa <mulyadi.santosa@gmail.com>
Subject: Re: Error in compiling a module
Date: Thu, 29 Jul 2010 11:51:04 +0700
Message-ID: <AANLkTimeJrRs4Bd1aw--FKPYyqcuu8_O-Xi5G0FOh0yd@mail.gmail.com>
References: <AANLkTikcGVVaofeUZtvPs+jpA11uXs-baTZ8O8NvH94i@mail.gmail.com> 
	<AANLkTikqZ5YWqgnHbB3Y03kZfC0OpJ7POYKSeU6JESVt@mail.gmail.com> 
	<AANLkTimkzbse8B0_kUMbaP-DT8Zm1CnZxOnCA+S5CHnE@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:in-reply-to
         :references:from:date:message-id:subject:to:cc:content-type;
        bh=LEchMPosjOWooIeV1kX8+CAlUrkgWjci2KyCB1GEI6Q=;
        b=HHvDPSf6HL7TYtEZq6t7sYCRmS5bkt3tmzVOA/R0+RLVyAcVK8PnyEo+nd4jAoP8vY
         M+qj7BKaKMpntxQHa9FYGe4U2DIbtGZ1EnbyYqlLi1cKARsbqWiDdMobDQqgYsEKzl4Q
         RD69DG0F9VkcYbqd2Wu8HMnvZ+FpyQ2EOBaCU=
In-Reply-To: <AANLkTimkzbse8B0_kUMbaP-DT8Zm1CnZxOnCA+S5CHnE@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Balachandar <bala1486@gmail.com>
Cc: kernelnewbies@nl.linux.org, linux-c-programming@vger.kernel.org

Hi...

On Thu, Jul 29, 2010 at 00:28, Balachandar <bala1486@gmail.com> wrote:
> Thank you for your help. I figured out the mistake. I missed a
> semicolon in one of the header file that was included in the file that
> showed the error.

I think it would be great if you and some guys here write about
"mistakes I ever did when I write kernel codes" in kernelnewbies
wiki....so that others might learn about it.

Just 2 cents suggestion...

-- 
regards,

Mulyadi Santosa
Freelance Linux trainer and consultant

blog: the-hydra.blogspot.com
training: mulyaditraining.blogspot.com
