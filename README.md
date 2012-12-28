# Pigal

A raspberry pi optimized full-screen gallery program that can talk to flickr
and smugmug.

## Midori in fullscreen mode

  midori -e Fullscreen -a http://localhost:9393/

## Configuration

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
