From: =?ISO-8859-1?Q?Dar=EDo_Mariani?= <dmarian@fi.uba.ar>
Subject: Parsing multipart MIME
Date: Fri, 15 Aug 2003 15:18:57 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3F3D2411.70106@fi.uba.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; 
To: linux-c-programming@vger.kernel.org

Hello:
    I'm building a minimal MIME parser, mainly to separate the parts in=
 a
multipart/form-data in a web POST. I was wondering if anyone made the
regular expression for interpreting it. I thought of this:

multip  ::=3D start anychar* (delim anychar*)* end?

anychar ::=3D <any character including \0>
delim   ::=3D <delimiter>
start   ::=3D "--" delim "\r\n"
middle  ::=3D "\r\n--" delim "\r\n"
end     ::=3D "\r\n--" delim "--"

    I have little experience with grammars so this expression may be
wrong. Any ideas? thanks,

          Dar=EDo


-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
