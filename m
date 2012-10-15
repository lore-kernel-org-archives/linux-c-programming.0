From: Randi Botse <nightdecoder@gmail.com>
Subject: UDP message boundary
Date: Mon, 15 Oct 2012 11:50:50 +0700
Message-ID: <CAA6iF_7Hmu4c2FyGFRUw12QxK=t_tMvyu_xhMUjFGe7fCTxw5Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=SOoHeA9zJwuzFX3mmyOl/FOfInpQsHzfjFS/Gsswi6o=;
        b=c5kgbmy9deyDoANsSQuN9gIj+73ykwxvsVFVi5Rfnd41wBuTi6K2Io3g+1ZoLYm+0t
         SRXOxoE4oOLtiNSIvnVftNF94oFe0db6Payc5B0kidy8ET8kqao/ATTyWpM247+9tf6o
         Pebfh6xOoFHE2O1XFMSzAut+N3deC71T50hbQjLuKfigeHdwVQFBag6aUmAeOFTndPCX
         z51TUlAoSMWC5v01UR1eGIXtIeyqvXs7QJCQ1GbIXx0H6WsAR6F2PwLt/MeYmzWesuzc
         rgJJEVFSOWrVB88TENsfjYTuaoldYOIFAvYYOqit7JCaSCWpNJSuSGvwqPHw7SiFDG7/
         Z4Fw==
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hi All

When using TCP socket, I loop send() or recv() until ALL the data has
been transmitted (or error, disconnect, etc.), because TCP socket
packet is transmitted in stream nature, maybe a byte, bytes or all
bytes in one transfer.

The UDP socket preserve message boundary which TCP socket doesn't.
Does this means single call to sendto() will processed by single call
recvfrom()?, and how about packet that exceeds UDP data MAX size?.

So in code, do I need to loop sendto() or recvfrom() to transmit the data?.

Example codes is:

char packet[100];
size_t nbytes = 0;
int ret;

while (nbytes < sizeof(packet)) {
    ret = recvfrom(socket, packet + nbytes, addr, 0,  sizeof(packet) - nbytes);
    if (ret <= 0) {
        /* deal with recvfrom() error */
    }
    nbytes += ret
}


Thanks
