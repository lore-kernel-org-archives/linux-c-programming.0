From: "Ardhan Madras" <ajhwb@knac.com>
Subject: Re: Socket programming
Date: Mon, 23 Mar 2009 08:03:26 -0700
Message-ID: <20090323080326.1C33F888@resin13.mta.everyone.net>
Reply-To: <ajhwb@knac.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Glynn Clements <glynn@gclements.plus.com>
Cc: linux-c-programming@vger.kernel.org

In the glibc man about send() and recv(), it says:

" The only difference between send() and write() is the presence of flags.  
  With zero  flags parameter,  send()  is equivalent to write(). ..."

--- ajhwb


--- glynn@gclements.plus.com wrote:

Apart from the comments which have already been made:

There's no reason to use send() and recv() if the flags argument is
zero. You may as well use read() and write(). Or convert the
descriptor to a FILE* with fdopen() and use fread() and fwrite().

-- 
Glynn Clements <glynn@gclements.plus.com>




_____________________________________________________________
Listen to KNAC, Hit the Home page and Tune In Live! ---> http://www.knac.com
