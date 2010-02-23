From: Khalifa Rouis <rouis.khalifa@gmail.com>
Subject: Re: Multiplayer game
Date: Tue, 23 Feb 2010 19:11:28 +0100
Message-ID: <8f760ca11002231011p649cda4cib80243bd287884ec@mail.gmail.com>
References: <27707442.post@talk.nabble.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=8CRdyhfiJ0V/yGy/tW0eepKA6TZaTVI6Wzau/6PKY6s=;
        b=XRnzQDFRxEMCsP39VRjc1DDKRJNCZPFd7Ze/MS12yly/YYA6kDQMsyyk7Nkak1tME2
         a+ZIK+luwATKXOBrCM1mbk0IuQeVNVJQ8ceV+xsSIsDfe7yOjO68Rr4e3j453K8naBUB
         +LLy2KG52qfJHYDmxJqwx4Pb0K6+dS6+yL+aI=
In-Reply-To: <27707442.post@talk.nabble.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: iliali16 <iliali16@gmail.com>
Cc: linux-c-programming@vger.kernel.org

Hi,

This is a taught situation you have here ...

Well, IMHO, you'll need sockets no matter what design/implementation
you think of. So you probably misunderstood the requirements. (they
probably prohibit the use of a certain type of sockets or protocols,
=2E..)
About the atomic movements, one way would be considering critical
sections in your code and using some synchronization algorithms
(dining philosophers problem).

Hope this will help and good luck with your assignment

On 23 February 2010 18:50, iliali16 <iliali16@gmail.com> wrote:
>
> Hi Guys I am currently developing a multiplayer game for my assignmen=
t now I
> have problem since I am not a good C programmer and I am trying to de=
velop a
> game which has to be multiplayer and each player should be able to ac=
cess a
> map and move around on it and be able to see the other players moving=
 as
> well. But how would I make them connect to the server since it will b=
e
> remote and I can't make use of sockets (these are the requirments).Al=
so how
> can I make the movements of each player atomic since I don't want the=
 system
> to interupt one of the player and when it allocates the CPU back to i=
t the
> other players have already been moved when the first player had to mo=
ve
> before them. Thanks for any ideas since I want to do my proper design=
 then
> implement. Thanks
> --
> View this message in context: http://old.nabble.com/Multiplayer-game-=
tp27707442p27707442.html
> Sent from the linux-c-programming mailing list archive at Nabble.com.
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.ht=
ml
>



--=20
Khalifa ROUIS
rouis.khalifa@gmail.com
http://pagesperso.univ-brest.fr/~e20603429/
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
