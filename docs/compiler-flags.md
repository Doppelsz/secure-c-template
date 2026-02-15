Language Standard

-std=c11
Use C11, a modern, stable standard with _Static_assert, atomics, and better threading support.

Warning Flags (WARN)
Core

-Wall – Enable common warnings.

-Wextra – Enable additional useful warnings.

-Werror – Treat all warnings as errors.

-Wpedantic – Enforce strict ISO C compliance.

Safety & Best Practices

-Wshadow – Warn if a variable hides another variable.

-Wconversion – Warn on implicit type conversions.

-Wsign-conversion – Warn on signed/unsigned conversions.

-Wformat=2 – Strong checks for printf/scanf usage.

-Wundef – Warn if undefined macros are used in #if.

-Wpointer-arith – Warn on unsafe pointer arithmetic.

-Wcast-qual – Warn if const or volatile is discarded.

-Wstrict-prototypes – Require full function prototypes (old-style C protection).

-Wmissing-prototypes – Warn if global functions lack header declarations.

-Wvla – Warn on variable-length arrays (stack risk).

-Wnull-dereference – Warn if pointer may be NULL when dereferenced.

-Wdouble-promotion – Warn if float is promoted to double.

-Wimplicit-fallthrough – Warn on unintended switch case fallthrough.

Security & Hardening Flags (SECURITY)

-fstack-protector-strong – Add stack canaries to detect overflows.

-fstack-clash-protection – Protect against stack clash attacks.

-D_FORTIFY_SOURCE=3 – Enable runtime buffer overflow checks in glibc.

-fPIE – Compile Position-Independent Executable for ASLR.

-fno-common – Prevent multiple definitions of global variables.

Linker Hardening (LDFLAGS_SEC)

-Wl,-z,relro,-z,now – Protect GOT and bind symbols immediately.

-Wl,-z,noexecstack – Prevent stack execution.

-Wl,-z,separate-code – Enforce W^X (write xor execute) memory.

-pie – Enable full ASLR for the executable.

Optimization

-O2 – Optimize for performance while keeping safety and debuggability.

Debug / Sanitizers (DEBUG_FLAGS)

-g3 – Include full debug info.

-O0 – Disable optimizations for easier debugging.

-fsanitize=address,undefined – Enable runtime checks for memory and undefined behavior.

-fno-omit-frame-pointer – Preserve frame pointer for better debugging and sanitizers.

