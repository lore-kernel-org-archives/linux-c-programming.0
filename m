From: "Jan Smout" <jan.smout@gmail.com>
Subject: Re: offsets of fields in a structure
Date: Fri, 19 Oct 2007 21:50:14 +0200
Message-ID: <7dde11ce0710191250t58493199ka61cde50a27cb6e7@mail.gmail.com>
References: <4718CCE2.9060202@infocamere.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=sk+OvGP4QD9M49J7iSbeIyT5sUehwU/XLc96vz02bMk=;
        b=Bb6JfZJHN6UXeJZ3eR4/3aGAbnll3PokEMpMjDeNuqHe894CP8sSkf0ePD+KJQv+M6pyZDPpNnI7iwDjejNCGNUC3QX/DSRX1VdyrerCzTAmrXNx7/znslFL6VxyBwBZAOoMIrWgIPppvFraWJnu6IS7kxHKc7/wjS27ymzELNo=
In-Reply-To: <4718CCE2.9060202@infocamere.it>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Giulio Rossato <giulio.rossato@infocamere.it>
Cc: linux-c-programming@vger.kernel.org

On 19/10/2007, Giulio Rossato <giulio.rossato@infocamere.it> wrote:
> I want write a function that receives as parameters a start address and
> a "description of a structure" and returns the offsets of the fields.
> The structure is not known at compile time. The offsets should be
> calculated at runtime and the code should be independent of the machine.
> How should be written this function?

Have a look at the Linux manpage for the "offsetof(type,
member)"-macro from stddef.h. It will probably not be exactly what
you're looking for, but might be a starting point which gets you
going.

Jan
