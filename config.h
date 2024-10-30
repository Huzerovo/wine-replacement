#ifndef _CONFIG_H
#define _CONFIG_H

#ifndef PROG
  #error "Need define PROG"
#endif

#ifdef BOXMIX
  #define BOX64 "box64"
  #define BOX86 "box86"
  #define CONFIG_BIN64_PREFIX "/opt/wine64/bin"
  #define CONFIG_BIN32_PREFIX "/opt/wine32/bin"
#else
  #ifdef BOX64
    #define BOX "box64"
    #define CONFIG_BIN_PREFIX "/opt/wine64/bin"
  #elif BOX86
    #define BOX "box86"
    #define CONFIG_BIN_PREFIX "/opt/wine32/bin"
  #else
    #error "Need define BOX64 or BOX86"
  #endif
#endif

#endif
