#include "io.h"

#include "feed.h"

#include <stdlib.h>
#include <stdarg.h>

static FILE* i;
static FILE* o;
static FILE* e;

static int bytes;

static int size()
{
    return bytes;
}

static void close()
{
    if(i) fclose(i);
    if(o) fclose(o);
}

static void init(FILE* in, FILE* out)
{
    atexit(close);
    i = in;
    o = out;
    e = stderr;
    if(!i) exit(1);
}

static int get()
{
    return fgetc(i);
}

static void bomb(const char* str, ...)
{
    va_list args;
    va_start(args, str);
    fprintf(stderr, "%serror: line %d: ", RED, feed.lines());
    vfprintf(stderr, str, args);
    fprintf(stderr, "%s\n", NRM);
    va_end(args);
    exit(1);
}

static void emit(const char* str, ...)
{
    va_list args;
    va_start(args, str);
    fprintf(o, "\t");
    vfprintf(o, str, args);
    fprintf(o, "\n");
    va_end(args);
    // Each instruction is two bytes wide.
    bytes += 2;
}

static void print(const char* str, ...)
{
    va_list args;
    va_start(args, str);
    vfprintf(o, str, args);
    fprintf(o, "\n");
    va_end(args);
}

const struct io io = { init, get, bomb, emit, print, size };