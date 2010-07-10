From: Dallas Clement <dallas.a.clement@gmail.com>
Subject: Slow signal delivery to server process with heavy I/O
Date: Sat, 10 Jul 2010 18:08:09 -0500
Message-ID: <AANLkTimehfszGlcsKm4wt2byyNTb8cGD7DQSBK_W2Ome@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=mYk1RXX3HRl9hI2v5xZSIGmJcDSBqBtq9diqBGPak/w=;
        b=Qw+5+4Y0fiVhrBmApa/Xn7c/q7gJeVhGGsoThomV8c4NMj771nyfSQxTCQOvx4IuA5
         Y5jo5nqlMQZPSrzq5bOlvx6Yt00xOY9xVeiirSEWXW34qoQVKLlvSWG6TzAuvYDERDnz
         zJPrD35Yt6EAzu2KVHrSt2nkDcKtlGiBJmWUU=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hi All,

I've noticed that asynchronous signals such as SIGINT, SIGTERM etc are
delivered to my process long after the signal is sent if the receiving
process is handling lots of I/O.  My process is a multi-threaded web
server.  It's got one thread waiting on 'select' to accept incoming
connections and a thread pool which reads the data with 'recv'.

When I batter the web server with incoming traffic and I try to
shutdown the server by sending a SIGINT or SIGTERM, I have observed
that the web server finishes handling the incoming traffic before the
kernel dispatches the signal to the process.  It appears that the
'select' and 'recv' calls are getting highest priority with regard to
scheduling.

I realize this test may appear unnatural and is perhaps unrealistic,
but I would like to be able to shutdown my server gracefully within a
reasonable amount of time, no matter what kind of load it is handling.
 Don't want to have to wait several minutes for my signals to get
handled under heavy load.  Could someone please explain why signal
delivery is slow under these conditions?

Thanks in advance,

Dallas
