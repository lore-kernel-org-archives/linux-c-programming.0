From: ern0 <ern0@linkbroker.hu>
Subject: Re: line buffered stdin
Date: Mon, 11 Jan 2010 20:09:57 +0100
Message-ID: <4B4B7785.8090708@linkbroker.hu>
References: <4B4B5173.20504@max01.eu> <ea11fea31001110836q5afe9dcn1022bd7d80228abe@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <ea11fea31001110836q5afe9dcn1022bd7d80228abe@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

> Is there a function that reads stdin without line buffering?

You should set some terminal attr:

   termios oldt;
   [...]
   tcgetattr(STDIN_FILENO,&oldt);
   termios newt = oldt;
   newt.c_lflag &= (~ICANON & ~ECHO);
   tcsetattr(STDIN_FILENO,TCSANOW,&newt);

and restore the old state when you're done:

   tcsetattr(STDIN_FILENO,TCSANOW,&oldt);

If you interrupt your program, you will see no echo, which is annoying. 
Type - blind mode - at the shell prompt: "reset" (don't worry, it only 
resets the terminal).

Gnome-terminal also clears the scrollback buffer upon "reset".
-- 
ern0.scene.plus4.amiga.code.muzak
Haben Sie Fragen?

