#include "stdio.h"
#include "stdlib.h"
int main()
{
	int ret;
//	FILE *fp = popen("/system/bin/sh ./test.sh","r");
	FILE *fp = popen("ls","r");
	char buf[100] = {0};
	fread(buf,sizeof(char),sizeof(buf),fp);
	pclose(fp);
	char msg[100];
	fgets(msg,sizeof(msg),stdin);
	puts("<Content-type:text/html>\n");
	puts("<html>");
	puts("<head>");
	puts("<title>test.cgi</title>");
	puts("</head>");

	puts("<body>");
	printf("%s\n",msg);
	printf("%s\n",buf);
	puts("</body>");
	
	puts("</html>");
return 0;
}
