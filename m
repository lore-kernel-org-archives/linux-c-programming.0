From: Chuck Winters <cwinters@atl.lmco.com>
Subject: Asynchronous I/O
Date: Thu, 23 May 2002 20:20:46 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020523202046.A25509@atl.lmco.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org


I have been messing around with Asynchronous I/O for a couple of days
and I have a couple of questions.  First, I am setting my own signal(SIGUSR1)
to be fired instead of SIGIO.  That means I have to use the F_SETSIG fcntl.
Next, I am also setting SA_SIGINFO so that I get a little more info with
the signal.  Now the questions:

	1)  Using this combination of F_SETSIG and SA_SIGINFO, I am told(by the man
	    page) that when the signal is fired, the file(socket in my case) descriptor
			is placed in the si_fd field of the siginfo_t structure.  Well, when
			my registered function is run,  I check that the si_fd is the socket I am
			using to communicate, and also that the signal in si_signo is the signal
			I am listening for.  Good.  Now what happens is that recv blocks!! Can 
			anyone tell me why??

	2)  I also wrote 2 little test programs which just created a connection between
	    them over localhost.  Then set the Asynchronous I/O on the reader program.
			And the writer program the user can enter data and it shows up in the 
			reader terminal(big deal).  Now with the code I am writing for real, I am
			running into the above problem(1).  Now, can the F_SETSIG/F_SETOWN/FASYNC
			be set *after* the connection is established, or is this behaviour 
			undefined?  The little test programs worked ok with that setup.  Is this
			just a fluke? 

I thank you all for your time.
Chuck Winters
