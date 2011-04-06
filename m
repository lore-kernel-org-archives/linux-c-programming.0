From: Kristoff Bonne <kristoff.bonne@skypro.be>
Subject: programming examples for X.509 signing
Date: Thu, 07 Apr 2011 00:33:46 +0200
Message-ID: <inipob$6fp$1@dough.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi,


I don't know if this is the best forum for this, but I'll ask anyway.


I would need to write two application that kind of work together:
- one application that signs a small piece of text with an X.509
certificate and then sends it over a UDP packet
- and a second one (receiving that package) that verifies that signature
based on the signature (actually, the name of the CA that signed that
signature).

My goal is to extend a application that sends UDP-stream by additing
X.509 based authentification.

I guess the openssl project would be a place for this, but it's not that
easy to find good documentation on how to use this inside a self-written
C-program. (or I must have been looking at the wrong place -( ).


Anybody any idea where to find this information and -preferably- some
programming examples?



Cheerio! Kr. Bonne.

