From: "John T. Williams" <jowillia@vt.edu>
Subject: Password Encryption & Philosophy
Date: Fri, 30 May 2003 06:07:03 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <000c01c32693$4d336e10$ed64a8c0@descartes>
References: <EF836A380096D511AD9000B0D021B527013AD2E1@narmada.techmas.hcltech.com> <001a01c3236e$6249bc00$ed64a8c0@descartes>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "John T. Williams" <jtwilliams@vt.edu>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>

I had a problem, and I was wondering if anyone had a solution.
I'm writing a client which gives the user the option to store their
password, and I want to lend some security to the password being stored. My
problem is that no matter what algorithm I use to encrypt and decrypt the
password (it can't be a one way hash, bc I have to be able to send it to the
server in its original form), anyone who has access to the source code and
the encrypted password can get the original password back. Does anyone have
any suggestions on how to encrypt a password with an open source algorithm
and yet lend more security stored information.

Sincerly,
John T. Williams
jtwilliams@vt.edu

