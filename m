From: =?ISO-8859-1?Q?Dar=EDo_Mariani?= <mariani.dario@gmail.com>
Subject: Thread scheduling on an SMP
Date: Thu, 23 Dec 2004 10:14:17 -0300
Message-ID: <84bd26ef04122305146c8f8a89@mail.gmail.com>
Reply-To: =?ISO-8859-1?Q?Dar=EDo_Mariani?= <mariani.dario@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-c-programming@vger.kernel.org

Hello:
  I have a machine with 4 processors, and I wold like to make the
following: Set 1 processor to do general stuff using the default
scheduler and the other three working on my program exclusively, with
the realtime or my own thread scheduler.
  Is this possible?, thanks for any comment or links to documentation
you can give me.

              Dar=EDo
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
