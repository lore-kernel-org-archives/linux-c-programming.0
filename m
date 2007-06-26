From: "Li YanBo" <dreamfly281@gmail.com>
Subject: Confuse with big endian bitwise field
Date: Tue, 26 Jun 2007 18:20:35 +0800
Message-ID: <1197ff4c0706260320t648dba53ga7e3eed745293e9a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:mime-version:content-type:content-transfer-encoding:content-disposition;
        b=LmF2I6X8UuHXAMqsmLNt0fmLBYYDXArJw5gIxjctZcJrVDLBZk3mWsPIQsPS3UNzwLI5r+fTyEmtCE8i25QigJP9O1x+aFFbDVDXSCmUAeHoWeLrJ7mqbdfuCZXZ/UMuMGOd1+xOIc7sIGXt6TuvNGeRLQS6kkQ5G9qvS8gRj2Y=
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org
Cc: kernelnewbies@nl.linux.org

hi all,

I am try  to define a hardware specific struct, it is like below:

struct xxx {
        __be32 pdu_cnt:6;
        __be32 y:3;
        __be32 wep_key:2;
        __be32 uses_wep_key:1;
        __be32 keep_alive:1;
        __be32 buff_tail_addr:19;

        __be32 cts_11g:1;
        __be32 rts_11g:1;
        __be32 x:2;
        __be32 frag_size:12;
        __be32 payload_len:12;
        __be32 frag_num:4;
}

but I am confuse with how to assign the values to the fields
"buff_tail_addr" and "payload_len", I think there  are two ways to
assign values to them, but I don't know which is right?

eg: I declare a variable  struct xxx X;

1: X.buff_tail_addr = 0x3456;                        X.payload_len = 0x20;
2: X.buff_tail_addr = cpu_to_be32(0x3456);    X.payload_len = cpu_to_be16(0x20);

There are two way I think to assign values. Could anyone tell me which
is right or both are wrong? I will be appreciate for any hints, thanks
in advance!

BR

lyb
