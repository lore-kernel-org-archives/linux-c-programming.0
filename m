From: Ilya Guterman <iliyagutermann@gmail.com>
Subject: How to disable application run
Date: Tue, 4 Oct 2016 14:33:27 +0300
Message-ID: <CAMraO6_rYr5ArwSw6M22vmQXe-jCfiqRRn8_EGSgXMYnTYMYkw@mail.gmail.com>
References: <88e789ba-91be-e2ac-3bf4-f771052be870@interia.pl> <CAMraO6879JeigufNChzYwrY5faMEjD8ExNJDAnA1L-WM_NwkQg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=erjQyEuy34tIyqiNHgShLJ+1JpHnNcDjukyjc5cgK54=;
        b=QpFZpXnEjUbyQLw6HukF3mEdqEfg8i5Me33gr/eL4qro80aPDgGJxk7o0Bch87ka06
         /uFMas6GWDkvrAzzVZa8hf7ksx3adcNWOx4lSy6BLrtOBd6BHGrOSNujkERr+odcYHL4
         UzEj6pNBllMwZqo8+jq8A9uGpewn/HSN+CBsxuX8+ZsuZC5fgATRXkOIluaSCvfcxarq
         IIAvzUaPKYamVKDzsPtxml6xmb1eb4TFaa5h//X77SKTMpDDDIa0lgRDZSkfuJY1uDKr
         cZb08JsO5U8Vdvqz94uSfBLwEK005Rtw99F9Piub1azLsLMV5nWSO/Z+tO13H0AzsVJa
         TlmA==
In-Reply-To: <CAMraO6879JeigufNChzYwrY5faMEjD8ExNJDAnA1L-WM_NwkQg@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?UTF-8?Q?Marcin_G=C5=82ogowski?= <marcin.glogowski@interia.pl>
Cc: "linux-c-programming@vger.kernel.org" <linux-c-programming@vger.kernel.org>

Hey CiN,

You can write LKM which overrides the execve syscall and checks
wherever the filename is blacklisted, but overriding syscall is
considered bad.
Maybe there is a better solution I am not aware of.

Regards amfern.
