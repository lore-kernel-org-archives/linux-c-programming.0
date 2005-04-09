From: lucianolnx <lucianolnx@ig.com.br>
Subject: Re: Check if a process exists? (EXTENDING THE QUESTION)
Date: Fri, 8 Apr 2005 22:50:10 -0300
Message-ID: <20050409_015010_024210.lucianolnx@ig.com.br>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="Message-Boundary-by-Mail-Sender-1113011410"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

--Message-Boundary-by-Mail-Sender-1113011410
Content-type: text/plain; charset=ISO-8859-1
Content-description: Mail message body
Content-transfer-encoding: 8bit
Content-disposition: inline

Today, what are the bests ways to know if a deamon is running without 
knowing its PID ? 

My old technique (used until now), is based on recovering the PID saved by 
the own process in a special and known location (like a file), almost all 
times persisted (PERSISTENCE IS A PROBLEM). 

Luciano 



On Tue, 1 Mar 2005, Hareesh Nagarajan wrote: 

> Hi, 
> 
> Can a process check if a given PID exists or not? In other words can a 
> process check if an unrelated process is alive? Is there any system 
> call that does this? 
> 
Use kill() with a second argument being zero. 

    if (kill(pid, 0) == -1) 
    { 
       /* Process is not there. */ 
    } 
    else 
    { 
       /* Process is alive. */ 
    } 

Holger 

--Message-Boundary-by-Mail-Sender-1113011410--

