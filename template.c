#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "config.h"

#define xstr(s) str(s)
#define str(s) #s

int main(int argc, char *argv[]) {
  char **new_argv = (char **)malloc(argc + 2);
  new_argv[argc + 1] = NULL;

  // 通过环境变量设置box
  char *winearch = getenv("WINEARCH");

  if (!winearch || strcmp(winearch, "win32") == 0) {
    // 默认使用32位的
    new_argv[0] = str(BOX86);
    new_argv[1] = xstr(CONFIG_BIN32_PREFIX) "/" xstr(PROG);
  } else {
    new_argv[0] = str(BOX64);
    new_argv[1] = xstr(CONFIG_BIN64_PREFIX) "/" xstr(PROG);
  }

  for (int i = 2; i <= argc; i++) {
    new_argv[i] = argv[i - 1];
  }
  return execvp(new_argv[0], new_argv);
}
