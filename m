From: "Mariano Moreyra" <moremari@aca.org.ar>
Subject: RE: viewing machine code
Date: Thu, 11 Dec 2003 11:06:41 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <000401c3bff0$00babc40$0c81640a@aca.org.ar>
References: <000d01c3bf64$d94e0670$ed64a8c0@descartes>
Reply-To: <mariano_moreyra@aca.org.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <000d01c3bf64$d94e0670$ed64a8c0@descartes>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "'John T. Williams'" <jtwilliams@vt.edu>, linux-c-programming@vger.kernel.org

There is a way to see the hex machine code...
May be there are better ways...but this is the only way that I found to=
 see
hex machine code with gdb
=46irst, you have to see the memory address where that instruction is.
You can do that with "info line"

Next, you have to use the command "x/NFU ADDR" where

 N, the repeat count
     The repeat count is a decimal integer; the default is 1.  It
     specifies how much memory (counting by units U) to display.

 F, the display format
     The display format is one of the formats used by `print', `s'
     (null-terminated string), or `i' (machine instruction).  The
     default is `x' (hexadecimal) initially.  The default changes each
     time you use either `x' or `print'.

 U, the unit size
     The unit size is any of

    `b'
          Bytes.

    `h'
          Halfwords (two bytes).

    `w'
          Words (four bytes).  This is the initial default.

    `g'
          Giant words (eight bytes).

     Each time you specify a unit size with `x', that size becomes the
     default unit the next time you use `x'.  (For the `s' and `i'
     formats, the unit size is ignored and is normally not written.)

 ADDR, starting display address
     ADDR is the address where you want GDB to begin displaying memory.
     The expression need not have a pointer value (though it may); it
     is always interpreted as an integer address of a byte of memory.
     *Note Expressions: Expressions, for more information on
     expressions.  The default for ADDR is usually just after the last
     address examined--but several other commands also set the default
     address: `info breakpoints' (to the address of the last breakpoint
     listed), `info line' (to the starting address of a line), and
     `print' (if you use it to display a value from memory).


specifying how many bytes does your instruction have, and giving the me=
mory
address you obtained with info line
It's not a direct way, but it works :)
If someone has a better way to do this with gdb....let me know please!!

Mariano Moreyra

P.S: Sorry about my english!!! I have to practice more, and take lesson=
s!!
:)




-----Mensaje original-----
De: linux-c-programming-owner@vger.kernel.org
[mailto:linux-c-programming-owner@vger.kernel.org]En nombre de John T.
Williams
Enviado el: Mi=E9rcoles, 10 de Diciembre de 2003 18:31
Para: linux-c-programming@vger.kernel.org
Asunto: viewing machine code


is there anyway to get gdb to display the hex code being exicuted?

ie prentend that 0xF8 is the command for add, and I am exicuting the co=
de

addl 04,
is there a way to get gdb to type
0xF804 when exicuting that command.  sort of a step through the program=
 at
the machine code level?


-
To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
