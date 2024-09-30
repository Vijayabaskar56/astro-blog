---
slug: powershell-powerful
title: Power-Up Your PowerShell Experience~
description: What do they got in there? King Kong? You're a very talented young man, with your own clever thoughts and ideas. Do you need a manager? I was part of something special. Did he just throw my cat out of the window? Do you have any idea how long it takes those cups to decompose.
image: ../attachments/100.jpg
date: 2031-03-31T23:30:47+08:00
lastmod: 2024-03-01T23:30:47+08:00
hidden: false
---


I recently bought a new laptop which comes with Windows preinstalled on it, but I am an avid Linux user. I love the flexibility and freedom that Linux provides, and I have my fair bit of experience with various Linux distros, from Ubuntu, Zorin, Kali to Arch.

So my first thought after getting my new laptop was to switch to Arch, but I wanted to give Windows a try before switching. I heard a lot about Windows trying to make it better for developers by introducing various features like WSL, DEV HOME, etc. So, I have tried various Linux distros; why not give Windows a chance? For the past couple of months, I have been using Windows as my daily driver, and I have to say, they have improved a lot and introduced many features to impress developers.

And this is my experience: Linux is great, there is no doubt about that. The flexibility, customization, and freedom it offers are beyond what any other operating system will ever provide. But with Windows, we also have to fight a little with Microsoft to turn off all the unnecessary features and permissions, but it is possible to have a Linux-like experience in Windows with a little bit of effort. That’s what I do—I fight and figure it out.

In this blog, I am going to share how I customize my terminal in a way that is similar to the previous Linux setup that I have.

## PowerShell

Windows does not use bash or zsh shells, although we can use these shells with WSL (that’s a topic for another blog). Now we are going to focus on customizing PowerShell.

**Step 1: Installation**
---
- Install the Terminal App from the Microsoft Store. It’s an awesome terminal emulator as far as my experience goes. [Windows Terminal](https://apps.microsoft.com/detail/9n0dx20hk701?rtc=1&hl=en-in&gl=IN) and also install [PowerShell](https://apps.microsoft.com/detail/9mz1snwt0n5d?launch=true&mode=full&hl=en-us&gl=in) as a separate shell so we don’t have to deal with Windows PowerShell every time. And yes, both are different but in a similar way.
- Installing Command Line Installer [Scoop](https://github.com/ScoopInstaller/Scoop) by using these commands, which allows us to install things from the terminal.

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
```

- Plus, here are some command packages that I installed with Scoop:

```powershell
scoop install sudo # similar to linux for admin access
sudo scoop install 7zip git openssh --global # utility tools
scoop install aria2 curl grep sed less touch neovim gcc # command line tools
scoop install nvm bun python java # dev tools and languages
```

- Install Posh for Customization:
```powershell
Install-Module posh-git -Scope CurrentUser -Force
Install-Module Oh-my-posh -Scope CurrentUser -Force
Get-PoshThemes
```

- Install other required Git modules for customization and configuration:
```powershell
Install-Module -Name Terminal-Icons -Repository PSGallery -Force
Install-Module -Name Z -Force
Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck
Install-Module -Name PsFzf -Scope CurrentUser -Force
```
It might be confusing what the heck these tools are, and I have intentionally not explained everything in this blog as that might be too long. I encourage you to explore each tool yourself. I have attached the link to those tools, and after this point, you might want to restart your computer.

**Step 2: Customization**
---
Change the Terminal Settings:
- Set the Default Profile to PowerShell.
- In Appearance, enable acrylic material if you prefer a transparent effect.
- In Profile -> Appearance, you can change the color scheme, font, background image, transparent effect, and much more. Just go through each setting, explore, and find the right fit for you.

**Step 3: Configuration**
---
- Open the PowerShell config file in Notepad or your preferred editor:
```powershell
notepad $PROFILE.CurrentUserCurrentHost
```
- Invoke the tools that we installed on every shell instance. The content in the shell file will run every time you open a new instance of the shell:
```powershell
# Prompt
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\wopian.omp.json" | Invoke-Expression

# Terminal Icons
Import-Module -Name Terminal-Icons

# PSReadLine
Set-PSReadLineOption -BellStyle None
Set-PSReadLinekeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

# Fzf
Import-Module PSFzf
Set-PSFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Alias
SET-Alias vim nvim
SET-Alias ll ls
SET-Alias g git
SET-Alias grep findstr
SET-Alias tig "C:\Program Files\Git\usr\bin\tig.exe"
SET-Alias less "C:\Program Files\Git\usr\bin\less.exe"
SET-Alias  c clear

# Utilities
function which ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue |
      Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
```

## Tools References
- [Scoop](https://github.com/ScoopInstaller/Scoop) # Command Line Installer for Windows
- [ohmyPosh](https://ohmyposh.dev/) # A prompt theme engine for any shell.
- [Terminal Icons](https://github.com/devblackops/Terminal-Icons) # Icons on terminal
- [PSReadLine](https://learn.microsoft.com/en-us/powershell/module/psreadline/?view=powershell-7.4) # For Auto-Suggestion and Completion
- [PSFzf](https://github.com/kelleyma49/PSFzf) # Find it Faster on Windows

## Conclusion
Some might think that configuring and customizing is just a waste of time, but don’t let that stop you from configuring and customizing your system as you wish. It can save a whole bunch of time if you spend a little time understanding and configuring it. You can learn how computers work in the process of doing so, and plus, it’s FUN 😁.
