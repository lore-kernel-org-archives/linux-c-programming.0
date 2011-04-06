From: ratheesh kannoth <ratheesh.ksz@gmail.com>
Subject: close() on tcp socket.
Date: Wed, 6 Apr 2011 16:30:43 +0530
Message-ID: <BANLkTimLJ4k1KzmzHkz10JvL9HTyb0y+WQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:date:message-id:subject:from:to
         :content-type;
        bh=YnEEnw1H7FP6RkkRJYYTMb27gxvZbVlcmCFLIfhYDYk=;
        b=FGr6XZLd6G8Cp1U6assNKW6Lxkt62SMwpaonYXcZiTBMfNmVNe7s8MBqkD+cloZ0qK
         ebtnw46jdsGdWH58u3wLlHDrDyUeIykTA04mncBp4VuyGGFz6CrDrFO+hVopZEdM7OHU
         6wY+cpSwLS8h4tdN9vbqIkUGAB1KUmNqqpZ9o=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

connect() system call establishes a connection as shown in below steps.

1.   |client |  ----------------- syn --------------->  | server |

2.  |Server|  --------------syn+ ack --------------> | client |

3.  | Client | -----------------ack --------------------> | Server |


But establishing connection , client calls close() system call. Client
is sending FIN+ ACK to server  [ i expected only FIN to be sent from
client to server ]

Is this a valid scenario.?  what could be the problem ?


-Ratheesh
