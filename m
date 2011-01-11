From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: float
Date: Tue, 11 Jan 2011 13:08:06 +0530
Message-ID: <AANLkTikyOX3yeh4Xo5vrax651djd_rkQuPy_vm30AZhM@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=u8xDrqP8rbvz4Fm1hueLwklnD/YG/Vh95jRMM+0JaMU=;
        b=R+w/P7ilNkevQz2KCahL99mhxjx+EE2GSJHo9GLIrhD0ru/gKlca1T2l13Z4T+GTVp
         ye2pI7E7kBI8ufTgADp3xPeU2SAzE32Ki5G23xMhu3jf8VhGmEUcFAKZG4Mth4YbFluW
         K7wk5cpiSPP9/vlapBmZQp6OfLmkhfdFu0QTA=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

I could not understand  why it getting printed like this. Could any
body tell me.

#include <stdio.h>

int main()
{
        float f=0.0f;
        int i;

        for(i=0;i<10;i++)
                f = f + 0.1f;

        if(f == 1.0f)
                printf("f is 1.0 \n");
        else
                printf("f is NOT 1.0\n");

        return 0;
}
