From: Canaan Kao <canaan.kao@gmail.com>
Subject: Re: Socket programming
Date: Sun, 22 Mar 2009 21:00:14 +0800
Message-ID: <160bbd1a0903220600g5b93ddaau32e160c856bb77e6@mail.gmail.com>
References: <20090322054220.1C330C2D@resin14.mta.everyone.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=kIyJE15F4yq9uUYTnAyVBwCHc5OcfYbyY5M3bWwq1OE=;
        b=heZCPdzgEgy7t+a3Up6QhweRQ9AZ9UaiHUcbewEdj1kSAFkgDZ1VP0D9KwEOpLgXwH
         HaB6/qYLrFem7a8vN6gjCWiH8JlCUz/sfombN1TWGM+ex1ltBHj5CtNP+A3l+Fs15Tzi
         5/QLb78FAfrVQZHgXZ/c3cfnHlkqgbFzPDQGA=
In-Reply-To: <20090322054220.1C330C2D@resin14.mta.everyone.net>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: ajhwb@knac.com
Cc: linux-c-programming@vger.kernel.org

Dear Ardhan,

You can add a mySize data member in struct foo.

struct foo
 {
  unsigned mySize;
  char *name;
  char *pix;
  int id;
 };


 struct foo *bar =3D malloc (sizeof(struct foo));

 if(NULL!=3Dbar)bar->mySize=3Dsizeof(struct foo);

 /* fill the structure, then send */

=46inally, your receiver will get the size of foo in the beginning of t=
he stream.

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
> =A0char name[16];
> =A0char pix[1024];
> =A0int id;
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
> =A0char *name;
> =A0char *pix;
> =A0int id;
> }
>
> struct foo *bar =3D malloc (sizeof(struct foo));
> /* fill the structure, then send */
>
> How to receive the data? since there are no way
> to the receiver to know data sizes?
>
> Thanks for your help.
>
>
> _____________________________________________________________
> Listen to KNAC, Hit the Home page and Tune In Live! ---> http://www.k=
nac.com
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
