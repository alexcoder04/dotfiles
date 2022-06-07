
# i3wm

i3 is my window manager of choice. Particulary, I mainly use a fork of i3 called
i3-gaps that has some more features.

On the wayland side an i3-compatible compositor called sway exists. The config
for it is also generated here.

I love tiling window managers, because I got tired of resizing the active window
to full-screen in floating WMs since I was a kid. Why? If I'm working on
something, I want it to get all of my screen size and all of my attention,
that's why tiling WMs just make more sense to me.

i3 is not the most advanced tiling window manager and I try out other WMs from
time to time, but i3 is what worked best for me until now.

## Install system

My config became quite complex over the time, and it can be assembled in very
different ways depending on which theme I want or which machine I'm on, so
there are a lot of files in this directory. Here is what they are for:

 - `i3-*.config`: i3 config files for different things (gaps, wayland, bar, ...).
   They are assembled into one file on install depending on which functionality
   is needed.
 - `blocks-*.conf`: i3blocks configs for different machines
 - `lock.png`: lock screen image which is merged with a screenshot when the screen is locked
 - `bumblebee-status.conf`: bumblebee-status config
 - `bumblebee-theme-gen.py`: bumblebee-status theme generator
 - `kherson.yml`: kherson (my custom replacement for i3blocks/bumblebee-status) config

### Available themes ("modes")

 - blocks (i3blocks)
 - powerline (feat. bumblebee-status)
 - polybar (you guessed it, using polybar)
 - kherson (my custom replacement for i3blocks written in Go)
 - sway-blocks (sway version, using i3blocks)
 - sway-powerline (sway version, using bumblebee-status)
 - sway-kherson (sway version, using kherson)

---

Lock image:
http://www.groundreport.com/wp-content/uploads/2017/05/icon-1968247_960_720.png

