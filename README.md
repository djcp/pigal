# Pigal

A raspberry pi optimized full-screen gallery program that can talk to flickr
and smugmug.

## Installation

* Install raspbian
* Install necessary packages:
    sudo aptitude install git ruby1.9.3 build-essential libxml2-dev libxml2
* Check out pigal into a local repository:
    git clone git://github.com/djcp/pigal.git /home/pi/pigal/
* Install the necessary ruby gems:
    cd /home/pi/pigal/ && sudo bundle
* Create the cronjob that'll start the pigal server at boot:
    (crontab -l ; echo "@reboot /home/pi/pigal/bin/pigal start") | crontab -
* Visit http://<your pi ip address>:9292/

Please check out '''bin/setup.sh''' which should handle the steps above for you.

## Midori in fullscreen mode

  midori -e Fullscreen -a http://localhost:9292/

## Configuration

pigal logs to syslog. You can edit config.yml to change various options about how the slideshow displays and add new image sources.

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
