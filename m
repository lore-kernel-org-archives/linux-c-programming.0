From: soraberri <421246@posta.unizar.es>
Subject: anything to do with pointer to functions maybe?
Date: Thu, 23 Dec 2004 11:24:39 +0100
Message-ID: <cqe6ed$ldf$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-c-programming@vger.kernel.org

Hi all!
I'm having troubles understanding code:

what type is __sighandler_t if it is defined this way:?
typedef void (*__sighandler_t) (int);

and then, what does this definition  mean:
  #define SIG_IGN  ((__sighandler_t) 1)=09

thanks very much if you know and you tell me ;=B7)

regards

-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
