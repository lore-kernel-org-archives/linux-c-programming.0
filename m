From: Holger Kiehl <Holger.Kiehl@dwd.de>
Subject: Re: Implementing a file counter (like "ls | wc")
Date: Wed, 7 Apr 2004 15:34:18 +0000 (GMT)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.58.0404071523290.32748@praktifix.dwd.de>
References: <20040407183558.77510679.alphex@crew.org.ru> <4074148E.9060205@ig.com.br>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <4074148E.9060205@ig.com.br>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Luciano Moreira - igLnx <lucianolnx@ig.com.br>
Cc: "Alphex K." <alphex@crew.org.ru>, linux-c-programming@vger.kernel.org

On Wed, 7 Apr 2004, Luciano Moreira - igLnx wrote:

> -------------- THE CODE HAVE THIS STRUCTURE:
> while ((pFile=readdir(pDir))!=NULL) {
>      sprintf(szBuf, "%s/%s", pPath, pFile->d_name);
>      stat(szBuf, &statFile);
>      if (S_ISDIR(statFile.st_mode))  /// LOOK THAT: We don't use recursive
> searching, we count only files at current directory excluding others
> directories.
>         continue;
> 
>      /* Filtering */
>      if (nNeedFilter) {
>          //// I DONT HAVE THE CODE OF FILTERING NOW
>          //// BUT I CAN SEND IT LATER IF NECESSARY
>         }
> 
>   }
> -------------- CODE FINISH HERE
> 
Don't use sprintf(), its very expansive. Before the while loop put a pointer
after path and / and then strcpy(ptr, pFile->d_name)

stat() is _very_ epansive! It means physical IO and fills up a structure
with things you just don't need. If you really do need to filter out
directories from your result do the stat after it has passed the filter.

> Does have another mechanism to filter without using of strcmp() / memcmp() ?
> How if we dont know the size of extension (.c, .cpp, .teste, .longextension,
> and so on). ?
> 
Compare them yourself with a pointer byte for byte. But the speed gain
will not be so high as when you leave away the stat() call.

Holger
