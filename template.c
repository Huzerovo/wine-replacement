#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <stdio.h>

#include "config.h"

#define xstr(s) str(s)
#define str(s) #s

int main(int argc, char* argv[]) {
  char** new_argv = (char**)malloc(argc + 2);

  new_argv[0] = BOX;
  new_argv[1] = CONFIG_BIN_PREFIX "/" xstr(PROG);

  new_argv[argc + 1] = NULL;

  for (int i = 2; i <= argc; i++) {
    new_argv[i] = argv[i - 1];
  }
  return execvp(BOX, new_argv);
}
