From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Some troubles with dynamic structures ;-(
Date: Fri, 23 Jan 2004 00:02:15 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16400.25735.492139.552175@cerise.nosuchdomain.co.uk>
References: <20040122232345.75911b51.alphex@crew.org.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040122232345.75911b51.alphex@crew.org.ru>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Alphex K." <alphex@crew.org.ru>
Cc: linux-c-programming@vger.kernel.org


Alphex K. wrote:

> Where I have a mistake,
> integers in structure work normally, but 
> I'm have a problem with pointers to char 

The pointers are those returned from gtk_entry_get_text(), whose
documention says:

	Retrieve the contents of the entry widget. The returned
	pointer points to internally allocated storage in the widget
	and must not be freed, modified or stored. For this reason,
	this function is deprecated. Use gtk_editable_get_chars()
	instead.

I take this as meaning that the data to which they point may become
invalid at the next operation to be performed on the GtkEntry (e.g. 
the next time it receives a signal or is accessed via one of the
gtk_entry_* functions).

Use e.g. strdup() to copy the data, e.g.

   aname=strdup(gtk_entry_get_text(GTK_ENTRY(namecentry)));

-- 
Glynn Clements <glynn.clements@virgin.net>
