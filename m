From: Michael Scondo <michael_scondo@gmx.de>
Subject: Re: PID's of processes and waiting.
Date: Wed, 23 Jun 2004 17:52:34 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <200406231752.34807.michael_scondo@gmx.de>
References: <200406222050.48748.eric@cisu.net>
Reply-To: michael_scondo@gmx.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200406222050.48748.eric@cisu.net>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

> 	I am looking for a way to wait for a process to terminate. I have a
> process that was executed via system() and am getting its PID from a file
> it writes itself. I have a few questions.
>

here is how I have implemented somthing similar:

int pid = fork();
if ( pid == 0 )
{ 
exec( the child );
}

int status;
wait( pid, &status, 0 );


Have a look at man wait, the code above is pseudo code. ( There may be 
errors )

Kind regards
Micha

