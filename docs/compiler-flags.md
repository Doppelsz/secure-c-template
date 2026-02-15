# compiler-flags

This is not a perfect set of compiler flags, Explaining the current flags from the makefile.

## warn flags

### Core
  1. -Wall
  - Enable common warnings.
    
  2. -Wextra
  - Enable additional useful warnings.

  3. -Werror
  - Treat warnings as build failures.

  4. -Wpedantic
  - Enforce strict ISO C compliance.

### Best practices

  1. -Wshadow
  - Warn if a variable hides another variable.

  2. -Wpointer-arith
  - Warn about unsafe pointer arithmetic.

  3. -Wcast-qual
  - Warn if const or volatile is discarded. (may be incorrect, need to test going off memory )

  4. -Wstrict-prototypes
  - Require full function prototypes. ( may be incorrect )

  5. -Wmissing-prototypes
  - Warn if global functions lack header declarations. ( may be incorrect )

  6. -Wconversion
  - Warn on implicit type conversions. ( may be incorrect )

  7. -Wsign-conversion
  - Warn on signed/unsigned conversions.

  8. -Wundef ( may not apply at all later, depending on macros use )
  - Warn if undefined macros are used in #if.

  ### Secuity
  
  1. -fstack-protector-strong
  - Adds stack canaries to detect buffer overflows.

  2. -D_FORTIFY_SOURCE=2
  - Enables extra runtime bounds checking in glibc.

  3. -fno-common
  - Prevents multiple global variable definitions.
