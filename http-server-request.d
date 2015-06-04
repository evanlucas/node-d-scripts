#!/usr/bin/env dtrace -Cs

#pragma D option quiet

dtrace:::BEGIN
{
  printf("NODE HTTP-SERVER-REQUESTS\n\n");
  printf("__________________________________________\n");
  printf("| %6s | %-6s | %-20s |\n", "PID", "METHOD", "PATH");
  printf("|--------|--------|----------------------|\n");
}

node*:::http-server-request
{
  printf("| %6d | %-6s | %-20s |\n",
         pid,
         copyinstr(arg4),
         copyinstr(arg5));
}

dtrace:::END
{
  printf("done...\n");
}
