From: =?iso-8859-1?q?Andr=E9s_Rold=E1n?= <aroldan@fluidsignal.com>
Subject: Re: Detecting deamons running
Date: Fri, 28 Mar 2003 14:45:03 -0500
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <7disu3cm2o.fsf@cerberus.central.fluidsignal.com>
References: <00b701c2f54e$4a57afb0$0b00a8c0@SPLUCIANO>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <00b701c2f54e$4a57afb0$0b00a8c0@SPLUCIANO> ("Luciano Moreira -
 igLnx"'s message of "Fri, 28 Mar 2003 14:20:08 -0300")
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

$ pidof process

will return the PID or the PIDs of the specified process. If it returns
nothing, there is not such a process running.

Cheers

"Luciano Moreira - igLnx" <lucianolnx@ig.com.br> writes:

> I have a application that run like a deamon, which write in a file its PID,
> that is used to stop it later by others programs. But, I ve noted that my
> users send signal 9 to stop deamons, and my application cannot remove its
> PID file, because it cannot handle singal 9, keeping its PID file at HD
> (FileSystem).
>
> Can someone sugest me a way to know the deamon's PID, without write it to a
> file ?
> OR
> How can I do to know if my deamon is running and get its PID ?
>
> Thanks,
>
> Luciano
>
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
Andres Roldan, CSO
Fluidsignal Group
