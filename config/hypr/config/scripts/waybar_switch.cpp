#include <cstdlib>
#include <iostream>
#include <sys/wait.h>

int main(){
    if(!WEXITSTATUS(std::system("pgrep -x waybar > /dev/null 2>&1")))
        std::system("pkill waybar");
    else
        std::system("waybar &");
    return 0;
}
