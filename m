From: Martin Buchan <M.J.Buchan@gre.ac.uk>
Subject: Re: segfault with strdup
Date: Tue, 20 May 2003 14:12:54 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030520131254.GC674@gre.ac.uk>
References: <20030520112034.GZ674@gre.ac.uk> <002d01c31ecb$8c947600$852005d5@carlos>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <002d01c31ecb$8c947600$852005d5@carlos>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org
Cc: Chris Nanakos <nanakos@wired-net.gr>

On Tue, May 20, 2003 at 03:25:31PM +0300, Chris Nanakos wrote:
> Can you send the source code???
> 

Here is an excerpt from the XML file as well so you can see what im
dealing with. (Althyough, i dont think it is a libxml problem going
by the errors given back by ddd)


<?xml version="1.0"?>
 <root>
   <newterm name="New Terminal">
     <termxpm>terminal.xpm</termxpm>
     <termcmd>rxvt -fn 6x13 -sb -sl 1000 -T Unix@CMS</termcmd>
   </newterm>
   <section name="Internet">
     <xpm>browsers.xpm</xpm>
     <submenu name="Web Browsers">
       <app name="Mozilla Web Broswer">
         <command>mozilla http://unix.cms.gre.ac.uk</command>
       </app>
     </submenu>
   </section>
   <section name="Internet">
     <xpm>browsers.xpm</xpm>
     <submenu name="Web Browsers">
       <app name="Netscape Navigator">
         <command>netscape http://unix.cms.gre.ac.uk</command>
       </app>
     </submenu>
   </section>
   <section name="Internet">
     <xpm>browsers.xpm</xpm>
     <submenu name="Web Browsers">
       <app name="Lynx Text Only Browser">
         <command>rxvt -fn 6x13 -e lynx http://unix.cms.gre.ac.uk</command>
       </app>
     </submenu>
   </section>
  
<...snipped...>
  
  
It fails on "Netscape Navigator" when i install to a different directory than 
/home/bm98/prg/gtk-menu/current

If i change it to Netscape, it then works but fails on "Lynx Text Only Browser" and so on.

However, it all works if i run it in /home/bm98/prg/gtk-menu/current

Martin
