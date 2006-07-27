From: "=?ISO-8859-1?Q?Norbert_Fran=E7ois?=" <norbertlike@gmail.com>
Subject: my server is blocking...
Date: Thu, 27 Jul 2006 21:17:46 +0200
Message-ID: <78031e5e0607271217u2f60d430n42cacef776a26e2@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Hi list,

I'm a beginner in C (sockets) programming, so please, excuse my stupid question.

I'm trying to do a servent (server+client) for a p2p connexion. When I
dissociate the client and the server, everything's all right. The
Server is waiting for (pending) a connexion and when I connect on it,
I've the behaviour I want.

But now, I tried to merge the server & client together. When I start
my program, the server is pending and the other part of my program
isn't executed :( (the server is pending in an "accept" state). I
tried to do some fork(), but it was useless (in fact, a new server is
restarted and I get a bind error). How can I solve this problem
(easily, if possible) ?

In advance, thank you for your help

norbert
