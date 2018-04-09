# ajmalsiddiqui's dotfiles

Top secret text files that make my world a better place. :')

Make sure you read the [About My Dotfiles](#about-my-dotfiles) section if you intend to use these.
Currently under construction.

### A Word of Advice
---

Before you use these (or any) dotfiles, make sure you back your dotfiles up into a directory (you'll find them in your home folder - type `ls -a` in the terminal).

Also, make sure you read the [About My Dotfiles](#about-my-dotfiles) section before you use these in order to ensure that nothing goes awry.

Dotfiles are meant to be different. What suits me well definitely won't be perfect for you. So I seriously recommend forking this repo and then making it your own.

### Installation
---

> Note:
The bootstrap.exclude.sh script creates symlinks from the dotfiles in this directory to the HOME directory. Make sure that your dotfiles are backed up somewhere safe.

Open a terminal and follow along!
1. Clone this repository: `git clone https://github.com/ajmalsiddiqui/dotfiles`
2. CD into the folder: `cd dotfiles`
3. Execute the bootstrap script: `sh ./bootstrap.exclude.sh`
4. Restart your terminal or run `source .bash_profile`

### Customization
---

You can customize these dotfiles using `.local` files. These can be used to add custom commands or configure things that you don't want to commit to a public repo. 

For example, to overwrite stuff in the `.bash_profile` file, make a file called `.bash_profile.local` and put your stuff in there. 

When you make a new `.local` file, you'll have to run `sh ./bootstrap.exclude.sh` before it can be used. You only have to run the linking part though, so choose `y` for that one part and `n` for the rest.

(P.S Since I'm still taking baby steps in the direction of dotfiles, currently only the `.bash_profile` file can be customized using a `.bash_profile.local` file. This will change soon.)

### About My Dotfiles
---

First up, my OS is Mac OSX and that's what my dotfiles are tailored to. I will eventually seperate out the OSX specific stuff.

Like everyone else who customizes their dotfiles, I have my own way of doing things. For example, all of my projects are in ~/Projects, and the `project` function makes a new folder in this directory and cd's into it. This may or may not suit and hence you should start by changing the values of the variables defined in the various files to what suits your needs (the PATH_TO_PROJECTS variable keeps track of my projects directory).

I like to explore new languages, frameworks and technologies. Hence, I have a folder called playground on my Desktop where I experiment with stuff. The `play` command makes a new folder in here and cd's into it (PATH_TO_PLAYGROUND is the corresponding variable). This is again something you should customize to suit your own needs (or remove entirely).

### Acknowledgements
---

Shoutout to these amazing people and their dotfiles for inspiring my dotfiles in many ways.

- [@pradyunsg](https://github.com/pradyunsg/dotfiles) - For introducing me to these magical entities
- [@mathiasbynens](https://github.com/mathiasbynens/dotfiles) - The go-to place for dotfiles inspiration