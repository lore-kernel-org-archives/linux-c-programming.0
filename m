From: iliali16 <iliali16@gmail.com>
Subject: Re: Multiplayer game
Date: Tue, 23 Feb 2010 14:58:58 -0800 (PST)
Message-ID: <27712027.post@talk.nabble.com>
References: <27707442.post@talk.nabble.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <27707442.post@talk.nabble.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org


Well I am sure I cannot use sockets it is stated. It is assumed that the game
is run on a unix/linux server and the users make use of their machines as
terminals so evryone controls his player in the game but can also see the
others beauce all players aim is to reach at some position in the map. who
reaches first wins the control is done by the arrows up/down/left/right. I
think using putty as terminal is the best so people would be able run the
game and if there is an open session of the game before they opened it it
will give them option to join or not so if they join they will be put in a
random free position and they will see the other players aiming at the goal
so they will be able to start playing imigitly. This is the way it should
work. About atomic functionality I was thinking about semaphores. Do you
think that is the way to go about it. I haven't got much time to finish my
design because it is high time start coding since I am not that good at C.
Thanks for all suggestions till now and for any future of these.10x agian

iliali16 wrote:
> 
> Hi Guys I am currently developing a multiplayer game for my assignment now
> I have problem since I am not a good C programmer and I am trying to
> develop a game which has to be multiplayer and each player should be able
> to access a map and move around on it and be able to see the other players
> moving as well. But how would I make them connect to the server since it
> will be remote and I can't make use of sockets (these are the
> requirments).Also how can I make the movements of each player atomic since
> I don't want the system to interupt one of the player and when it
> allocates the CPU back to it the other players have already been moved
> when the first player had to move before them. Thanks for any ideas since
> I want to do my proper design then implement. Thanks 
> 

-- 
View this message in context: http://old.nabble.com/Multiplayer-game-tp27707442p27712027.html
Sent from the linux-c-programming mailing list archive at Nabble.com.

