From: Fekete Gabor <feketga@delfin.unideb.hu>
Subject: using the same port with two sockets
Date: Thu, 25 Sep 2003 10:16:56 +0200 (DFT)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.A41.4.20.0309251006170.140698-100000@delfin.unideb.hu>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming <linux-c-programming@vger.kernel.org>

hi

with SOCK_STREAM if the server accept()s a connection it creates
another sokcet that can be used to handle that connection.
I want to do the same but with SOCK_DGRAM.
So what I want is to recvfrom() a "connection" request and then
create another socket to handle that "connection", that is, the
server would go back to recvfrom() requests without worrying about
packets arriving from the previously "accepted" client which would
send those packets to the socket created especially for it.
Is it possible?

Does SOCK_STREAM create a new port too with the new socket? 

thanks


