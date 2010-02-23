From: iliali16 <iliali16@gmail.com>
Subject: Multiplayer game
Date: Tue, 23 Feb 2010 09:50:54 -0800 (PST)
Message-ID: <27707442.post@talk.nabble.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org


Hi Guys I am currently developing a multiplayer game for my assignment now I
have problem since I am not a good C programmer and I am trying to develop a
game which has to be multiplayer and each player should be able to access a
map and move around on it and be able to see the other players moving as
well. But how would I make them connect to the server since it will be
remote and I can't make use of sockets (these are the requirments).Also how
can I make the movements of each player atomic since I don't want the system
to interupt one of the player and when it allocates the CPU back to it the
other players have already been moved when the first player had to move
before them. Thanks for any ideas since I want to do my proper design then
implement. Thanks 
-- 
View this message in context: http://old.nabble.com/Multiplayer-game-tp27707442p27707442.html
Sent from the linux-c-programming mailing list archive at Nabble.com.

