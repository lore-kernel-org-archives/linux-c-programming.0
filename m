From: "=?ISO-8859-1?Q?Jo=E3o_Fernandes_Simpl=EDcio?=" 
	<jfsimplicio@gmail.com>
Subject: times()
Date: Sat, 5 Apr 2008 00:04:26 +0100
Message-ID: <c6c65ec80804041604g583f809bi1f8f4ae27a2ba748@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=U1MMqrkHGE1VfP9CM1fidf7lpIgyEtpp1gTN2C0OlFE=;
        b=RWYgWFV/EXSk1PmLaC3loCyUhd2XqvO8mQDiodEPG4lVSbp1JaCBUj3OgX86+G6mhNk2xBVrfWKjWCeccbXVL/KeGt0rtKtDUHDACCGZNJESWWm+cr0UuIx3iVRpbUAc9xKbae3zRiHATA3WuUo8g+HkLj9PPG3DtIZXLFYzK/I=
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-c-programming@vger.kernel.org

Hello,

I've been testing the times() function and I can't understand in what
way is the ticking being incremented for system time measurement
(tms_stime). I understand that tms_utime gives the ticking related to
the process and what does tms_stime gives?

E.g.:

In 5 minutes the process gives 10000 ticks, so if the OS supports a
maximum of 32758 process identifiers this gives us a 30% of load.

Is my thinking right or am I missing something else?

Best Regards,

     -- Jo=E3o Simpl=EDcio
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
