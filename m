From: "Alphex K." <alphex@crew.org.ru>
Subject: Re: Some troubles with dynamic structures ;-(
Date: Fri, 23 Jan 2004 19:41:37 +0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040123194137.4cdb7f5a.alphex@crew.org.ru>
References: <20040122232345.75911b51.alphex@crew.org.ru>
	<16400.25735.492139.552175@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <16400.25735.492139.552175@cerise.nosuchdomain.co.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Glynn Clements <glynn.clements@virgin.net>
Cc: linux-c-programming@vger.kernel.org

On Fri, 23 Jan 2004 00:02:15 +0000
Glynn Clements <glynn.clements@virgin.net> wrote:

> 
> Alphex K. wrote:
> 
> > Where I have a mistake,
> > integers in structure work normally, but 
> > I'm have a problem with pointers to char 
> 
> The pointers are those returned from gtk_entry_get_text(), whose
> documention says:
> 
> 	Retrieve the contents of the entry widget. The returned
> 	pointer points to internally allocated storage in the widget
> 	and must not be freed, modified or stored. For this reason,
> 	this function is deprecated. Use gtk_editable_get_chars()
> 	instead.
> 
> I take this as meaning that the data to which they point may become
> invalid at the next operation to be performed on the GtkEntry (e.g. 
> the next time it receives a signal or is accessed via one of the
> gtk_entry_* functions).
> 
> Use e.g. strdup() to copy the data, e.g.
> 
>    aname=strdup(gtk_entry_get_text(GTK_ENTRY(namecentry)));
yes it's work normally, thanx
> 
> -- 
> Glynn Clements <glynn.clements@virgin.net>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


-- 
Alphex Kaanoken
Senior developer of Crew IT research labs
web: http://crew.org.ru
mailto:Alphex@Crew.Org.RU
