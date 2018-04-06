# ajmalsiddiqui's dotfiles

Top secret text files that make my world a better place. :')

Make sure you read the [About My Dotfiles](#about-my-dotfiles) section if you intend to use these.
Currently under construction.

### A Word of Advice

Before you use these (or any) dotfiles, make sure you back your dotfiles up into a directory (you'll find them in your home folder - type `ls -a` in the terminal).

Also, make sure you read the [About My Dotfiles](#about-my-dotfiles) section before you use these in order to ensure that nothing goes awry.

Dotfiles are meant to be different. What suits me well definitely won't be perfect for you. So I seriously recommend forking this repo and then making it your own.

### Installation

> Note:
The bootstrap.exclude.sh script creates symlinks from the dotfiles in this directory to the HOME directory. Make sure that your dotfiles are backed up somewhere safe.

Open a terminal and follow along!
1. Clone this repository: `git clone https://github.com/ajmalsiddiqui/dotfiles`
2. CD into the folder: `cd dotfiles`
3. Execute the bootstrap script: `sh ./bootstrap.exclude.sh`
4. Restart your terminal or run `source .bash_profile`

### About My Dotfiles

First up, my OS is Mac OSX and that's what my dotfiles are tailored to. I will eventually seperate out the OSX specific stuff.

Like everyone else who customizes their dotfiles, I have my own way of doing things. For example, all of my projects are in ~/Desktop/My Corner/Projects, and the `project` function makes a new folder in this directory and cd's into it. This is definitely not conventional and hence you should start by changing the values of the variables defined in the various files to what suits your needs (the PATH_TO_PROJECTS variable keeps track of my projects directory).

I like to explore new languages, frameworks and technologies. Hence, I have a folder called playground on my Desktop where I experiment with stuff. The `play` command makes a new folder in here and cd's into it (PATH_TO_PLAYGROUND is the corresponding variable). This is again something you should customize to suit your own needs (or remove entirely).
