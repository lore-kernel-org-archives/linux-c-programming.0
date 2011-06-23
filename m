From: Alessandro Suardi <alessandro.suardi@gmail.com>
Subject: Re: extra slash in current path
Date: Thu, 23 Jun 2011 15:17:54 +0200
Message-ID: <BANLkTinaPJM3LhEVwFxtEGKuVXOyVOzrzg@mail.gmail.com>
References: <BANLkTi=y1roManmZGMLBXSFbBVqK_KqDZg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=5fPAnoanBDmyuHeARBf947PgWjD6Z1Ua8SVvmdS5xNE=;
        b=XvDDLqfcCYLPuzjh3n3N9SA+BAfn5PgvwnDRtr3JSgWCQhbmmpQ1b/gHRRf7XqHW/P
         8aO927O1B9NOM/p6J72+bNgXzosaYZSn8ZPl9rZ6k70mmK7dFc4c6TNYUgt8vHnn+ZCG
         NP8oqt1N9BlOJQdo2ZlCRQnoTuwnqvsnJwvI4=
In-Reply-To: <BANLkTi=y1roManmZGMLBXSFbBVqK_KqDZg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: yuyichao-mit <yuyichao@mit.edu>
Cc: linux-kernel@vger.kernel.org, linux-c-programming@vger.kernel.org

On Thu, Jun 23, 2011 at 3:14 PM, yuyichao-mit <yuyichao@mit.edu> wrote:
> The problem is like this:
>
> $ cd /
> $ pwd
> /
>
> $ cd /
> $ pwd
> //
>
> $ cd ///
> $ pwd
> /
>
> Why can there be a extra slash (and exactly one) in current path? Is
> this designed on purpose?
> This is not really a big deal but I think it can confuse some program=
=2E

Multiple consecutive slashes should not confuse any program.

http://pubs.opengroup.org/onlinepubs/009695399/basedefs/xbd_chap03.html=
#tag_03_266

--alessandro

=A0"There's always a siren singing you to shipwreck"

=A0=A0 (Radiohead, "There There")
