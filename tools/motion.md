FROM: 
https://gist.githubusercontent.com/endolith/2052778/raw/48283f147d3628b820a7b96194fc365ba5e4a263/readme.md

Grr this took hours to figure out.  I was trying to install MJPG-streamer and running VLC command lines and all this crap but nothing worked.

First install `motion`:

    ~> sudo apt-get install motion

Then create a config file:

    ~> mkdir ~/.motion
    ~> nano ~/.motion/motion.conf

In it, the bare minimum to run a web server and view it on other computers:

    webcam_port 8081
    webcam_localhost off
    
    ## MAYBE:
    stream_port 8080
    stream_localhost off

Then run motion:

    ~> motion

Now you can view the webcam at http://hostname:8081  If it doesn't work, try rebooting between steps or something.

Isn't that easy?  >:(

See also: [How to run webcam software only when I am not home](http://superuser.com/a/512706/13898)

