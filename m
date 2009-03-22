From: "Ardhan Madras" <ajhwb@knac.com>
Subject: Re: Socket programming
Date: Sun, 22 Mar 2009 06:31:16 -0700
Message-ID: <20090322063116.1C31F627@resin17.mta.everyone.net>
Reply-To: <ajhwb@knac.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Canaan Kao <canaan.kao@gmail.com>
Cc: linux-c-programming@vger.kernel.org

Dear Canaan,

Thanks for your reply. It's a great clue :)
btw, i have one more question... 

In the receiver, do i need to allocate for example
bar->name member manually? or it's done by recv() ?


--- canaan.kao@gmail.com wrote:

From:	Canaan Kao <canaan.kao@gmail.com>
To:	ajhwb@knac.com
Cc:	linux-c-programming@vger.kernel.org
Subject: Re: Socket programming
Date:	Sun, 22 Mar 2009 21:00:14 +0800

Dear Ardhan,

You can add a mySize data member in struct foo.

struct foo
 {
  unsigned mySize;
  char *name;
  char *pix;
  int id;
 };


 struct foo *bar = malloc (sizeof(struct foo));

 if(NULL!=bar)bar->mySize=sizeof(struct foo);

 /* fill the structure, then send */

Finally, your receiver will get the size of foo in the beginning of the stream.

Best regards,
Canaan

On Sun, Mar 22, 2009 at 8:42 PM, Ardhan Madras <ajhwb@knac.com> wrote:
> Hi All,
>
> I was written small network utility in Linux 2.6, glibc 2.7.
> I have been using send() and recv() system call in SOCK_STREAM
> to send or receive fixed size data. for example, i write my data
> structure like this:
>
> struct foo
> {
>  char name[16];
>  char pix[1024];
>  int id;
> } bar;
>
> If i want to send or receive data i just call
>
> send (socket, &bar, sizeof(struct foo), 0);
>
> or to receive:
> recv (socket, &bar, sizeof(struct foo), 0);
>
> My problem is how to receive dynamic sized data? for
> example this structure:
>
> struct foo
> {
>  char *name;
>  char *pix;
>  int id;
> }
>
> struct foo *bar = malloc (sizeof(struct foo));
> /* fill the structure, then send */
>
> How to receive the data? since there are no way
> to the receiver to know data sizes?
>
> Thanks for your help.
>
>
> _____________________________________________________________
> Listen to KNAC, Hit the Home page and Tune In Live! ---> http://www.knac.com
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html




_____________________________________________________________
Listen to KNAC, Hit the Home page and Tune In Live! ---> http://www.knac.com
