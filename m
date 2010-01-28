From: Randi Botse <nightdecoder@gmail.com>
Subject: function cast?
Date: Thu, 28 Jan 2010 13:05:42 +0700
Message-ID: <34e1241d1001272205y32e92727pab9ee3cf310dcbc7@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=dgZLT+0//um+YkELI6fpn22n0ls3Run1C22GeIr+TnA=;
        b=jeZrR0AFVcGgCWoANM6vchuv8/JrIXuS2n38+GdHugBNF6ERSxkeSnb/UjzrlI2voB
         7JPz2dFfsdAqBPODYZtZOYfXhtcTQmc/dermx7jd/R+25mtjC3cTwYB4Yi1N4hELF2lr
         rHLFllfllXwOOTbOaj9RvO+6gKLhOpCaP/rzE=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hi All,

Sometimes i see codes are written like this:

(void) printf(fmt);

- or -

(void) close(fd);

What these means? i think it is not necessary to put that 'void' on a
statement, or it just like when we cast a data type? so the email

Thanks,
