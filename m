From: Jose Celestino <japc@co.sapo.pt>
Subject: Re: Linux syscall list
Date: Wed, 6 Aug 2003 11:47:34 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030806104734.GB1319@co.sapo.pt>
References: <200308050906.33542.rafael@thinkfreak.com.br>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200308050906.33542.rafael@thinkfreak.com.br>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rafael Costa dos Santos <rafael@thinkfreak.com.br>
Cc: linux-c-programming@vger.kernel.org

Words by Rafael Costa dos Santos [Tue, Aug 05, 2003 at 09:06:33AM +0000]:
> Hi all,
> 
> Where can I find the last linux syscall list ?
> 

In the source of course:

cd /usr/src/linux

egrep -hr '^asmlinkage.+\ +sys_.+\(' *

-- 
Jose Celestino | http://xpto.org/~japc/files/japc-pgpkey.asc
----------------------------------------------------------------
"Lately, the only thing keeping me from becoming a serial killer is
my distaste for manual labor."        -- Dilbert
