From: Hendrik Visage <hvjunk@gmail.com>
Subject: Re: Co-thread for parallel processing
Date: Sat, 3 Dec 2011 23:13:46 +0200
Message-ID: <CADtGFvmHhhnafSkXJHLRQqhc_dd-r5DMf7t2355FvP1nqZ6iGw@mail.gmail.com>
References: <CAA6iF_4z_MPpU8Eq+i+PT-+VgpX_ZXX5FwOwa2NpLxW_gyzTSg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=cAhcmkoQ8y8Lt91LvueLOanXKMGK63OuR2MAa++jEwI=;
        b=DCCBpXF0RKjjLVUtQK0fBkyN9+SGFIJWkri6bjEe939htAPQnwWeb81VS2EHoP/dnu
         mQ3podo+Hc7GFiKeWVIrmYZSBIHSKX5b0a3CMC/ljLTgUekNwlQHFGZjzfg/z9n4mJF9
         qDqjDp3Qyh3LiUYDQc3MKU+r3kEis5bNv7QvQ=
In-Reply-To: <CAA6iF_4z_MPpU8Eq+i+PT-+VgpX_ZXX5FwOwa2NpLxW_gyzTSg@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Randi Botse <nightdecoder@gmail.com>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>

On Fri, Dec 2, 2011 at 11:23 AM, Randi Botse <nightdecoder@gmail.com> w=
rote:
> 1. What the proper way to the main thread to wait for all co-threads
> until finished?

I'll do a semop() with sem_op=3D1 in each thread's start, and a
sem_op=3D-1 when each thread's finished.
Then in the main thread I'll wait with a sem_op =3D 0.

> 2. After calling pthread_cond_signal() or pthread_cond_broadcast()
> followed by sleep()/nanosleep(),
> =A0 =A0the condition variable looks like not signaled, (the co-thread
> routine doesn't run). What make this?

Please show the code snippet in the co-thread that is not working as
well as the mainthread's method you try to wake up the co-threads
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
