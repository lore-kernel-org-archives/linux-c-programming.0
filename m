From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: some about gtk+
Date: Tue, 10 Feb 2004 19:20:38 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16425.12038.473175.539529@cerise.nosuchdomain.co.uk>
References: <20040210205224.44059598.alphex@crew.org.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040210205224.44059598.alphex@crew.org.ru>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Alphex K." <alphex@crew.org.ru>
Cc: linux-c-programming@vger.kernel.org


Alphex K. wrote:

> I want to do something when GtkCombo entry is changed, but I'm don't khown
> what the signal is call?

A GtkCombo doesn't emit any signals itself. Instead, you have to have
to handle the signals from its children (entry and list), e.g.

	gtk_signal_connect(
		GTK_OBJECT(GTK_COMBO(combo)->list), "select_child",
		GTK_SIGNAL_FUNC(select_list), NULL);

See the documentation for GtkList and GtkEntry regarding the signals
which they emit.

-- 
Glynn Clements <glynn.clements@virgin.net>
