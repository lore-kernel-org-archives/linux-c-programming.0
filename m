From: Ibraheem Umaru-Mohammed <iumarumo@eidosnet.co.uk>
Subject: Re: substring offset
Date: Sat, 31 Aug 2002 22:21:22 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020831212122.GB1372@micromuse.com>
References: <Pine.GSU.4.21.0208311110210.17325-100000@garcia.efn.org>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.GSU.4.21.0208311110210.17325-100000@garcia.efn.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ken Martwick <kenm@efn.org>
Cc: linux-c-programming@vger.kernel.org

["Ken Martwick"="Ken"]
Ken >> In this code snippet,
Ken >>  
Ken >>           findptr = strstr(realine[n], search);
Ken >>           if(findptr)
Ken >>                {
Ken >>                diff = (int)(findptr - realine[n]);
Ken >>  
Ken >> why isn't "diff" the offset of "search" in "realine[n]"?  How
Ken >> can I calculate the offset?
Ken >> Ken Martwick
Ken >> 

You want to use the address of realine[n]. i.e
	
			,---- <code> 
			| ...
			| findptr = strstr(&realine[n],search);
			| if( findptr )
			| {
			|   diff = findptr - &realine[n];
			|   ...
			`----<code/>

Kindest regards,

				--ibz.

-- 
				Ibraheem Umaru-Mohammed 
					"ibz"
			umarumohammed (at) btinternet (dot) com
