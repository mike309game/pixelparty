#include <stdio.h>
#include <time.h>

#if _WIN32
#define gmexport __declspec(dllexport)
#else
#define gmexport __attribute__((visibility("default")))
#endif

gmexport char* CurrentTimestamp() {
	time_t clk = time(NULL);
	return ctime(&clk); //memory leak maybe?
}