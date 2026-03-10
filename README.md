# arch_setup
This is my personal flavor of **Arch Linux** + **Hyprland**.
It is a **post-install** script for Arch to install my shortcuts, scripts, and applications that I find interesting.

It does not have the fancy things that Hyprland users love. Although it has some, but that was not my focus. I did something here and there, like an opacity control script. Also, a lot of the scripts only work on laptops. I was more focused on the functionality paradigm of tiling window management. It is much better than classical window managers, especially on laptops with a single small display.

I am new to Arch, so I download a lot of applications to experiment. The best things I find will be added here over time.

I also call this a **nuclear reset** because while I am searching for the gold, I am also adding a lot of unnecessary things to my computer. The fastest way to clean it up is to reset the whole system. Resetting might seem radical to many, which is why I call it nuclear reset. I don't think a lot of people do this, but I have PTSD from cleaning up manually, so in my situation, this is the only option.

This setup also includes my **Neovim** configuration. I am new to Nvim, so there aren't many things set up yet, but it will grow over time.

```
#1 Install required packages: base-devel is necessary because some packages need C++ to compile
sudo pacman -S --needed git base-devel
#2 Clone the setup:
git clone https://github.com/rafobitro/arch_setup.git
#3 Enter the folder:
cd arch_setup
#4 Make the script executable:
chmod +x instal_script.sh
#5 Run the script:
./instal_script.sh
```

**NOTE**
I have tested this on different Arch machines with different setups, and it worked (download mixing up and overwrite configs). I haven't tried it on a completely new machine yet, but I am pretty sure it will work. I plan to test it on a fresh system in the near future and will update this repository accordingly. PS. it is working 
