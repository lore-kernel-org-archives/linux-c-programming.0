From: Progga <abulfazl@juniv.edu>
Subject: Re: i18n questions
Date: Thu, 1 Apr 2004 21:05:22 +0600
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040401210522.D336@Imrashi.net.bd>
References: <Pine.LNX.4.58L0.0404011331350.11046@ahriman.bucharest.roedu.net>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.58L0.0404011331350.11046@ahriman.bucharest.roedu.net>; from dizzy@roedu.net on Thu, Apr 01, 2004 at 01:43:31PM +0300
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mihai RUSU <dizzy@roedu.net>
Cc: linux-c-programming@vger.kernel.org

On Thu, Apr 01, 2004 at 01:43:31PM +0300, Mihai RUSU wrote:

> projects like KBabel to write such dictionary files. Anyone here has a 
> pointer to some detalied explanation of the .po and .gpo files (I see in 
> "gaim" that .gpo is some "compiled" form) ? Couse I might do some ".po to 
> CDB" compiler and go with this solution :)

 $ info gettext


 Basicallly, the PO file contains the translated messages in text form whereas
the MO files have them in Binary form.  In anycase, gettext works in user
application only (AFAIK).  So, I don't think it'll be of any help to you in
this client-server context ;-(



 Khoda Hafez
 Progga

