From: Ardhan Madras <nightdecoder@gmail.com>
Subject: Help on pipe
Date: Fri, 10 Jul 2009 13:22:54 +0700
Message-ID: <34e1241d0907092322h5aea016cj437168a43ebfe50e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=3UBxoN/d57M6DQ+dCGb+Ke4H9LZEufC1NAoV9oM4YyA=;
        b=pQX4S6gQk84VZJHJCdqi2/+76T0fHjPpuen945SgnzJ+7mpZ9ntOGUEnUIKu4aqPFz
         jV12YGkGsuoQfp+okNtI4EBTpdvY6ZTdfZ3HXbJ5DnDob+2VRoY62OVH1xbyb3//jG0d
         aouvGmGRzlRvAMXnu6gxkIlWxmDa0nz0hrris=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi,

I'm writing pipe demo:

#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
#include <stdio.h>
#include <string.h>

int main(void)
{
  pid_t pid;
  int fds[2], ret;
  const char *sort = "/usr/bin/sort";
  char *argv[2] = { "sort", NULL };

  ret = pipe(fds);
  if (ret == -1) {
    perror("pipe");
    return -1;
  }
  pid = fork();
  if (pid == -1) {
    perror("fork");
    return -1;
  }

  if (pid == 0) {
    int ret;

    close(fds[1]);
    dup2(fds[0], STDIN_FILENO);

    ret = execve(sort, argv, NULL);
    if (ret == -1) {
      perror("execve");
    }
    close(fds[0]);
    _exit(0);
  }
  else {
    FILE *stream;

    close(fds[0]);
    stream = fdopen(fds[1], "w");
    if (!stream) {
      perror("fdopen");
      return -1;
    }
    fprintf(stream, "this\n");
    fprintf(stream, "means\n");
    fprintf(stream, "war\n");
    fflush(stream);
    waitpid(pid, &ret, 0);
    close(fds[1]);
  }
  return 0;
}

I want to send parent's data to the child as "sort" input, i don't
know why sort doesn't receive the data. Did i made mistake here?

Thanks before.
