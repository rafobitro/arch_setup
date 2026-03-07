#include <cstdlib>
#include <iostream>
#include <fstream>

int main() {
    std::fstream file("/home/rafo/.config/hypr/scripts/touchpad_toggl_status.txt", std::ios::in | std::ios::out );

    char value;
    file >> value;
 if (!file.is_open()) {
        std::cerr << "Error: Could not open file." << std::endl;
        return 1;
    }
    file.seekp(0);

    if(value =='1'){
	file <<'0'; 
	std::system("hyprctl keyword device[asue140d:00-04f3:31b9-touchpad]:enabled false");
       // std::system("hyprctl reload");
	std::cout<<"off";
    }else{
        file << '1';	
//         std::system("hyprctl keyword device[asue140d:00-04f3:31b9-touchpad]:enabled true");
        std::system("hyprctl reload");
	std::cout<<"on";
    }
    return 0;

}

