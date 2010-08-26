From: Jason <lcprog@lakedaemon.net>
Subject: [OT] git branches and command prompts
Date: Thu, 26 Aug 2010 16:12:59 -0400
Message-ID: <4C76CACB.5000409@lakedaemon.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

All,

if you're like me, you play with a lot of open source code.  A lot of it is now in git repositories.  I frequently forget which branch I'm on in each project, particularly with Android/Cyanogen.  Here's a hack I figured out that helps me out, place it in ~/.bashrc :

### begin ####
PROMPT_COMMAND="echo -n \${PWD};
         if git branch >/dev/null 2>&1; then 
            echo -n \" (\$(git branch | grep ^* | cut -d ' ' -f 2-))\"
         fi"
PS1="\n[\[\033[01;34m\]\u\[\033[00m\]@\h] $ "
export PROMPT_COMMAND PS1
### end ######

Here's the result:

/home/jason
[jason@phantom] $ cd src/foss/git.git
/home/jason/src/foss/git.git (master)
[jason@phantom] $ git checkout git_shell_dir_opt 
Switched to branch 'git_shell_dir_opt'
/home/jason/src/foss/git.git (git_shell_dir_opt)
[jason@phantom] $

Obviously you can tweak it to just one line, or a simpler PS1, or whatever.  Thought it might help some folks.

Jason.

