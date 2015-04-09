From: =?UTF-8?Q?Jo=c3=abl_Kr=c3=a4hemann?= <weedlight@gmail.com>
Subject: functional tests for atomic operations
Date: Thu, 09 Apr 2015 23:37:09 +0000
Message-ID: <55270D25.9040407@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=fr2lK59t+KEbBAU0ghdoqAbjnrVFjJMLL5IHvqfaUs0=;
        b=M64qMflwAPq3AysWSKRfLFMfZyE/AtxrLQHlEh1eiIxeFmkfPCtjqlrp4gVgwiAKfC
         AppuIsKkM3iHHQiV/+LQqGF9GouSjTSbs+tRWq3xst1MPdVNxAb8VuVxTi88wjogl722
         Ad/saqcXkIJ6kQ2A0TqbdH9FOuM5ZOVVH85YwceSa9wDgIKdpXzmBiE4YPhoQJsQk2tg
         MGDyaVwC9HmGQbX/7HtBgerf8X3MLIET+MDychZezvsXSQjJWIb0djpIBT++6KHE4cbC
         LvICOp+T3qRCV/x/q8BCUvxMZDAMBpwohLUlr6uozBT4Dd0jLnO72x31IUiIapV8aFIJ
         aBdw==
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-c-programming@vger.kernel.org

Hi, earlier me experienced problems by using atomic operations on=20
GNU/Linux. Are there functional tests out there me could run? The root=20
case is uncertain because there were known issues like unsigned long=20
overflow and concurrent read access.

I'm developing a music sequencer and dealing often with threads. For no=
w=20
me did a work-around using mutices. But me intend to use atomic=20
operations again because it makes more intuitive and simpler.

http://gsequencer.org is hosted on GitHub as=20
https://github.com/weedlight/ags-devel

=46or the grand picture the engine is running and me adjust dial widget=
 to=20
modify AgsPort field by atomic operations.

At the moment me tries to bring 0.4.2 version to a successful end,=20
marked as stable.

kind regards,
Jo=C3=ABl

--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
