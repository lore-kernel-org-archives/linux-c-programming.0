From: "Mariano Moreyra" <moremari@aca.org.ar>
Subject: Question!
Date: Wed, 3 Sep 2003 15:19:44 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <000601c37247$f40f6540$0b04a8c0@aca.org.ar>
Reply-To: <mariano_moreyra@aca.org.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi!!
First...I'd like to know if there is any kind of digest on this list to see
old submited messages.

Now...I have a little problem.
I have a process that is listening for incoming connections on a socket.
That process waits for a command and then
forks a child to run a bash script.
The problems is:
	- When the bash script runs the safe_mysql script to run MySql engine, it's
like the child process never ends.
	  And because of that, the parent can't close the connection with the
client socket.
	- But if the bash script doesn't run the safe_mysql script...the child
process dies successfully and everything end
	  Ok

Sorry about my english, but I hope that I made my self clear....
Bye!

