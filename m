From: xlp <xlp@emtel.net.co>
Subject: Daemon fork()ing 4 process
Date: Mon, 15 Jul 2002 19:00:43 -0500
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020715184150.A288@nietzsche.metrotel.net.co>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi, I am coding in C a daemon that has to keep 4 process running doing certain operations and when for exmaple, one finish, It fork()s another with other option and so on.
Seudocode:
-Daemon starts,
-It fork()s 4 processess
-It waits for ANY of the procrosses to exit().
-If a process exits, it check the return value, and it fork()s another one with other argument.

C code:
main(){
	//fork();, parent dies.
	//setsid(); 
	//chdir(workdir);
	//umask();
	while(1){
		// What do you suggest?
	}
}

thanks.
	

