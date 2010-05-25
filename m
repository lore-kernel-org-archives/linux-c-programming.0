From: Randi Botse <nightdecoder@gmail.com>
Subject: C Question
Date: Tue, 25 May 2010 17:08:52 +0700
Message-ID: <AANLkTimNataepVFhtn4kSv_kGv1wTBHMAOgeZTK0hgW-@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=x3hCjvBKTgpmNFF1ybg3aCYeIBoXBj8luE/intsQvgk=;
        b=b8hPiJ5ueFNFMA6tnSUX/GtyHW8Qv6N+omWQRqc10yngmUNEWQOORx1SnBNa+iSI7t
         A8SrnA21CgP1R2bRjC8tdv37DtIZQfXDOXuANxOpf+nyhUBgIPYYTZA+fNRHVp8t7lcM
         3iUFQLDfUStdHBKsJaDDc82SgqiUTMwViLlKU=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hi All,

Im looking at lscpu.c shipped by util-linux-ng-2.17, can you explain
me how the *vir_types[] declared, is this valid C declaration?

/* virtualization types */
enum {
	VIRT_NONE	= 0,
	VIRT_PARA,
	VIRT_FULL
};
const char *virt_types[] = {
	[VIRT_NONE]	= N_("none"),
	[VIRT_PARA]	= N_("para"),
	[VIRT_FULL]	= N_("full")
};
