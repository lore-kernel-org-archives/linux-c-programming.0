From: Florian Weimer <fw@deneb.enyo.de>
Subject: Re: Issue with fcntl FD_CLOEXEC and execve
Date: Sun, 21 Jun 2020 21:57:18 +0200
Message-ID: <87y2og5h0h.fsf@mid.deneb.enyo.de>
References: <000801d64679$d347bf10$79d73d30$@yuristudio.net>
        <87mu4yp6rt.fsf@mid.deneb.enyo.de>
        <fadc7cda-a84b-33ed-e15a-8203673f9d61@yuristudio.net>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <fadc7cda-a84b-33ed-e15a-8203673f9d61@yuristudio.net> (Yuri
        Edward's message of "Sat, 20 Jun 2020 21:18:27 +0200")
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yuri Edward <yuri6037@yuristudio.net>
Cc: linux-c-programming@vger.kernel.org

* Yuri Edward:

> https://github.com/BlockProject3D/Framework/blob/ProcessManagement/Base/src/Framework/System/Process.cpp 
>  > This is the main class that performs fork, pipe, read, write and 

    if (fcntl(commonfd[PIPE_WRITE], FD_CLOEXEC, 1) != 0)

That's not how fcntl works.  You need to use F_GETFD and F_SETFD to
set the FD_CLOEXEC flag.
