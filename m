From: Elias Athanasopoulos <elathan@phys.uoa.gr>
Subject: Re: writing logfile
Date: Tue, 25 Feb 2003 16:10:10 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030225161010.D28473@neutrino.particles.org>
References: <20030225105740.A31033@genestate.com> <20030225133810.C28473@neutrino.particles.org> <20030225124937.B31033@genestate.com> <3E5B6B11.3020001@veritel.com.br>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3E5B6B11.3020001@veritel.com.br>; from william@veritel.com.br on Tue, Feb 25, 2003 at 10:09:37AM -0300
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "William N. Zanatta" <william@veritel.com.br>
Cc: Mat Harris <mat.harris@genestate.com>, linux-c-programming@vger.kernel.org

On Tue, Feb 25, 2003 at 10:09:37AM -0300, William N. Zanatta wrote:
>    ">   loghandle = open(logfile, O_CREAT);"
> 
>    Maybe I'm wrong, but I think this previous call just creates a file 
> and doesn't make it available for reading/writing in any way. Is that 
> right brothers???

I think it will create it and open it in read-only mode, since O_RDONLY
is defined as 0 and thus O_RDONLY | O_CREAT equals to O_CREAT.

It is quite missleading, though, so feeding open() explicitly with the
flags it asks is the right thing to do, IMHO.

Elias

-- 
University of Athens			I bet the human brain 
Physics Department				is a kludge --Marvin Minsky 

	
