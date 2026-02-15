#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

// rough example.
// explict prototypes, assertions, no globals, return checks.

static int run(void);
static int safe_print(const char *message);

int main(void)
{
    int status = EXIT_FAILURE;

    status = run();

    return status;
}

static int run(void)
{
    int status = EXIT_FAILURE;
    const char *msg = "Rough Example Running! \n";

    assert(msg != NULL);

    if (safe_print(msg) == EXIT_SUCCESS)
    {
        status = EXIT_SUCCESS;
    }

    return status;
}

static int safe_print(const char *message)
{
    int result = EXIT_FAILURE;

    assert(message != NULL);

    if (printf("%s", message) >= 0)
    {
        result = EXIT_SUCCESS;
    }

    return result;
}
