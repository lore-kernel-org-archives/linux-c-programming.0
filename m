From: "J." <mailing-lists@xs4all.nl>
Subject: returning strings until no strings are left ?
Date: Mon, 16 Dec 2002 21:46:02 +0100 (CET)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.21.0212162133410.18647-100000@hestia>
References: <Pine.LNX.4.44.0212161043290.4841-100000@ns.isi.ulatina.ac.cr>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0212161043290.4841-100000@ns.isi.ulatina.ac.cr>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hello,

I am new to c programming but not new to programming in general . The
``minor'' problem I keep running into at this moment:

I know how to return ONE string from a function. But what if I want to
keep returning strings from a function until there are no strings left to
return ? What should the function than return ? Because the function
should always return something in the end and of course the caller has to
know that the function is done or has nothing more to return .

for example fgets returns NULL when it's done, but if I try to return a
NULL at the end of my function while I claimed it as an char *... hmmzzz,
status epilepticus...

Thank you in advance...

J.

