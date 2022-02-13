#include <stdio.h>
#include <time.h>

__declspec(dllexport) char* CurrentUnixTimestamp() {
	time_t clk = time(NULL);
	return ctime(&clk);
}