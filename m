From: "Jai Sharma" <jai.unix@gmail.com>
Subject: command output to variables
Date: Wed, 7 Jan 2009 18:05:55 +0530
Message-ID: <1f714d50901070435h4b76e26brdb1eedddbdda4cc3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=LG4kmprPjZ590Hl/jWOG3dPhYWk6BLHAx2pyloO2Ow0=;
        b=h6ZDSzh1sH5LTx+ZWzpe+AS5p0zHDFDW9KC+5Mggv5RkZGn/ZTvoQtgDJ+GLqguY+a
         RJiTiNNakTf5Ev0xkurRvIryXst6t9dKn1a+OmXKEMHZE4sEnmqgUrIL4F9J7xKICQqd
         RATjVAC7A0H+hsy5pWBBELT8SZk2AfsJSQyTI=
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi All

I m PHP, Perl programmer , but finally I need C to program in LInux.
In perl I simply use `` operator to get command output.

$who_output = `who` ;


but in C , how can i get the output. Using system function i m easily
run the command. But how to get its output .

system("who");

Plz help
