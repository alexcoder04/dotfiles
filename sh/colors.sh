# -----------------------------------------------------------------------------
# LF ICONS
# -----------------------------------------------------------------------------
case "$TERM" in
  linux) export LF_ICONS="\
tw=D:\
st=D:\
ow=D:\
dt=D:\
di=D:\
fi=F:\
ln=L:\
or=Ł:\
ex=R:\
" ;;
  *) export LF_ICONS="\
tw=:\
st=:\
ow=:\
dt=:\
di=:\
fi=:\
ln=:\
or=:\
ex=:\
*.c=:\
*.cc=:\
*.clj=:\
*.coffee=:\
*.cpp=:\
*.css=:\
*.d=:\
*.dart=:\
*.erl=:\
*.exs=:\
*.fs=:\
*.go=:\
*.h=:\
*.hh=:\
*.hpp=:\
*.hs=:\
*.html=:\
*.java=:\
*.jl=:\
*.js=:\
*.json=:\
*.lua=:\
*.md=:\
*.php=:\
*.pl=:\
*.pro=:\
*.py=:\
*.rb=:\
*.rs=:\
*.scala=:\
*.ts=:\
*.vim=:\
*.cmd=:\
*.ps1=:\
*.sh=:\
*.bash=:\
*.zsh=:\
*.fish=:\
*.tar=:\
*.tgz=:\
*.arc=:\
*.arj=:\
*.taz=:\
*.lha=:\
*.lz4=:\
*.lzh=:\
*.lzma=:\
*.tlz=:\
*.txz=:\
*.tzo=:\
*.t7z=:\
*.zip=:\
*.z=:\
*.dz=:\
*.gz=:\
*.lrz=:\
*.lz=:\
*.lzo=:\
*.xz=:\
*.zst=:\
*.tzst=:\
*.bz2=:\
*.bz=:\
*.tbz=:\
*.tbz2=:\
*.tz=:\
*.deb=:\
*.rpm=:\
*.jar=:\
*.war=:\
*.ear=:\
*.sar=:\
*.rar=:\
*.alz=:\
*.ace=:\
*.zoo=:\
*.cpio=:\
*.7z=:\
*.rz=:\
*.cab=:\
*.wim=:\
*.swm=:\
*.dwm=:\
*.esd=:\
*.jpg=:\
*.jpeg=:\
*.mjpg=:\
*.mjpeg=:\
*.gif=:\
*.bmp=:\
*.pbm=:\
*.pgm=:\
*.ppm=:\
*.tga=:\
*.xbm=:\
*.xpm=:\
*.tif=:\
*.tiff=:\
*.png=:\
*.svg=:\
*.svgz=:\
*.mng=:\
*.pcx=:\
*.mov=:\
*.mpg=:\
*.mpeg=:\
*.m2v=:\
*.mkv=:\
*.webm=:\
*.ogm=:\
*.mp4=:\
*.m4v=:\
*.mp4v=:\
*.vob=:\
*.qt=:\
*.nuv=:\
*.wmv=:\
*.asf=:\
*.rm=:\
*.rmvb=:\
*.flc=:\
*.avi=:\
*.fli=:\
*.flv=:\
*.gl=:\
*.dl=:\
*.xcf=:\
*.xwd=:\
*.yuv=:\
*.cgm=:\
*.emf=:\
*.ogv=:\
*.ogx=:\
*.aac=:\
*.au=:\
*.flac=:\
*.m4a=:\
*.mid=:\
*.midi=:\
*.mka=:\
*.mp3=:\
*.mpc=:\
*.ogg=:\
*.ra=:\
*.wav=:\
*.oga=:\
*.opus=:\
*.spx=:\
*.xspf=:\
*.pdf=:\
*.nix=:\
*.doc=:\
*.docx=:\
*.odt=:\
*.ppt=:\
*.pptx=:\
*.odp=:\
*.tex=:\
" ;;
esac

# -----------------------------------------------------------------------------
# LF COLORS
# -----------------------------------------------------------------------------
BASIC_LF_COLORS="\
ln=01;36:\
di=01;34:\
# ----- ignored/dimmed files
.git/=02:\
.gitignore*=02:\
node_modules/=02:\
# project files
Makefile*=02;33:\
PKGBUILD*=02;33:\
go.mod*=02;33:\
go.sum*=02;33:\
# ----- text documents
README*=33:\
LICENSE.*=33:\
*.md=33:\
*.tex=01;33:\
# ----- images
*.JPG=36:\
*.gif=36:\
*.jpeg=36:\
*.jpg=36:\
*.png=36:\
*.webp=36:\
# ----- documents
*.pdf=35:\
*.epub=35:\
*.odt=02;35:\
*.odp=02;35:\
# -----archives
*.apk=34:\
*.bz2=34:\
*.gz=34:\
*.tar=34:\
*.tbz2=34:\
*.tgz=34:\
*.zip=34:\
*.7z=34:\
*.xz=34:\
*.zst=34:\
# ----- executables and scripts
ex=01;32:\
*.sh=32:\
"

# more specific colors in 256-color terminals
case "$TERM" in
  xterm-256color)
    ADDITIONAL_LF_COLORS="\
# ----- HTML/CSS/JS
*.html=38;5;202:\
*.css=38;5;33:\
*.js=38;5;220:\
# ----- programming languages
*.py=38;5;33:\
*.go=38;5;123:\
# ----- videos
*.avi=02;36:\
*.m4v=02;36:\
*.mkv=02;36:\
*.mp4=02;36:\
*.MP4=02;36:\
*.webm=02;36:\
# ----- audio
*.m4a=38;5;66:\
*.mp3=38;5;66:\
*.ogg=38;5;66:\
*.opus=38;5;66:\
" ;;
  *)
    ADDITIONAL_LF_COLORS="\
# ----- HTML/CSS/JS
*.html=01;35:\
*.css=01;35:\
*.js=01;35:\
# ----- programming languages
*.py=02;34:\
*.go=0:\
# ----- videos and audio
*.avi=02;36:\
*.m4a=02;36:\
*.m4v=02;36:\
*.mkv=02;36:\
*.mp3=02;36:\
*.mp4=02;36:\
*.MP4=02;36:\
*.ogg=02;36:\
*.opus=02;36:\
*.webm=02;36:\
" ;;
esac

export LF_COLORS="${BASIC_LF_COLORS}${ADDITIONAL_LF_COLORS}"
unset BASIC_LF_COLORS
unset ADDITIONAL_LF_COLORS

# -----------------------------------------------------------------------------
# EXA COLORS
# -----------------------------------------------------------------------------
export EXA_COLORS="$LF_COLORS"

