From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: How to create separate files with debug information?
Date: Mon, 16 Apr 2007 14:49:11 +0100
Message-ID: <17955.32471.843319.387894@cerise.gclements.plus.com>
References: <4622F702.6000301@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <4622F702.6000301@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: linux-c-programming@vger.kernel.org


Shriramana Sharma wrote:

> When we strip a file, we remove any debug information from it. This is 
> done to reduce the size of the file.
> 
> I have seen package managers provide separate files with debug 
> information. For instance, I have a libQtGui.so.4.2.3.debug file 55 MB 
> in size separate from the libQtGui.so.4.2.3 file which is 7 MB in size.
> 
> Now the questions:
> 
> First: Is this kind of providing separate debug files applicable only 
> for library or also for applications?
> 
> Second: How do I create such .debug files with debug information only? I 
> find that these debug files are not executables.

I haven't tried it, but I found this in the binutils Info file:

`--only-keep-debug'
     Strip a file, removing any sections that would be stripped by
     `--strip-debug' and leaving the debugging sections.

     The intention is that this option will be used in conjunction with
     `--add-gnu-debuglink' to create a two part executable.  One a
     stripped binary which will occupy less space in RAM and in a
     distribution and the second a debugging information file which is
     only needed if debugging abilities are required.  The suggested
     procedure to create these files is as follows:

       1. Link the executable as normal.  Assuming that is is called
          `foo' then...

       2. Run `objcopy --only-keep-debug foo foo.dbg' to create a file
          containing the debugging info.

       3. Run `objcopy --strip-debug foo' to create a stripped
          executable.

       4. Run `objcopy --add-gnu-debuglink=foo.dbg foo' to add a link
          to the debugging info into the stripped executable.

     Note - the choice of `.dbg' as an extension for the debug info
     file is arbitrary.  Also the `--only-keep-debug' step is optional.
     You could instead do this:

       1. Link the executable as normal.

       2. Copy `foo' to  `foo.full'

       3. Run `objcopy --strip-debug foo'

       4. Run `objcopy --add-gnu-debuglink=foo.full foo'

     ie the file pointed to by the `--add-gnu-debuglink' can be the
     full executable.  It does not have to be a file created by the
     `--only-keep-debug' switch.

-- 
Glynn Clements <glynn@gclements.plus.com>
