<!DOCTYPE html>
<html
  class=""
  lang="en-us"
  prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb#"
>
  <head>
    <meta charset="utf-8" />

    <script type="application/ld+json">
    {
        "@context" : "http://schema.org",
        "@type" : "BlogPosting",
        "mainEntityOfPage": {
             "@type": "WebPage",
             "@id": "\/"
        },
        "articleSection" : "projects",
        "name" : "Freewritten",
        "headline" : "Freewritten",
        "description" : "A simple journaling tool. Track your daily writing streak.",
        "inLanguage" : "en-US",
        "author" : "",
        "creator" : "",
        "publisher": "",
        "accountablePerson" : "",
        "copyrightHolder" : "",
        "copyrightYear" : "2019",
        "datePublished": "2019-07-16 22:50:31.23 \x2b0000 UTC",
        "dateModified" : "2019-07-16 22:50:31.23 \x2b0000 UTC",
        "url" : "\/freewritten.com",
        "wordCount" : "13",
        "keywords" : [ "Blog" ]
    }
    </script>

    <title>Freewritten - Tim Pittman</title>
    <link rel="canonical" href="/freewritten.com" />



    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="description" content="A simple journaling tool. Track your daily writing streak.|Currently director of client programs &lt;a href=&#39;bazaarvoice.com&#39;&gt;bazaarvoice&lt;/a&gt;. Formerly customer success &lt;a href=&#39;sumo.com&#39;&gt;Sumo.com&lt;/a&gt;. &lt;/br&gt;&lt;/br&gt; Host of the Valencia CF Podcast 🎤" />
<meta name="HandheldFriendly" content="True" />
<meta name="MobileOptimized" content="320" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<meta name="description" content="A simple journaling tool. Track your daily writing streak." />

<meta name="keywords" content="">


<meta property="og:type" content="article" />
<meta property="og:description" content="A simple journaling tool. Track your daily writing streak." />
<meta property="og:title" content="Freewritten" />
<meta property="og:site_name" content="Tim Pittman" />
<meta property="og:image" content="" />
<meta property="og:image:type" content="image/jpeg" />
<meta property="og:image:width" content="" />
<meta property="og:image:height" content="" />
<meta property="og:url" content="/freewritten.com" />
<meta property="og:locale" content="en-us" />
<meta property="article:published_time" content="2019-07-16
" /> <meta property="article:modified_time" content="2019-07-16
" />




<meta name="twitter:card" content="summary" />
<meta name="twitter:site" content="@pittman021" />
<meta name="twitter:creator" content="@pittman021" />
<meta
  name="twitter:title"
  content="Freewritten | Tim Pittman"
/>
<meta
  name="twitter:description"
  content="A simple journaling tool. Track your daily writing streak.|Currently director of client programs &lt;a href=&#39;bazaarvoice.com&#39;&gt;bazaarvoice&lt;/a&gt;. Formerly customer success &lt;a href=&#39;sumo.com&#39;&gt;Sumo.com&lt;/a&gt;. &lt;/br&gt;&lt;/br&gt; Host of the Valencia CF Podcast 🎤"
/>
<meta name="twitter:image:src" content="" />
<meta name="twitter:domain" content="/freewritten.com" />

<script src="https://identity.netlify.com/v1/netlify-identity-widget.js"></script>


    <link
  rel="stylesheet"
  href="https://unpkg.com/tachyons@4.11.1/css/tachyons.min.css"
/>

<link rel="stylesheet" href="/css/style.css" />

<link
  rel="stylesheet"
  href="https://cdn.jsdelivr.net/npm/highlightjs@9.12.0/styles/github-gist.css"
/>


<script type="application/javascript">
var dnt = (navigator.doNotTrack || window.doNotTrack || navigator.msDoNotTrack);
var doNotTrack = (dnt == "1" || dnt == "yes");
if (!doNotTrack) {
	window.ga=window.ga||function(){(ga.q=ga.q||[]).push(arguments)};ga.l=+new Date;
	if (window.sessionStorage) {
		var GA_SESSION_STORAGE_KEY = 'ga:clientId';
		ga('create', 'UA-102047143-1', {
	    'storage': 'none',
	    'clientId': sessionStorage.getItem(GA_SESSION_STORAGE_KEY)
	   });
	   ga(function(tracker) {
	    sessionStorage.setItem(GA_SESSION_STORAGE_KEY, tracker.get('clientId'));
	   });
   }
	ga('set', 'anonymizeIp', true);
	ga('send', 'pageview');
}
</script>
<script async src='https://www.google-analytics.com/analytics.js'></script>


    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="apple-touch-icon" href="/apple-touch-icon.png" />
  </head>


<body
  lang="en-us"
  class="sans-serif w-90 w-60-ns center center-ns mv2 mv5-ns"
  itemscope
  itemtype="http://schema.org/Article"
>
  
  <span class="b">/ </span>
  <a
    href="/"
    class="b bb bw1 pb1 no-underline black"
    >Tim Pittman</a
  >

  <section id="main" class="mt5">
    <h1 itemprop="name" id="title">Freewritten</h1>

    <article itemprop="articleBody" id="content" class="w-90 lh-copy">
      A simple journaling tool. Track your daily writing streak.

    </article>
  </section>

  <footer>
    <div>
      <p class="f6 gray mt6 lh-copy">
        <a href='https://twitter.com/pittman021'>pittman021</a>.
      </p>
    </div>
  </footer>
  
  <script src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/9.14.2/highlight.min.js"></script>

<script src="https://whatthefaq.herokuapp.com/js/widget.js"></script>
<script>WTF_Lib.init(["5d434062d337150004c82c17"]);WTF_Lib.check();</script>			

<script>
  hljs.initHighlightingOnLoad();
</script>



  </body>
</html>
