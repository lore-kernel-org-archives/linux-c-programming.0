From: Steve Graegert <graegerts@gmail.com>
Subject: Re: Forcing fsync() using an ouput stream in C++
Date: Thu, 3 Mar 2005 09:15:00 +0100
Message-ID: <6a00c8d50503030015237d9844@mail.gmail.com>
References: <7728232c05030222384c65f341@mail.gmail.com>
Reply-To: Steve Graegert <graegerts@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <7728232c05030222384c65f341@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org
Cc: Hareesh Nagarajan <hareesh.nagarajan@gmail.com>

On Thu, 3 Mar 2005 00:38:10 -0600, Hareesh Nagarajan
<hareesh.nagarajan@gmail.com> wrote:
> Hi,
> 
> I am aware this is a C-programming mailing list. I just thought I
> might get some useful inputs from this ML.
> 
> My problem is that I haven't figured out how I must fsync an output
> stream (in C++) even after reading the contents of this link:
> http://gcc.gnu.org/ml/gcc-help/2004-02/msg00285.html
> 
> How must I modify this method (this method doesn't work; it prints the
> error message and exits!) ?
> 
> void logRecovery::syncToDisk(fstream& f)
> {
>    unix_filebuf_t* buf;
>    buf = dynamic_cast<unix_filebuf_t*>(f.rdbuf());
>    if (buf == NULL) {
>        cerr << "Fatal: Don't know fd of stream" << endl;
>        exit(-1);
>    }
> 
>    fsync(buf->fd());
> }
> 
> I am using GCC 3.3.4.
> 
> Thanks,
> 
> Hareesh
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

I have actually now idea why you are using unix_filebuf_t. Why not
simply call f.flush()? If you need to obtain a reference to the
streambuf object associated with a stream you can call f.readbuf() and
then do a sync, like this:

streambuf *buf;
buf = f.readbuf();
buf->sync();

May be I get you wrong, but hope this helps.

-- 
Kind Regards

    \Steve
