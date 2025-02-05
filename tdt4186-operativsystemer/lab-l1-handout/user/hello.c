#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"

int
main(int argc, char *argv[])
{
    char hello[] = "Hello ";
    char world[] = "World\n";
    char nice[] = ", nice to meet you!\n";


    write(1, hello, strlen(hello));

    if (argc == 1)
    {
        write(1, world, strlen(world));
    }
    else
    {
        write(1, argv[1], strlen(argv[1]));
        write(1, nice, strlen(nice));
    }

    exit(0);
}
