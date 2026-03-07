#include <iostream>
#include <cstdio>
#include <string>
#include <cstdlib>

int main(int argc , char* argv[]){
    FILE *fp;
    fp=popen("hyprctl getoption decoration:active_opacity","r");
    std::string opacity;
    for(int i=0;i<11;i++){
        char c=fgetc(fp);
        if(i>6)
	   opacity+=c;
    }
    std::string input;
    if(argc <2)
        std::cin>> input;
    else
        input=argv[1];
    float new_opacity=std::stof(opacity);
    if(input == "+"){
        new_opacity+=0.05;
    }
    else if(input == "-"){ 
        new_opacity-=0.05;
    }
    else
        new_opacity = std::stof(input);

    if(new_opacity>1)new_opacity=1;
    if(new_opacity<0)new_opacity=0;
    std::cout<<new_opacity;
    std::string opacity_str = std::to_string(new_opacity);
    std::string cmd = "hyprctl keyword decoration:active_opacity " + opacity_str;
    std::system(cmd.c_str());
    std::string cmd2 ="hyprctl keyword decoration:inactive_opacity " + opacity_str;
    std::system(cmd2.c_str());
    return 0;
}
