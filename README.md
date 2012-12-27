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

You can add flickr RSS feeds to config.yml too. However, there's a
bug in the core ruby RSS parser that means we have to use rss 0.92 feeds.
Change "format=" from "rss_200" to just "rss", thusly:

  http://api.flickr.com/services/feeds/photos_public.gne?id=52614599@N00&lang=en-us&format=rss

## Author

Dan Collis-Puro - dan@collispuro.net

## License

BSD
