From: John Richard Moser <nigelenki@comcast.net>
Subject: Re: Variable Declaration Order
Date: Mon, 05 Jul 2004 11:27:05 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <40E97349.1080008@comcast.net>
References: <40E44FBD.3040805@comcast.net> <40E48EAA.4030106@ig.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <40E48EAA.4030106@ig.com.br>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Luciano Moreira - igLnx <lucianolnx@ig.com.br>
Cc: linux-c-programming@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

No, not at all.  I am asking about proper variable declaration order.
Try rereading the first message all the way through.

Luciano Moreira - igLnx wrote:
| What are you suggesting a use of pointers arrangement ?
|
| Are you thinking to use them to point to the next byte of the structure ?
| If yes, I suggest you to user "union", and to forget the ideia of
| attributes arragement, it could be dangerous and dependent of compilers
| options.
| I no, forget all I said.
|
| SAMPLE:
|
| struct incorrect {
|   char *p;
|   char buf[5];
| };
|
| struct correct {
|   union both {
|      char *p;
|      char buf[5];
|      // char *p; // could be here instead.
|   };
| };
|
| Luciano
|

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFA6XNIhDd4aOud5P8RAoDUAJoCQgN8HQCFlNkWfikmq3rv4oZAggCfQt+L
SqnjXBeSADVxIbgPG/O28sM=
=V4u1
-----END PGP SIGNATURE-----
