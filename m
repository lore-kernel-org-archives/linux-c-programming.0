From: Steve Graegert <graegerts@gmail.com>
Subject: Re: Detecting whether a Message Queue with a given qid exists?
Date: Tue, 1 Nov 2005 10:11:55 +0100
Message-ID: <6a00c8d50511010111r23756139i92f675a3a865e69@mail.gmail.com>
References: <b115cb5f0510302311ma397fb1k65ec88a605f33adf@mail.gmail.com>
	 <6a00c8d50510302330m193cdc91v93b745be3b2f456f@mail.gmail.com>
	 <b115cb5f0510312222q14d4d717y5723a75f8848d4d9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <b115cb5f0510312222q14d4d717y5723a75f8848d4d9@mail.gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rajat Jain <rajat.noida.india@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On 11/1/05, Rajat Jain <rajat.noida.india@gmail.com> wrote:
> >
> > msgget returns a valid queue identifier.  To see if the queue still
> > exists when you try to place a message into the queue via msgsend,
> > check for EINVAL, which is returned if the queue identifier is not
> > valid (any more):
> >
> > int result, msqid;
> >
> > struct m {
> >        long type;
> >        char text[64];
> > } msg;
> >
> > m.type = 1;
> > strcpy(m.text, "Hi, I am a message");
> >
> > if ((queue_id = msgget(KEY, 0666)) == -1) {
> >        /* handle error */
> > }
> > ... /* do some stuff here */
> > result = msgsnd(queue_id, (void *)&m, sizeof(m.text), IPC_NOWAIT);
> > ... /* check error here */
> >
> > Hope this helps.
> >
>
> Hi,
>
> Thanks for the help. I understood this. But the above method
> uses msgsnd. So if the Queue actually exists, then a message
> will ACTUALLY be inserted. Given a qid, I want to check if a
> queue with that ID exists, without actually inserting a message.
> Is there a way or the only way out is try to insert a message,
> and if successful, remove that message :-(

Try msgctl with the IPC_STAT command:

	#include <sys/msg.h>
	int msgctl(int msqid, int cmd, struct msqid_ds *buf);

If the queue ID is not valid this call fails with EINVAL and buf is not filled.

	\Steve
