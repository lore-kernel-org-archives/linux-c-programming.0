From: Randi <nightdecoder@gmail.com>
Subject: Re: UDP data
Date: Thu, 10 Feb 2011 12:14:29 +0700
Message-ID: <1297314869.2205.48.camel@godart>
References: <AANLkTimck7ar6JPzSnNZo_baTz1usHLeUFxkL8GaqriV@mail.gmail.com>
	 <AANLkTi=VisvB732h_jzXcDj5_t7b96QAvJuXYiuOvEj8@mail.gmail.com>
	 <op.vqb09uit3l0zgt@mnazarewicz.zrh.corp.google.com>
	 <1297309262.2205.14.camel@godart>
	 <AANLkTik991ekzViW3e_amoNiO=4LB30snwbvDrwu61Nz@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:subject:from:to:cc:in-reply-to:references
         :content-type:date:message-id:mime-version:x-mailer
         :content-transfer-encoding;
        bh=dxpY3XyJE5WYHdOiX1WcwSYeJe6i+dBo/4Kh6dc88b8=;
        b=n2nJMOaSzb02U+1pojZ8Wck52WDj+yb+Ic/EYlL3aVcRLOY72ojbpdMrFYMOWmZM2x
         u6WAwq91t0LAUVEeOv4DxzULK/Cqj20ZnrhhGoeEPBL5XUx3KEQr79DKIPySX0t6nscW
         qscGzmZ3UlnXddAJhrMvbwpPN3gSlnq2MGvyY=
In-Reply-To: <AANLkTik991ekzViW3e_amoNiO=4LB30snwbvDrwu61Nz@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Donovan <alienresidents@gmail.com>
Cc: linux-c-programming@vger.kernel.org

Chris, optional means it can be enable or not, how to enable it and get
the header to verify the checksum.


On Thu, 2011-02-10 at 15:14 +1100, Chris Donovan wrote:
> Yes the checksum is for the header and data.
> Keep in mind that the checksum value is optional in ipv4, but required in ipv6.
> 
> Chris-
> 
> On Thu, Feb 10, 2011 at 2:41 PM, Randi <nightdecoder@gmail.com> wrote:
> > Hi All,
> >
> >        Since UDP socket is not reliable, what the common way in user level to
> > check UDP communication's data for error (eg. malformed, corrupted,
> > etc.)? is the checksum field in the UDP header (struct udphdr) intended
> > to this problem?
> >
> >        Randi

