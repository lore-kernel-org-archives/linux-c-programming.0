From: Jai Sharma <jai.unix@gmail.com>
Subject: extract the data from buffer
Date: Fri, 16 Jan 2009 21:24:11 +0530
Message-ID: <1f714d50901160754m4568738ev27879b0e9ba72fab@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=HE6G/v0pQJsTd0eMUFSnynyEWL8+6XcBWhddr/JY1yk=;
        b=p0uMlKO7mnssUeeqFK5uMwt7Qp0EVbGHcvxOWBIqTVX0P24GcZqNfyysYLPc2rD85w
         k8RIBGOQ6crvDbjG9pBWWJ6EOJUbI3Cg+1nXobLR7MS/HA4ZK5VORO0M6uzVlWghP7ys
         c+1GDQbNU3sE837XvNM2TlJwH3a6HNPSPDfQ4=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi

I want to extract variables values from a string buffer. Can anyone
pleease tell me how can i do that.
In C how to use perl like regular expressions.


Channel              Location             State   Application(Data)
SIP/5078-099b4b48    s@newvcci:1          Ringing AppQueue((Outgoing Line))
SIP/66.119.60.21-099 s@tracphone:6        Up      Queue(tracphone||||3600)
SIP/5080-09964168    s@newvcci:1          Up      Bridged Call(SIP/66.119.60.21-
SIP/66.119.60.21-099 s@tracphone:6        Up      Queue(tracphone||||3600)
SIP/5079-09924998    s@newvcci:1          Up      Bridged Call(SIP/66.119.60.21-
SIP/66.119.60.21-099 s@tracphone:6        Up      Queue(tracphone||||3600)
SIP/5041-0993ee38    s@newvcci:1          Up      Bridged Call(SIP/66.119.60.21-
SIP/66.119.60.21-099 s@tracphone:6        Up      Queue(tracphone||||3600)
SIP/5010-098e7760    tsihomephoneservice@ Up      Bridged Call(SIP/63.111.11.135
SIP/63.111.11.135-09 tsihomephoneservice@ Up      Queue(tsihomephoneservice||||9
10 active channels
5 of 200 max active calls ( 2.50% of capacity)


I want to extract three numeric data fields from last line:
as

%d of %d max active calls ( %l% of capacity)
result : 5,200,2.50

means 2.5


Thanks and Regards

Jai
