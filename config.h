#ifndef _CONFIG_H
#define _CONFIG_H

#define CONFIG_BIN_PREFIX "/opt/wine/bin"

#ifndef PROG
  #error "Need define PROG"
#endif

#ifdef BOX64
  #define BOX "box64"
#elif BOX86
  #define BOX "box86"
#else
  #error "Need define BOX64 or BOX86"
#endif

#endif
