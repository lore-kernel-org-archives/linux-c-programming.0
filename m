From: Bogdan Cristea <cristeab@gmail.com>
Subject: Re: unnamed pipe and independent process
Date: Mon, 20 Dec 2010 08:27:38 +0200
Message-ID: <201012200827.38797.cristeab@gmail.com>
References: <AANLkTinutqx=tN3TRMtqa73E0cwnyfUop9FXWz5yvqdy@mail.gmail.com> <201012200758.32380.cristeab@gmail.com> <AANLkTi=k6LpYQh47kd5zk-YWyCf=emy+eicJ9PgEm+st@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:organization:to:subject
         :date:user-agent:references:in-reply-to:mime-version:content-type
         :content-transfer-encoding:message-id;
        bh=Rp8dM6ctInw9q0ud0Oj1+F4j7s4uxfRAlOfBIsCr0tM=;
        b=WgoYrfThraqW1nfjdoZVe47Kvq40rB65ZaNtHnNhGb8tanB2KOOA+MX51GByoxT0Ft
         arsLpDYDP0wJrGctv8abXxaC0L6FH8hwGC44mIgbzazDnIdGC+6coDoJqQigv3bwqr/m
         o2hNJUmhkGRQVnif1FNg0KuXiJBHawCI5kvWc=
In-Reply-To: <AANLkTi=k6LpYQh47kd5zk-YWyCf=emy+eicJ9PgEm+st@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: ratheesh k <ratheesh.ksz@gmail.com>, linux-c-programming@vger.kernel.org

On Monday 20 December 2010 08:21:28 you wrote:
> Could i use popen in some way ? somebody told me there is way around .

It is possible to pass a file descriptor through UNIX sockets between 
unrelated processes. You could pass using this approach the file descriptors 
returned by popen.
