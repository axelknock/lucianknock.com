---
title:      "My Emacs Configuration"
date:       2024-03-23T18:18:47-04:00
tags:       ["programming","emacs","guide"]
identifier: "20240323T181847"
slug:       "my-emacs-configuration"
summary:    "A guide on how to use my Emacs configuration."
---
This is a guide on how to use [my Emacs configuration](https://github.com/axelknock/.emacs.d).

## 1. Get Emacs

Get [GNU/Emacs](https://www.gnu.org/software/emacs/) (version 29.1+).

## 2. Get Extra Programs

My configuration relies on the presence of a few extra programs. They are:
- [epdfview](https://github.com/JotaRandom/epdfview) - Lightweight PDF viewer
- [ffmpeg](https://ffmpeg.org/) - Cross-platform multimedia converter/recorder/streamer
- [ffmpegthumbnailer](https://github.com/dirkvdb/ffmpegthumbnailer) - Lightweight video thumbnailer
- [mediainfo](https://github.com/MediaArea/MediaInfo) - Data viewer for video and audio files
- [mpg123](https://www.mpg123.de/) - Open-source audio player
- [Vterm](https://github.com/akermu/emacs-libvterm) dependencies:
  - [CMake](https://cmake.org/) - C compiler
  - [GNU/Libtool](https://www.gnu.org/software/libtool/) - Generic support compiling script for and linking.

If you use [Nix](https://nixos.org/) as your Operating System or package manager, you do not have to worry about installing these yet.

## 3. Get my Configuration

Go to your home directory.
```bash
cd ~/
```
Clone the repository with my configuration:
```bash
git clone git@github.com:axelknock/.emacs.d.git
```
If you use Nix as your operating system or package manager, import `.emacs.d/emacs.nix` into your configuration like so:
```nix {filename="configuration.nix"}
imports = [
...
    /home/YOURNAME/.emacs.d/emacs.nix
...
];
```

## 4. Customize the `.person.el` file

Within my configuration, this file defines the user-specific symbols.

```emacs-lisp {filename=".person-example.el"}
(defvar my-username           "YOURNAME")
(defvar my-emacs-path         "YOUREMACSPATH")
(defvar my-extra-auth-sources "YOURAUTHSOURCES")
(defvar my-shell              "sh")
(defvar my-denote-directory   nil)
(defvar my-org-directory      "YOURORGDIRECTORY")
(defvar my-latitude           40.001)
(defvar my-longitude          -80.001)
(defvar my-emacs-backups      `(,(cons "." (expand-file-name ".backups/" my-emacs-path))))
(defvar my-save-place         (expand-file-name "data/save-place.el" my-emacs-path))
(defvar my-dirvish-cache-dir  (expand-file-name "data/dirvish/.cache/" my-emacs-path))
(defvar my-selected-font      "Monospace")
(defvar my-symbol-font        nil)
```

Edit this `.person-example.el` with your information, and rename it to `.person.el`.

## 5. Launch Emacs

Currently I use [straight.el](https://github.com/radian-software/straight.el) as my package manager. It bootstraps itself. It will then use [use-package](https://github.com/jwiegley/use-package) (*not a package manager*) to `:ensure` that all packages are installed and initialized.

One of my TODOs is to replace `straight.el` with [elpaca](https://github.com/progfolio/elpaca) as my package manager, so at the time of reading that may have already happened. Since I use `use-package` macros in my configuration, there will not be many differences, and I have already added elpaca to my configuration. It is just a matter of changing the initial setup code.

I want to use `elpaca` because it runs asynchronously, retrieves packages from their sources (which can make contribution easier), and has an intuitive user interface, a step up from `M-x list-packages`.

My keybindings are kept in `.keybinds.el`, and use a custom macro that "toggles" their state. This makes it trivial for anyone who uses my configuration to edit the keybindings to their liking. You can edit `.keybinds-example.el` to your liking and rename it to `.keybinds.el`.

## Conclusion
I thought it would be trivially easy to throw my configuration files into version control and upload it for anyone else to use, but I realized almost immediately that it had many idiosyncracies. It still retains them, but now they can be freely shared idiosyncracies, whereas before it would be quite difficult to replicate my setup exactly.

It has made me appreciate that it is simply not good enough to run `git init` and throw it online. There is a minimum effort required of all projects that *someone else* be able to run your software. When that effort is not present, no one will make the effort to change it.

There is a disproportionate gain in user interest, developer interest, and project viability from the few simple steps that make software more accessible.
