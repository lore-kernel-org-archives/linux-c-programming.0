From: "Sreevathsa" <sreevathsa@gmail.com>
Subject: Custom defined object in a signal handler
Date: Wed, 28 Mar 2007 16:54:02 -0700
Message-ID: <460b0048.12917d31.29d5.102f@mx.google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:from:to:subject:date:organization:mime-version:content-type:content-transfer-encoding:x-mailer:x-mimeole:thread-index:message-id;
        b=llfg9JHiR51Ogic4vGGIUR+tvQeREAh7m9x1MP7LXzy6wgsjbXKIEO/n6ZAkaDdn04vOqPqeYx/qoEXe4EFLZVBlABPw0bj24OR3QlzJTa7E2VSllWy8aGvS4nbBZmtwJVdGN+5P1Wf9ZYYuWukoho5bi2HzGtOWJs4xEWls3zQ=
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

I have a question regarding signals. Is there a way you can pass some custom
defined parameter (say, a struct foo * ) to a signal handler??

To be more specific, struct sigaction defines 2 types of handlers - namely
sa_handler and sa_sigaction both of which have predefined set of arguments
to them.

sa_handler has (int) as the argument and sa_sigaction has (int, siginfo_t *,
void *) as its arguments. The third argument void * to sa_sigaction is for a
ucontext_t struct that contains the process's context at the time of signal
delivery.

My requirement is: I need to pass a struct foo * pointer to the signal
handler when I set it up and later when the signal is delivered I must be
able to see the foo * that I had passed at the time of setting up the
handler. Does anyone know how we can do this?

TIA,
Sreevathsa

