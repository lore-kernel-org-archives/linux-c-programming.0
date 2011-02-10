From: Randi <nightdecoder@gmail.com>
Subject: UDP data
Date: Thu, 10 Feb 2011 10:41:02 +0700
Message-ID: <1297309262.2205.14.camel@godart>
References: <AANLkTimck7ar6JPzSnNZo_baTz1usHLeUFxkL8GaqriV@mail.gmail.com>
	 <AANLkTi=VisvB732h_jzXcDj5_t7b96QAvJuXYiuOvEj8@mail.gmail.com>
	 <op.vqb09uit3l0zgt@mnazarewicz.zrh.corp.google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:subject:from:to:in-reply-to:references
         :content-type:date:message-id:mime-version:x-mailer
         :content-transfer-encoding;
        bh=KZLU9LAKuCl8BOzkyWEB+IgvOvp/howXcM9PsUAkO68=;
        b=Jk0N/hW/veFJEe/eHRkaeAghPISKMoR7xvQaljPagL5LtSevf1OFEYyq4Nxd/OVXXx
         5Zhg+hhhDUKGD+QOSROJdvVQ07EvUWzs5dTZiw4KY8UI7dlAb3EoueTdnptREKgbwku7
         11eyGFL6yKCk/qbTOMnMkvC49rajlB6c3ROx0=
In-Reply-To: <op.vqb09uit3l0zgt@mnazarewicz.zrh.corp.google.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi All,

	Since UDP socket is not reliable, what the common way in user level to
check UDP communication's data for error (eg. malformed, corrupted,
etc.)? is the checksum field in the UDP header (struct udphdr) intended
to this problem?

	Randi

