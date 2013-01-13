# Pigal

A raspberry pi optimized full-screen gallery program that can talk to flickr,
smugmug and deviantart (more coming soon!).

## Installation

* Install raspbian
* Check out pigal into a local repository:

    ```git clone git://github.com/djcp/pigal.git /home/pi/pigal/```

* Run the setup script which will install the necessary debian packages, ruby
  gems and ensure the pigal server starts at boot via an @reboot cron job. It's
  fairly easy to understand so please review it before proceeding.

    ```cd /home/pi/pigal && ./bin/setup.sh```

* Reboot your pi.
* Visit http://<your pi ip address>:9292/

## Midori in fullscreen mode

The default midori browser makes an excellent slideshow viewer if you're using
your pi to control a display as well.

  midori -e Fullscreen -a http://localhost:9292/

## Configuration

pigal logs to syslog. You can edit config.yml to change various options about
how the slideshow displays and add new image sources.

### Smugmug

Add smugmug Atom gallery URLs (one per line) to config.yml. They look something like:

  http://youraccount.smugmug.com/hack/feed.mg?Type=gallery&Data=24533581_cCxzNm&format=atom10

### Flickr

Flickr RSS feeds work fine. They look like:

  http://api.flickr.com/services/feeds/photos_public.gne?id=52614599@N00&lang=en-us&format=rss_200

### Deviantart

Deviantart gallery RSS feeds are supported - probably the easiest way to find
them is to navigate to a gallery, "view source" and look for:

    <link rel="alternate" type="application/rss+xml" title="deviantART: Roses" href="http://backend.deviantart.com/rss.xml?q=gallery%3Aaoao2%2F36733838&type=deviation" />

and the URL is:

  http://backend.deviantart.com/rss.xml?q=gallery%3Aaoao2%2F36733838&type=deviation

## Author

Dan Collis-Puro - dan@collispuro.net

## License

BSD
