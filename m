From: =?ks_c_5601-1987?B?wMzBvrnO?= <anapple.orange@gmail.com>
Subject: FW: Why does math.h not declare function round?
Date: Wed, 14 May 2008 23:31:47 +0900
Message-ID: <5A37EDACB8A045DBB4A7AE3963B8544C@OrangeMini>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:to:subject:date:message-id:mime-version:content-type:content-transfer-encoding:x-mailer:x-mimeole:thread-index:from;
        bh=O/14+RuZ73NUQ6Yntt8/D8i+iK0XVUMRtk61u2YRR1Q=;
        b=bnKENzuZhFXOUJzfwtLXTbfI83YjOZ52H2u1reR2lbytgBG7ocv2jiJ+ncrwvNpnvt9dXnsr1oijySPCC/R/pksazhwCuNMvI2QRxpd88OzBj0Ca2zUdqwftM3jpso3BkUfGgOwbcYVv4GeRhsF3VLygnKgPE14Bl+KKmdF238A=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

 

-----Original Message-----
From: linux-c-programming-owner@vger.kernel.org [mailto:linux-c-programming-
owner@vger.kernel.org] On Behalf Of Plato
Sent: Monday, September 24, 2007 1:10 PM
To: linux-c-programming
Subject: Why does math.h not declare function round?

Hi!
    I made such a program foo.c:

#include <math.h>

int main()
{
    double bar=1.2;
    printf("%f\n", round(bar));
}
    
Then compile and run:
[root@so41 tmp]# gcc foo.c -ofoo -lm
[root@so41 tmp]# ./foo
0.000000

The result was obviously wrong. Then I add statement:
#include <math.h>
double round(double x);

int main()
{
    double bar=1.2;
    printf("%f\n", round(bar));
}

Then compile and run:
[root@so41 tmp]# gcc foo.c -ofoo -lm
[root@so41 tmp]# ./foo
1.000000

Now it's right.

I wonder why function round not declared in math.h. Anyone have idea?

Thx.




Plato
2007-09-24

-
To unsubscribe from this list: send the line "unsubscribe linux-c-
programming" in the body of a message to majordomo@vger.kernel.org More
majordomo info at  http://vger.kernel.org/majordomo-info.html

