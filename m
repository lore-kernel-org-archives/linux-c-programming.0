From: "William N. Zanatta" <william@veritel.com.br>
Subject: Re: ncurses help
Date: Wed, 10 Sep 2003 12:32:11 -0300 (BRT)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.56.0309101206290.3269@halley.i-veritel.com.br>
References: <20030910122511.GC15788@3d-computers.co.uk>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20030910122511.GC15788@3d-computers.co.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Harrison <matth@3d-computers.co.uk>
Cc: linux-c-programming@vger.kernel.org


  Try changing getstr() to wgetstr(). When doing window manipulation you
must use the functions with support to WINDOW pointers. If you don't,
you'll get the results you're experiencing, because getstr() comes into
action when it is reached while wgetstr() only comes into action after the
wrefresh().

  Also, it showed some problems with placement of the stuff.

  You have set login_window to (login_win.startx, login_win.starty) from
0,0 of the mainscreen. But, when you write stuff into that new window, you
must set the (x,y) from the login_window. iE, here I had:

  login_win.starty -> 7
  login_win.startx -> 25

  thus, after creating the window, (25,7)-terminal turns to
(0,0)-login_window.

  That's it you're working with absolute values when you should work with
relative.

  After all your code turned to...

<inventory.c>
   was
        attron(COLOR_PAIR(1));
        mvwprintw(login_window, ..., ..., "Username: ");
        mvwprintw(login_window, ..., ..., "Password: ");
        attroff(COLOR_PAIR(1));

   changed to

        wattron(login_window, COLOR_PAIR(1));
        mvwprintw(login_window, 1, 1, "Username: ");
        mvwprintw(login_window, 2, 1, "Password: ");
        wattroff(login_window, COLOR_PAIR(1));

   --------

   was
        echo();
        wmove(login_window, ..., ...);
        getstr(username);
        wmove(login_window, ..., ...);
        getstr(password);
        noecho();

   changed to

        echo();
        wmove(login_window, 1, 11);
        wgetstr(login_window,username);
        wmove(login_window, 2, 11);
        wgetstr(login_window,password);
        noecho();

</inventory.c>

  Hope I've helped... =]

  Just a note, you should use wgetnstr() to limit the length of input
data.

  william
