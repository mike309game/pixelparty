#include <stdio.h>
#include <string>
#include <Windows.h>

int main() {
	char nameaccum[0xff];
	std::string appdata(getenv("LOCALAPPDATA"));
	appdata += "\\PIXELPARTY\\LATEST.txt";
	FILE* fp = fopen(appdata.c_str(), "r");
	fseek(fp, 0, SEEK_END);
	auto total = ftell(fp);
	rewind(fp);
	fread(nameaccum,total,1,fp);
	fclose(fp);
	CopyFile(nameaccum, ".\\LatestRecording.pxparec", FALSE);
}