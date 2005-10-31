From: Steve Graegert <graegerts@gmail.com>
Subject: Re: Detecting whether a Message Queue with a given qid exists?
Date: Mon, 31 Oct 2005 08:30:25 +0100
Message-ID: <6a00c8d50510302330m193cdc91v93b745be3b2f456f@mail.gmail.com>
References: <b115cb5f0510302311ma397fb1k65ec88a605f33adf@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <b115cb5f0510302311ma397fb1k65ec88a605f33adf@mail.gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

On 10/31/05, Rajat Jain <rajat.noida.india@gmail.com> wrote:
> Hi,
>
> This is the reagrding the message queue mecahnism of sys V IPC.
>
> Is there a way to find out that whether a message queue with a
> particular qid exists?

msgget returns a valid queue identifier.  To see if the queue still
exists when you try to place a message into the queue via msgsend,
check for EINVAL, which is returned if the queue identifier is not
valid (any more):

int result, msqid;

struct m {
	long type;
	char text[64];
} msg;

m.type = 1;
strcpy(m.text, "Hi, I am a message");

if ((queue_id = msgget(KEY, 0666)) == -1) {
	/* handle error */
}
... /* do some stuff here */
result = msgsnd(queue_id, (void *)&m, sizeof(m.text), IPC_NOWAIT);
... /* check error here */
	
Hope this helps.



	\Steve
