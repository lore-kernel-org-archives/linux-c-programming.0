From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: union to get parts of integer
Date: Mon, 20 Dec 2010 16:10:17 +0530
Message-ID: <AANLkTikAB_-kO_cmD5VQRtztx=4V9NDcmU4uWBDE=ON8@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=Ui7MX/nF3AU35PIz72NpFQC6+sGAFat0DBWU3dnidfs=;
        b=QCq+Skmf/akAQtUriiuZNzajmWb5exUf38lEmvmqMSYL9glwuP0lKVCsYyKeqgifhv
         d6X0xjb94y+0cUobPtuO6F8lPnyvj+m5YMYbljpaRrCDCnyWytf6ekTDTPczmoIfO9V4
         swkKwxOkuhcnko8xXFVFDH+TJIIxwcZ/9CE5w=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

typedef struct {
char parts[4];
} node ;

int i=0x12345678

((node *)&i)->parts[0];
((node *)&i)->parts[1];
((node *)&i)->parts[2];
((node *)&i)->parts[3];

Is there any mechanism to split into bytes using the power of union ?

-Ratheesh
