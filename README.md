<h1 align="center">
  <br />
  Mohammad's CV
</h1>

<p align="center">
  My CV for job applications. It's heavily inspired by AwesomeCV. Though I tried to optimize it in a way that it appeals better to ATS systems and recruiters.
</p>
<div align="center">
  <a href="https://github.com/0xC0D3D00D/cv/raw/master/cv.pdf">
    <img alt="Example CV" src="https://img.shields.io/badge/cv-pdf-green.svg" />
  </a>
</div>

<br />

### Installation for Macos

  ```sh
  brew install pandoc
  brew tap homebrew/cask
  brew install --cask basictex
  eval "$(/usr/libexec/path_helper)"
  # Update $PATH to include `/usr/local/texlive/2020basic/bin/x86_64-darwin`
  
  sudo tlmgr update --self
  sudo tlmgr install texliveonfly
  sudo tlmgr install adjustbox
  sudo tlmgr install tcolorbox
  sudo tlmgr install collectbox
  sudo tlmgr install ucs
  sudo tlmgr install environ
  sudo tlmgr install trimspaces
  sudo tlmgr install titling
  sudo tlmgr install enumitem
  sudo tlmgr install rsfs
  sudo tlmgr install fontawesome
  sudo tlmgr install sourcesanspro
  sudo tlmgr install xifthen
  sudo tlmgr install ifmtarg
  
  brew install fontawesome
  cp -vf /usr/local/texlive/2022basic/texmf-dist/fonts/opentype/public/fontawesome/FontAwesome.otf ~/Library/Fonts
  ```
