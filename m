From: "Earl R. Lapus" <elapus@ntsp.nec.co.jp>
Subject: ncurses problem
Date: Thu, 10 Feb 2005 18:24:29 +0800
Message-ID: <420B365D.7090109@hq.ntsp.nec.co.jp>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------010600080108060508040602"
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org

This is a multi-part message in MIME format.
--------------010600080108060508040602
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

hi there,

i have a problem using ncurses. i attached the source code with this email.
this program displays two text fields. my problem occurs when i add this,
`char buff[256];` after the declaration, `int ch;`.
after adding the character array declaration, the text fields won't 
display anymore.
any ideas?

-earl-.

-- 
==========================================
  There are seven words in this sentence.
==========================================


--------------010600080108060508040602
Content-Type: text/x-csrc;
 name="nform.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="nform.c"

#include <form.h>


int main(void)
{
    int ch;

    FORM *formp;
    FIELD *fields[2];

    initscr();
    cbreak();
    noecho();
    keypad(stdscr, TRUE);

    fields[0] = new_field(1, 32, 4, 18, 0, 0);
    fields[1] = new_field(4, 32, 6, 18, 0, 0);

    set_field_back(fields[0], A_STANDOUT);
    field_opts_off(fields[0], O_AUTOSKIP); 

    set_field_back(fields[1], A_STANDOUT);
    field_opts_off(fields[1], O_AUTOSKIP);

    formp = new_form(fields);
    post_form(formp);
    refresh();

    mvprintw(4, 5, "IP Address:");
    mvprintw(6, 5, "Message:");
    move(4, 18);
    refresh();

    while( (ch = getch()) != KEY_F(1) )
    {
       switch(ch)
       {
          case KEY_DOWN: 
               form_driver(formp, REQ_NEXT_FIELD);
               form_driver(formp, REQ_END_LINE); 
               break;

          case KEY_UP:
               form_driver(formp, REQ_PREV_FIELD);
               form_driver(formp, REQ_END_LINE); 
               break;

          default: 
               form_driver(formp, ch);
               break;
       }
    }

    unpost_form(formp);
    free_form(formp);
    free_field(fields[0]);
    free_field(fields[1]);
  
    endwin();

    return 0;
}

--------------010600080108060508040602--

