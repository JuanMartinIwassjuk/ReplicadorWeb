<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge"><script type="text/javascript">window.NREUM||(NREUM={}),__nr_require=function(e,n,t){function r(t){if(!n[t]){var o=n[t]={exports:{}};e[t][0].call(o.exports,function(n){var o=e[t][1][n];return r(o||n)},o,o.exports)}return n[t].exports}if("function"==typeof __nr_require)return __nr_require;for(var o=0;o<t.length;o++)r(t[o]);return r}({1:[function(e,n,t){function r(){}function o(e,n,t){return function(){return i(e,[c.now()].concat(u(arguments)),n?null:this,t),n?void 0:this}}var i=e("handle"),a=e(3),u=e(4),f=e("ee").get("tracer"),c=e("loader"),s=NREUM;"undefined"==typeof window.newrelic&&(newrelic=s);var p=["setPageViewName","setCustomAttribute","setErrorHandler","finished","addToTrace","inlineHit","addRelease"],d="api-",l=d+"ixn-";a(p,function(e,n){s[n]=o(d+n,!0,"api")}),s.addPageAction=o(d+"addPageAction",!0),s.setCurrentRouteName=o(d+"routeName",!0),n.exports=newrelic,s.interaction=function(){return(new r).get()};var m=r.prototype={createTracer:function(e,n){var t={},r=this,o="function"==typeof n;return i(l+"tracer",[c.now(),e,t],r),function(){if(f.emit((o?"":"no-")+"fn-start",[c.now(),r,o],t),o)try{return n.apply(this,arguments)}catch(e){throw f.emit("fn-err",[arguments,this,e],t),e}finally{f.emit("fn-end",[c.now()],t)}}}};a("actionText,setName,setAttribute,save,ignore,onEnd,getContext,end,get".split(","),function(e,n){m[n]=o(l+n)}),newrelic.noticeError=function(e,n){"string"==typeof e&&(e=new Error(e)),i("err",[e,c.now(),!1,n])}},{}],2:[function(e,n,t){function r(e,n){if(!o)return!1;if(e!==o)return!1;if(!n)return!0;if(!i)return!1;for(var t=i.split("."),r=n.split("."),a=0;a<r.length;a++)if(r[a]!==t[a])return!1;return!0}var o=null,i=null,a=/Version\/(\S+)\s+Safari/;if(navigator.userAgent){var u=navigator.userAgent,f=u.match(a);f&&u.indexOf("Chrome")===-1&&u.indexOf("Chromium")===-1&&(o="Safari",i=f[1])}n.exports={agent:o,version:i,match:r}},{}],3:[function(e,n,t){function r(e,n){var t=[],r="",i=0;for(r in e)o.call(e,r)&&(t[i]=n(r,e[r]),i+=1);return t}var o=Object.prototype.hasOwnProperty;n.exports=r},{}],4:[function(e,n,t){function r(e,n,t){n||(n=0),"undefined"==typeof t&&(t=e?e.length:0);for(var r=-1,o=t-n||0,i=Array(o<0?0:o);++r<o;)i[r]=e[n+r];return i}n.exports=r},{}],5:[function(e,n,t){n.exports={exists:"undefined"!=typeof window.performance&&window.performance.timing&&"undefined"!=typeof window.performance.timing.navigationStart}},{}],ee:[function(e,n,t){function r(){}function o(e){function n(e){return e&&e instanceof r?e:e?f(e,u,i):i()}function t(t,r,o,i){if(!d.aborted||i){e&&e(t,r,o);for(var a=n(o),u=v(t),f=u.length,c=0;c<f;c++)u[c].apply(a,r);var p=s[y[t]];return p&&p.push([b,t,r,a]),a}}function l(e,n){h[e]=v(e).concat(n)}function m(e,n){var t=h[e];if(t)for(var r=0;r<t.length;r++)t[r]===n&&t.splice(r,1)}function v(e){return h[e]||[]}function g(e){return p[e]=p[e]||o(t)}function w(e,n){c(e,function(e,t){n=n||"feature",y[t]=n,n in s||(s[n]=[])})}var h={},y={},b={on:l,addEventListener:l,removeEventListener:m,emit:t,get:g,listeners:v,context:n,buffer:w,abort:a,aborted:!1};return b}function i(){return new r}function a(){(s.api||s.feature)&&(d.aborted=!0,s=d.backlog={})}var u="nr@context",f=e("gos"),c=e(3),s={},p={},d=n.exports=o();d.backlog=s},{}],gos:[function(e,n,t){function r(e,n,t){if(o.call(e,n))return e[n];var r=t();if(Object.defineProperty&&Object.keys)try{return Object.defineProperty(e,n,{value:r,writable:!0,enumerable:!1}),r}catch(i){}return e[n]=r,r}var o=Object.prototype.hasOwnProperty;n.exports=r},{}],handle:[function(e,n,t){function r(e,n,t,r){o.buffer([e],r),o.emit(e,n,t)}var o=e("ee").get("handle");n.exports=r,r.ee=o},{}],id:[function(e,n,t){function r(e){var n=typeof e;return!e||"object"!==n&&"function"!==n?-1:e===window?0:a(e,i,function(){return o++})}var o=1,i="nr@id",a=e("gos");n.exports=r},{}],loader:[function(e,n,t){function r(){if(!E++){var e=x.info=NREUM.info,n=l.getElementsByTagName("script")[0];if(setTimeout(s.abort,3e4),!(e&&e.licenseKey&&e.applicationID&&n))return s.abort();c(y,function(n,t){e[n]||(e[n]=t)}),f("mark",["onload",a()+x.offset],null,"api");var t=l.createElement("script");t.src="https://"+e.agent,n.parentNode.insertBefore(t,n)}}function o(){"complete"===l.readyState&&i()}function i(){f("mark",["domContent",a()+x.offset],null,"api")}function a(){return O.exists&&performance.now?Math.round(performance.now()):(u=Math.max((new Date).getTime(),u))-x.offset}var u=(new Date).getTime(),f=e("handle"),c=e(3),s=e("ee"),p=e(2),d=window,l=d.document,m="addEventListener",v="attachEvent",g=d.XMLHttpRequest,w=g&&g.prototype;NREUM.o={ST:setTimeout,SI:d.setImmediate,CT:clearTimeout,XHR:g,REQ:d.Request,EV:d.Event,PR:d.Promise,MO:d.MutationObserver};var h=""+location,y={beacon:"bam.nr-data.net",errorBeacon:"bam.nr-data.net",agent:"js-agent.newrelic.com/nr-1118.min.js"},b=g&&w&&w[m]&&!/CriOS/.test(navigator.userAgent),x=n.exports={offset:u,now:a,origin:h,features:{},xhrWrappable:b,userAgent:p};e(1),l[m]?(l[m]("DOMContentLoaded",i,!1),d[m]("load",r,!1)):(l[v]("onreadystatechange",o),d[v]("onload",r)),f("mark",["firstbyte",u],null,"api");var E=0,O=e(5)},{}]},{},["loader"]);</script>
    <title>Push Notification Advertising Network | neptuneads.com</title>
    <meta name="description" content="neptuneads.com provides a web push solution for publishers to make money from their existing user base and for advertisers to buy push notifications from a variety of countries, browsers & devices.">
    <link rel="stylesheet" href="css/_bower.css">
	<link rel="stylesheet" href="//use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css?v3">
	<link rel="stylesheet" type="text/css" href="css/flags.min.css">
	<link rel="icon" type="image/png" sizes="32x32" href="favicon.ico">
	<style type="text/css">
	.feature-about i {
    font-size: 36px;
    color: #74bf9d;
	}
	.feature-about {
	padding: 50px;
	text-align: center;
	padding-top: 30px;
	}
	.feature-about-info {
	padding: 10px;
	}
	</style>

  </head>
  <body>
    <header class="header">
      <nav class="navbar navbar-default">
        <div class="container">
          <div class="navbar-header">
            <button class="navbar-toggle collapsed" type="button" data-toggle="collapse" data-target="#navigation" aria-expanded="false"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button><a class="navbar-brand" href="#"><img class="logo_light" src="https://neptuneads.com/img/neptune.png?v=1"><img class="logo_dark" src="https://neptuneads.com/img/neptune.png?v=1"></a>
			<span style="color: #34abe1; font-size: 20px; line-height: 40px; margin-left: 10px;">Neptune Push</span>
          </div>
          <div class="collapse navbar-collapse" id="navigation">
            <ul class="nav navbar-nav navbar-right">
              <li><a href="#what-we-offer">About</a></li>
			  <li><a href="https://ads.neptuneadspush.com/signup.php">SIGN UP</a>
              <li><a href="https://ads.neptuneadspush.com/">SIGN IN</a>
			  </li>

              <li><a href="#footer">Contact</a></li>
            </ul>
          </div>
        </div>
      </nav>
    </header>
    <div class="hero">
      <div class="hero__overlay"></div>
      <div class="hero_background">
        <iframe class="hero__background__map" src="map/index.html" scrolling="no" frameborder="0" seamless="seamless"></iframe>
      </div>
      <div class="hero__inside">
        <h1 class="hero__inside__title">Push Notification Advertising</h1><span class="hero__inside__subtitle">The Best Facebook & Adwords alternative. <br> <br> Reach the right people, at the right moment, at the right place - even when their browser is closed. You can send millions of messages in a glance, to multiple browsers and multiple devices (Desktop, Mobile & Tablets).</span>
        <a class="hero__inside__button hero__inside__button--left" href="#what-we-offer"> What can we offer?</a>

      </div>
    </div>

	<div class="row feature-about">
	<div style=''>
	<h1>Your Advertising is Broken</h1>
	<div style="text-align: justify;">Today your audience sees your message while they are browsing someone else's property or inside someone else's app. This is broken. You can't reach them in their real life, you can't reach them when they are most receptive to your message. Your message is a prisoner inside other people's properties. It is time to break free.
	Imagine reaching your audience when YOU want them to see your message. Reach them  during their commute and remind them to stop and get your product. Reach them in the morning to wish them a great day and increase positive brand association.
	You are now able to break out of the web page and reach them live wherever and whenever they may be.
	</div>
	</div>
		<div class="col-md-6 col-sm-6">
			<div class="feature-about-info">
				<i class="fas fa-clock" style='font-size:70px;'></i>
				<h3>Time Targeting</h3>
				<p>Reach your audience whenever YOU want, we will push your ad to them even thought their are not browsing the web.</p>
			</div><!-- /.feature-about-info -->
		</div>
		<div class="col-md-6 col-sm-6">
			<div class="feature-about-info">
				<i class="fas fa-cloud-sun-rain" style='font-size:70px;'></i>
				<h3>Weather Targeting</h3>
				<p>Want to reach your Audience when it's rainning? When it's hot? Our technology allows you to do it.</p>
			</div><!-- /.feature-about-info -->
		</div>
	</div>


	<div class="row feature-about">
		<div class="col-md-3 col-sm-6">
			<div class="feature-about-info">
				<i class="fa fa-male"></i>
				<h4>Demographic Targeting</h4>
				<p>Target your users based on their Age, Gender, Language &amp; Household Income</p>
			</div><!-- /.feature-about-info -->
		</div>
		<div class="col-md-3 col-sm-6">
			<div class="feature-about-info">
				<i class="fa fa-map-marker"></i>
				<h4>GEO Targeting</h4>
				<p>Specify the country, city or location you would like to target</p>
			</div><!-- /.feature-about-info -->
		</div>
		<div class="col-md-3 col-sm-6">
			<div class="feature-about-info">
				<i class="fa fa-mobile"></i>
				<h4>Device Targeting</h4>
				<p>Choose the device type you would like to reach as well as its Brand and Model</p>
			</div><!-- /.feature-about-info -->
		</div>
		<div class="col-md-3 col-sm-6">
			<div class="feature-about-info">
				<i class="fa fa-globe"></i>
				<h4>Internet Provider</h4>
				<p>Target your users based on their internet service provider and/or their internet speed</p>
			</div><!-- /.feature-about-info -->
		</div>
	</div>

    <section class="section section__offer" id="what-we-offer">
      <div class="container">
        <div class="row">
          <div class="col-md-12">

           <div class="col-md-12">

            <div class="section__heading" style="    margin-bottom: 30px !important;     margin-top: 40px; ">
              <h1 class="section__heading__title">Are you a publisher or an advertiser ?</h1><span class="section__heading__seperator"></span>
            </div>

           </div>

          </div>
        </div>
        <div class="row">
          <div class="col-md-6">
            <div class="section__offer__item section__offer__item--publisher">
              <div class="section__offer__item__heading"><img class="section__offer__item__heading__icon" src="img/icons/publisher-img.png">
                <h2 class="section__offer__item__heading__title">Publishers</h2><span class="section__offer__item__heading__sub_title">Earn money from your website, blog or other traffic source. Have an additional revenue stream without hurting your site performance.</span>
              </div>
              <ul class="section__offer__item__features equal-height-item">
                <li class="section__offer__item__features__item">
                  <div class="section__offer__item__features__item__inside section__offer__item__features__item__inside--publisher"><span class="section__offer__item__features__item__inside__icon section__offer__item__features__item__inside__icon--publisher"><i class="fa fa-check"></i></span><span class="section__offer__item__features__item__inside__info"><span class="section__offer__item__features__item__inside__info__title section__offer__item__features__item__inside__info__title--green">Additional Revenue Stream</span><span class="section__offer__item__features__item__inside__info__description">Earning more from your website and staying profitable is every publishers goal.  By utilizing our technology we provide publishers an additional way to bring in income from your website.</span></span></div>
                </li>
                <li class="section__offer__item__features__item">
                  <div class="section__offer__item__features__item__inside section__offer__item__features__item__inside--publisher"><span class="section__offer__item__features__item__inside__icon section__offer__item__features__item__inside__icon--publisher"><i class="fa fa-check"></i></span><span class="section__offer__item__features__item__inside__info"><span class="section__offer__item__features__item__inside__info__title section__offer__item__features__item__inside__info__title--green">Unique Monetization</span><span class="section__offer__item__features__item__inside__info__description">Our push technology does not replace any of your current ad units.  It's almost like you are earning daily income in the background with out anyone even knowing.</span></span></div>
                </li>
                <li class="section__offer__item__features__item">
                  <div class="section__offer__item__features__item__inside section__offer__item__features__item__inside--publisher"><span class="section__offer__item__features__item__inside__icon section__offer__item__features__item__inside__icon--publisher"><i class="fa fa-check"></i></span><span class="section__offer__item__features__item__inside__info"><span class="section__offer__item__features__item__inside__info__title section__offer__item__features__item__inside__info__title--green">Easy to implement</span><span class="section__offer__item__features__item__inside__info__description">Integrating our push ad technology into your website is not that difficult.  Our dedicated team will walk you through all the steps of integration and even personally help you if you are having difficulties.</span></span></div>
                </li>
                <li class="section__offer__item__features__item">
                  <div class="section__offer__item__features__item__inside section__offer__item__features__item__inside--publisher"><span class="section__offer__item__features__item__inside__icon section__offer__item__features__item__inside__icon--publisher"><i class="fa fa-check"></i></span><span class="section__offer__item__features__item__inside__info"><span class="section__offer__item__features__item__inside__info__title section__offer__item__features__item__inside__info__title--green">User Value</span><span class="section__offer__item__features__item__inside__info__description">Life time value of your users is calculated over time so that you can determine how much revenue a single user brings in.  This is valuable data!</span></span></div>
                </li>
              </ul>
            </div>
          </div>
          <div class="col-md-6">
            <div class="section__offer__item section__offer__item--advertiser">
              <div class="section__offer__item__heading"><img class="section__offer__item__heading__icon" src="img/icons/advertiser-img.png">
                <h2 class="section__offer__item__heading__title">Advertisers</h2><span class="section__offer__item__heading__sub_title">Get your message out to an extremely targeted audience.</span>
              </div>
              <ul class="section__offer__item__features equal-height-item">
                <li class="section__offer__item__features__item">
                  <div class="section__offer__item__features__item__inside section__offer__item__features__item__inside--advertiser"><span class="section__offer__item__features__item__inside__icon section__offer__item__features__item__inside__icon--advertiser"><i class="fa fa-check"></i></span><span class="section__offer__item__features__item__inside__info"><span class="section__offer__item__features__item__inside__info__title section__offer__item__features__item__inside__info__title--green">Untapped Inventory</span><span class="section__offer__item__features__item__inside__info__description">Be one of the first to utilize this new technology.</span></span></div>
                </li>
                <li class="section__offer__item__features__item">
                  <div class="section__offer__item__features__item__inside section__offer__item__features__item__inside--advertiser"><span class="section__offer__item__features__item__inside__icon section__offer__item__features__item__inside__icon--advertiser"><i class="fa fa-check"></i></span><span class="section__offer__item__features__item__inside__info"><span class="section__offer__item__features__item__inside__info__title section__offer__item__features__item__inside__info__title--green">Targetable Audience</span><span class="section__offer__item__features__item__inside__info__description">Our push notification targeting is phenomenal.  Target by country, city, state, connection type, carrier, ISP, device, OS, OS version, browser, browser version, and category.</span></span></div>
                </li>
                <li class="section__offer__item__features__item">
                  <div class="section__offer__item__features__item__inside section__offer__item__features__item__inside--advertiser"><span class="section__offer__item__features__item__inside__icon section__offer__item__features__item__inside__icon--advertiser"><i class="fa fa-check"></i></span><span class="section__offer__item__features__item__inside__info"><span class="section__offer__item__features__item__inside__info__title section__offer__item__features__item__inside__info__title--green">CPM Bidding</span><span class="section__offer__item__features__item__inside__info__description">We only allow one notification to be sent to a single user per day.  Advertisers bid on a CPM basis to have their push notification sent out.  Winning bids are selected at midnight EST and are sent out the next day at the advertisers set time.</span></span></div>
                </li>
                <li class="section__offer__item__features__item">
                  <div class="section__offer__item__features__item__inside section__offer__item__features__item__inside--advertiser"><span class="section__offer__item__features__item__inside__icon section__offer__item__features__item__inside__icon--advertiser"><i class="fa fa-check"></i></span><span class="section__offer__item__features__item__inside__info"><span class="section__offer__item__features__item__inside__info__title section__offer__item__features__item__inside__info__title--green">Affordable CPM</span><span class="section__offer__item__features__item__inside__info__description">Pay for only the amount of traffic you want.</span></span></div>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="section section__statistics">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="section__heading section__heading--no-margin">
              <h1 class="section__heading__title section__heading__title--white">Supported on all push enabled browsers</h1><span class="section__heading__sub_title section__heading__sub_title--white"></span><span class="section__heading__seperator section__heading__seperator--white"></span>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-3">
            <div class="section__statistics__browser"><img class="section__statistics__browser__icon" src="img/browsers/chrome.svg"><span class="section__statistics__browser__title">Chrome (Android &amp; Desktop)</span></div>
          </div>
          <div class="col-md-3">
            <div class="section__statistics__browser"><img class="section__statistics__browser__icon" src="img/browsers/safari.png"><span class="section__statistics__browser__title">Safari (Desktop)</span></div>
          </div>
          <div class="col-md-3">
            <div class="section__statistics__browser"><img class="section__statistics__browser__icon" src="img/browsers/firefox.svg"><span class="section__statistics__browser__title">FireFox (Desktop)</span></div>
          </div>
          <div class="col-md-3">
            <div class="section__statistics__browser"><img class="section__statistics__browser__icon" src="img/browsers/opera.png"><span class="section__statistics__browser__title">Opera ( Android &amp; Desktop)</span></div>
          </div>
        </div>
        <div class="row">
          <!--<div class="col-md-4 col-md-offset-2">
            <div class="section__statistics__item">
              <h4 data-bind="html: computed_total()" class="section__statistics__item__number">0</h4><span class="section__statistics__item__description">Subscriber Reach</span>
            </div>
          </div>
          <div class="col-md-4 col-md-offset-4">
            <div class="section__statistics__item">
              <h4 data-bind="html: monthly_total()" class="section__statistics__item__number">0</h4><span class="section__statistics__item__description">Available Monthly Impressions</span>
            </div>
          </div>-->
        </div>
      </div>
    </section>

	<section class="section section__ad_formats" id="ad-formats">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="section__heading">
              <h1 class="section__heading__title">Ad formats</h1><span class="section__heading__seperator"></span>
            </div>
          </div>
        </div>
		<div class="row">
          <div class="col-md-6">
			<h2><br /><br /><br /><i class="fa fa-location-arrow" style="color: #34abe1;"></i>&nbsp; Rich push notifications</h2>
			<h4>are the ad messages that <b>pop up on mobile or desktop devices featuring 100% viewability and extremely high CTR.</b></h4>
          </div>
		  <div class="col-md-6">
			<img src="img/push_sample.png" />
          </div>
        </div>
      </div>
    </section>


    <section class="section section__live_tracking" id="live-tracking">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="section__heading">
              <h1 class="section__heading__title">Live Inventory Targeting</h1><span class="section__heading__seperator"></span>
            </div>
          </div>
        </div>
		<div class="row">
          <div class="col-md-12"><span class="section__live_tracking__total_count"><span class="section__live_tracking__total_count__title">Impressions</span><span class="section__live_tracking__total_count__number" data-bind="html: monthly_total()"><span class="char">7</span><span class="char">8</span><span class="char">4</span><span class="char">5</span><span class="char">3</span><span class="char">2</span><span class="char">6</span><span class="char">1</span><span class="char">4</span></span></span>
            <div style="display:none" ;="" class="section__live_tracking__form">
              <div class="row">
                <div class="col-md-3 col-sm-6">
                  <div class="form-group">
                    <label>Browser</label>
                    <select class="form-control" data-bind="options: browsers, optionsText: 'name', optionsValue: 'id', value: selected_browser, event: { change: fetchData }"><option value="">All</option><option value="Chrome Mobile">Chrome Mobile</option><option value="Chrome">Chrome</option><option value="Opera Mobile">Opera Mobile</option><option value="Firefox Mobile">Firefox Mobile</option><option value="Firefox">Firefox</option><option value="Yandex Browser">Yandex Browser</option><option value="Opera">Opera</option><option value="Samsung Internet">Samsung Internet</option><option value="Mail.ru Chromium Browser">Mail.ru Chromium Browser</option><option value="Chromium">Chromium</option></select>
                  </div>
                </div>
                <div class="col-md-3 col-sm-6">
                  <div class="form-group">
                    <label>Operating System</label>
                    <select class="form-control" data-bind="options: operating_systems, optionsText: 'name', optionsValue: 'id', value: selected_os, event: { change: fetchData }"><option value="">All</option><option value="Android">Android</option><option value="Windows 7">Windows 7</option><option value="Windows 10">Windows 10</option><option value="Windows 8.1">Windows 8.1</option><option value="Mac OS X">Mac OS X</option><option value="Chrome OS">Chrome OS</option><option value="Windows 8">Windows 8</option><option value="Linux">Linux</option><option value="Ubuntu">Ubuntu</option></select>
                  </div>
                </div>
                <div class="col-md-3 col-sm-6">
                  <div class="form-group">
                    <label>OS Version</label>
                    <select class="form-control" data-bind="options: os_versions, optionsText: 'name', optionsValue: 'id', value: selected_os_version, event: { change: fetchData }"><option value="">All</option>

                    </select>
                  </div>
                </div>
                <div class="col-md-3 col-sm-6">
                  <div class="form-group">
                    <label>Connection Type</label>
                    <select class="form-control" data-bind="options: connection_types, optionsText: 'name', optionsValue: 'id', value: selected_connection_type, event: { change: fetchData }"><option value="">All</option><option value="Cable/DSL">Cable/DSL</option><option value="Cellular">Cellular</option><option value="Corporate">Corporate</option><option value="Dialup">Dialup</option></select>
                  </div>
                </div>
              </div>
            </div>
            <div class="section__live_tracking__table">
              <div class="section__live_tracking__table__loading hidden" data-bind="css: { hidden: !loading() }"><span class="section__live_tracking__table__loading__loader"></span></div>
              <div class="table-responsive">
                <table class="table table-fixed table-bordered">
                  <thead>
                    <tr>
                    <th style="text-align:center;" class="col-xs-4">Country</th>
                    <!--<th style="text-align:center;" class="col-xs-3">Subscribers</th>-->
                    <th style="text-align:center;" class="col-xs-4">Impressions</th>
                    <th style="text-align:center;" class="col-xs-4">Min CPM</th>
                    </tr>
                  </thead>
                  <tbody class="section__live_tracking__table__body" data-bind="html: computed_rows()">
				  <tr>
					<td class="col-xs-4"><img class="flag flag-us" style="border: none;"> US</td>
					<td class="col-xs-4">10,993,633</td><td class="col-xs-4">$0.128</td>
					</tr>
					<tr><td class="col-xs-4"><img class="flag flag-in" style="border: none;"> IN</td><td class="col-xs-4">8,459,621</td><td class="col-xs-4">$0.100</td></tr>
					<tr><td class="col-xs-4"><img class="flag flag-id" style="border: none;"> ID</td><td class="col-xs-4">7,422,450</td><td class="col-xs-4">$0.100</td></tr>
					<tr><td class="col-xs-4"><img class="flag flag-br" style="border: none;"> BR</td><td class="col-xs-4">2,962,711</td><td class="col-xs-4">$0.100</td></tr>
					<tr><td class="col-xs-4"><img class="flag flag-ph" style="border: none;"> PH</td><td class="col-xs-4">2,466,768</td><td class="col-xs-4">$0.100</td></tr>
					<tr><td class="col-xs-4"><img class="flag flag-mx" style="border: none;"> MX</td><td class="col-xs-4">1,546,583</td><td class="col-xs-4">$0.100</td></tr>
					<tr><td class="col-xs-4"><img class="flag flag-ar" style="border: none;"> AR</td><td class="col-xs-4">1,151,162</td><td class="col-xs-4">$0.100</td></tr>
					<tr><td class="col-xs-4"><img class="flag flag-th" style="border: none;"> TH</td><td class="col-xs-4">1,947,717</td><td class="col-xs-4">$0.100</td></tr>
					<tr><td class="col-xs-4"><img class="flag flag-tr" style="border: none;"> TR</td><td class="col-xs-4">1,060,254</td><td class="col-xs-4">$0.100</td></tr>
					<tr><td class="col-xs-4"><img class="flag flag-gb" style="border: none;"> GB</td><td class="col-xs-4">1,593,121</td><td class="col-xs-4">$0.102</td></tr>
					<tr><td class="col-xs-4"><img class="flag flag-fr" style="border: none;"> FR</td><td class="col-xs-4">964,464</td><td class="col-xs-4">$0.100</td></tr>
					<tr><td class="col-xs-4"><img class="flag flag-my" style="border: none;"> MY</td><td class="col-xs-4">1,211,693</td><td class="col-xs-4">$0.100</td></tr>
					<tr><td class="col-xs-4"><img class="flag flag-eg" style="border: none;"> EG</td><td class="col-xs-4">1,481,423</td><td class="col-xs-4">$0.100</td></tr>
					<tr><td class="col-xs-4"><img class="flag flag-it" style="border: none;"> IT</td><td class="col-xs-4">1,225,751</td><td class="col-xs-4">$0.100</td></tr>
					<tr><td class="col-xs-4"><img class="flag flag-de" style="border: none;"> DE</td><td class="col-xs-4">1,060,436</td><td class="col-xs-4">$0.100</td></tr>
					<tr><td class="col-xs-4"><img class="flag flag-co" style="border: none;"> CO</td><td class="col-xs-4">693,205</td><td class="col-xs-4">$0.100</td></tr>
					<tr><td class="col-xs-4"><img class="flag flag-vn" style="border: none;"> VN</td><td class="col-xs-4">1,270,357</td><td class="col-xs-4">$0.100</td></tr>
					<tr><td class="col-xs-4"><img class="flag flag-es" style="border: none;"> ES</td><td class="col-xs-4">827,669</td><td class="col-xs-4">$0.100</td></tr>
					<tr><td class="col-xs-4"><img class="flag flag-dz" style="border: none;"> DZ</td><td class="col-xs-4">705,713</td><td class="col-xs-4">$0.100</td></tr>
					<tr><td class="col-xs-4"><img class="flag flag-iq" style="border: none;"> IQ</td><td class="col-xs-4">1,180,573</td><td class="col-xs-4">$0.100</td></tr>
					<tr><td class="col-xs-4"><img class="flag flag-ru" style="border: none;"> RU</td><td class="col-xs-4">673,517</td><td class="col-xs-4">$0.100</td></tr>
					<tr><td class="col-xs-4"><img class="flag flag-cl" style="border: none;"> CL</td><td class="col-xs-4">470,938</td><td class="col-xs-4">$0.100</td></tr>
					<tr><td class="col-xs-4"><img class="flag flag-pk" style="border: none;"> PK</td><td class="col-xs-4">544,589</td><td class="col-xs-4">$0.100</td></tr>
					<tr><td class="col-xs-4"><img class="flag flag-pe" style="border: none;"> PE</td><td class="col-xs-4">356,428</td><td class="col-xs-4">$0.100</td></tr>
					<tr><td class="col-xs-4"><img class="flag flag-ma" style="border: none;"> MA</td><td class="col-xs-4">411,252</td><td class="col-xs-4">$0.100</td></tr>
					<tr><td class="col-xs-4"><img class="flag flag-ca" style="border: none;"> CA</td><td class="col-xs-4">617,725</td><td class="col-xs-4">$0.100</td></tr>
					<tr><td class="col-xs-4"><img class="flag flag-ec" style="border: none;"> EC</td><td class="col-xs-4">303,205</td><td class="col-xs-4">$0.100</td></tr>
					<tr><td class="col-xs-4"><img class="flag flag-sa" style="border: none;"> SA</td><td class="col-xs-4">391,059</td><td class="col-xs-4">$0.100</td></tr>
					<tr><td class="col-xs-4"><img class="flag flag-pl" style="border: none;"> PL</td><td class="col-xs-4">361,691</td><td class="col-xs-4">$0.100</td></tr>
					<tr><td class="col-xs-4"><img class="flag flag-ro" style="border: none;"> RO</td><td class="col-xs-4">385,050</td><td class="col-xs-4">$0.100</td></tr>
					<tr><td class="col-xs-4"><img class="flag flag-za" style="border: none;"> ZA</td><td class="col-xs-4">194,265</td><td class="col-xs-4">$0.100</td></tr>
					<tr><td class="col-xs-4"><img class="flag flag-tn" style="border: none;"> TN</td><td class="col-xs-4">298,588</td><td class="col-xs-4">$0.100</td></tr>
					<tr><td class="col-xs-4"><img class="flag flag-bd" style="border: none;"> BD</td><td class="col-xs-4">279,553</td><td class="col-xs-4">$0.100</td></tr>
					<tr><td class="col-xs-4"><img class="flag flag-nl" style="border: none;"> NL</td><td class="col-xs-4">346,611</td><td class="col-xs-4">$0.100</td></tr>
					<tr><td class="col-xs-4"><img class="flag flag-au" style="border: none;"> AU</td><td class="col-xs-4">369,238</td><td class="col-xs-4">$0.100</td></tr>
					<tr><td class="col-xs-4"><img class="flag flag-gr" style="border: none;"> GR</td><td class="col-xs-4">243,610</td><td class="col-xs-4">$0.100</td></tr>
					<tr><td class="col-xs-4"><img class="flag flag-ua" style="border: none;"> UA</td><td class="col-xs-4">229,548</td><td class="col-xs-4">$0.100</td></tr>
					<tr><td class="col-xs-4"><img class="flag flag-il" style="border: none;"> IL</td><td class="col-xs-4">320,087</td><td class="col-xs-4">$0.100</td></tr>
					<tr><td class="col-xs-4"><img class="flag flag-do" style="border: none;"> DO</td><td class="col-xs-4">260,795</td><td class="col-xs-4">$0.100</td></tr>
					<tr><td class="col-xs-4"><img class="flag flag-kh" style="border: none;"> KH</td><td class="col-xs-4">308,829</td><td class="col-xs-4">$0.119</td></tr>
					<tr><td class="col-xs-4"><img class="flag flag-be" style="border: none;"> BE</td><td class="col-xs-4">230,428</td><td class="col-xs-4">$0.100</td></tr>
					<tr><td class="col-xs-4"><img class="flag flag-bo" style="border: none;"> BO</td><td class="col-xs-4">219,282</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-sg" style="border: none;"> SG</td><td class="col-xs-4">185,715</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-hu" style="border: none;"> HU</td><td class="col-xs-4">177,867</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-np" style="border: none;"> NP</td><td class="col-xs-4">185,264</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-jo" style="border: none;"> JO</td><td class="col-xs-4">186,317</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-sy" style="border: none;"> SY</td><td class="col-xs-4">229,256</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-ae" style="border: none;"> AE</td><td class="col-xs-4">230,741</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-ve" style="border: none;"> VE</td><td class="col-xs-4">123,298</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-cz" style="border: none;"> CZ</td><td class="col-xs-4">170,214</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-az" style="border: none;"> AZ</td><td class="col-xs-4">151,362</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-pt" style="border: none;"> PT</td><td class="col-xs-4">130,051</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-kr" style="border: none;"> KR</td><td class="col-xs-4">259,539</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-mm" style="border: none;"> MM</td><td class="col-xs-4">158,249</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-kz" style="border: none;"> KZ</td><td class="col-xs-4">201,841</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-gt" style="border: none;"> GT</td><td class="col-xs-4">132,530</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-se" style="border: none;"> SE</td><td class="col-xs-4">191,174</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-bg" style="border: none;"> BG</td><td class="col-xs-4">165,010</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-jm" style="border: none;"> JM</td><td class="col-xs-4">135,894</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-lb" style="border: none;"> LB</td><td class="col-xs-4">181,721</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-al" style="border: none;"> AL</td><td class="col-xs-4">134,817</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-rs" style="border: none;"> RS</td><td class="col-xs-4">129,121</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-ng" style="border: none;"> NG</td><td class="col-xs-4">84,468</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-ge" style="border: none;"> GE</td><td class="col-xs-4">108,907</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-at" style="border: none;"> AT</td><td class="col-xs-4">152,235</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-cr" style="border: none;"> CR</td><td class="col-xs-4">113,691</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-uy" style="border: none;"> UY</td><td class="col-xs-4">99,946</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-hr" style="border: none;"> HR</td><td class="col-xs-4">118,536</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-nz" style="border: none;"> NZ</td><td class="col-xs-4">92,441</td><td class="col-xs-4">$0.150</td></tr><tr><td class="col-xs-4"><img class="flag flag-hn" style="border: none;"> HN</td><td class="col-xs-4">106,445</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-sv" style="border: none;"> SV</td><td class="col-xs-4">94,234</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-pa" style="border: none;"> PA</td><td class="col-xs-4">89,291</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-fi" style="border: none;"> FI</td><td class="col-xs-4">96,326</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-lk" style="border: none;"> LK</td><td class="col-xs-4">62,527</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-ke" style="border: none;"> KE</td><td class="col-xs-4">45,631</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-tw" style="border: none;"> TW</td><td class="col-xs-4">104,079</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-tt" style="border: none;"> TT</td><td class="col-xs-4">78,532</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-la" style="border: none;"> LA</td><td class="col-xs-4">105,783</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-ps" style="border: none;"> PS</td><td class="col-xs-4">95,548</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-ir" style="border: none;"> IR</td><td class="col-xs-4">119,548</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-sk" style="border: none;"> SK</td><td class="col-xs-4">71,075</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-py" style="border: none;"> PY</td><td class="col-xs-4">84,835</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-ie" style="border: none;"> IE</td><td class="col-xs-4">79,796</td><td class="col-xs-4">$0.167</td></tr><tr><td class="col-xs-4"><img class="flag flag-lt" style="border: none;"> LT</td><td class="col-xs-4">143,119</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-sd" style="border: none;"> SD</td><td class="col-xs-4">37,492</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-by" style="border: none;"> BY</td><td class="col-xs-4">58,630</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-ci" style="border: none;"> CI</td><td class="col-xs-4">43,674</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-jp" style="border: none;"> JP</td><td class="col-xs-4">79,321</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-ba" style="border: none;"> BA</td><td class="col-xs-4">70,883</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-mu" style="border: none;"> MU</td><td class="col-xs-4">61,057</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-mn" style="border: none;"> MN</td><td class="col-xs-4">68,020</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-mk" style="border: none;"> MK</td><td class="col-xs-4">63,653</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-ni" style="border: none;"> NI</td><td class="col-xs-4">48,436</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-pr" style="border: none;"> PR</td><td class="col-xs-4">73,017</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-no" style="border: none;"> NO</td><td class="col-xs-4">78,540</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-ly" style="border: none;"> LY</td><td class="col-xs-4">78,064</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-tz" style="border: none;"> TZ</td><td class="col-xs-4">33,721</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-ch" style="border: none;"> CH</td><td class="col-xs-4">82,268</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-om" style="border: none;"> OM</td><td class="col-xs-4">65,806</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-hk" style="border: none;"> HK</td><td class="col-xs-4">70,983</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-lv" style="border: none;"> LV</td><td class="col-xs-4">58,346</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-sn" style="border: none;"> SN</td><td class="col-xs-4">42,372</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-kw" style="border: none;"> KW</td><td class="col-xs-4">67,424</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-gh" style="border: none;"> GH</td><td class="col-xs-4">28,340</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-qa" style="border: none;"> QA</td><td class="col-xs-4">55,172</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-fj" style="border: none;"> FJ</td><td class="col-xs-4">43,656</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-dk" style="border: none;"> DK</td><td class="col-xs-4">52,282</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-si" style="border: none;"> SI</td><td class="col-xs-4">49,481</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-am" style="border: none;"> AM</td><td class="col-xs-4">52,481</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-cm" style="border: none;"> CM</td><td class="col-xs-4">38,454</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-zw" style="border: none;"> ZW</td><td class="col-xs-4">20,454</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-kg" style="border: none;"> KG</td><td class="col-xs-4">37,466</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-ht" style="border: none;"> HT</td><td class="col-xs-4">35,930</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-re" style="border: none;"> RE</td><td class="col-xs-4">21,862</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-bn" style="border: none;"> BN</td><td class="col-xs-4">36,393</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-ee" style="border: none;"> EE</td><td class="col-xs-4">31,168</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-so" style="border: none;"> SO</td><td class="col-xs-4">27,952</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-bh" style="border: none;"> BH</td><td class="col-xs-4">35,689</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-cy" style="border: none;"> CY</td><td class="col-xs-4">29,833</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-bs" style="border: none;"> BS</td><td class="col-xs-4">22,934</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-gy" style="border: none;"> GY</td><td class="col-xs-4">23,096</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-bz" style="border: none;"> BZ</td><td class="col-xs-4">24,324</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-md" style="border: none;"> MD</td><td class="col-xs-4">31,359</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-ml" style="border: none;"> ML</td><td class="col-xs-4">18,146</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-uz" style="border: none;"> UZ</td><td class="col-xs-4">21,564</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-bw" style="border: none;"> BW</td><td class="col-xs-4">11,348</td><td class="col-xs-4">$0.359</td></tr><tr><td class="col-xs-4"><img class="flag flag-cu" style="border: none;"> CU</td><td class="col-xs-4">10,100</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-sr" style="border: none;"> SR</td><td class="col-xs-4">21,379</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-zm" style="border: none;"> ZM</td><td class="col-xs-4">12,649</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-me" style="border: none;"> ME</td><td class="col-xs-4">20,447</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-mg" style="border: none;"> MG</td><td class="col-xs-4">9,829</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-ug" style="border: none;"> UG</td><td class="col-xs-4">8,059</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-ye" style="border: none;"> YE</td><td class="col-xs-4">12,911</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-bb" style="border: none;"> BB</td><td class="col-xs-4">16,528</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-na" style="border: none;"> NA</td><td class="col-xs-4">17,968</td><td class="col-xs-4">$0.338</td></tr><tr><td class="col-xs-4"><img class="flag flag-gp" style="border: none;"> GP</td><td class="col-xs-4">12,368</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-mt" style="border: none;"> MT</td><td class="col-xs-4">19,973</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-bj" style="border: none;"> BJ</td><td class="col-xs-4">14,148</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-bf" style="border: none;"> BF</td><td class="col-xs-4">17,065</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-mq" style="border: none;"> MQ</td><td class="col-xs-4">12,835</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-ga" style="border: none;"> GA</td><td class="col-xs-4">14,812</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-pf" style="border: none;"> PF</td><td class="col-xs-4">12,006</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-af" style="border: none;"> AF</td><td class="col-xs-4">8,256</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-mv" style="border: none;"> MV</td><td class="col-xs-4">13,121</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-lr" style="border: none;"> LR</td><td class="col-xs-4">11,973</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-gf" style="border: none;"> GF</td><td class="col-xs-4">7,518</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-tg" style="border: none;"> TG</td><td class="col-xs-4">10,725</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-lc" style="border: none;"> LC</td><td class="col-xs-4">8,911</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-cn" style="border: none;"> CN</td><td class="col-xs-4">12,144</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-nc" style="border: none;"> NC</td><td class="col-xs-4">9,411</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-gn" style="border: none;"> GN</td><td class="col-xs-4">9,698</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-lu" style="border: none;"> LU</td><td class="col-xs-4">11,115</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-cw" style="border: none;"> CW</td><td class="col-xs-4">8,915</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-et" style="border: none;"> ET</td><td class="col-xs-4">4,838</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-gu" style="border: none;"> GU</td><td class="col-xs-4">6,756</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-ao" style="border: none;"> AO</td><td class="col-xs-4">4,843</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-ag" style="border: none;"> AG</td><td class="col-xs-4">8,722</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-mz" style="border: none;"> MZ</td><td class="col-xs-4">4,780</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-vc" style="border: none;"> VC</td><td class="col-xs-4">5,676</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-gd" style="border: none;"> GD</td><td class="col-xs-4">6,416</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-xk" style="border: none;"> XK</td><td class="col-xs-4">6,059</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-sl" style="border: none;"> SL</td><td class="col-xs-4">6,359</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-cd" style="border: none;"> CD</td><td class="col-xs-4">5,421</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-mr" style="border: none;"> MR</td><td class="col-xs-4">6,506</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-bt" style="border: none;"> BT</td><td class="col-xs-4">6,870</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-pg" style="border: none;"> PG</td><td class="col-xs-4">3,659</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-aw" style="border: none;"> AW</td><td class="col-xs-4">7,307</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-is" style="border: none;"> IS</td><td class="col-xs-4">9,263</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-mw" style="border: none;"> MW</td><td class="col-xs-4">3,605</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-rw" style="border: none;"> RW</td><td class="col-xs-4">4,349</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-yt" style="border: none;"> YT</td><td class="col-xs-4">2,486</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-tj" style="border: none;"> TJ</td><td class="col-xs-4">4,675</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-ls" style="border: none;"> LS</td><td class="col-xs-4">3,248</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-ne" style="border: none;"> NE</td><td class="col-xs-4">3,140</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-mo" style="border: none;"> MO</td><td class="col-xs-4">4,107</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-kn" style="border: none;"> KN</td><td class="col-xs-4">2,532</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-sz" style="border: none;"> SZ</td><td class="col-xs-4">2,354</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-dj" style="border: none;"> DJ</td><td class="col-xs-4">2,825</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-dm" style="border: none;"> DM</td><td class="col-xs-4">2,860</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-sc" style="border: none;"> SC</td><td class="col-xs-4">2,994</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-sx" style="border: none;"> SX</td><td class="col-xs-4">2,894</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-gm" style="border: none;"> GM</td><td class="col-xs-4">2,684</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-ky" style="border: none;"> KY</td><td class="col-xs-4">2,882</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-bi" style="border: none;"> BI</td><td class="col-xs-4">2,399</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-cv" style="border: none;"> CV</td><td class="col-xs-4">1,798</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-vi" style="border: none;"> VI</td><td class="col-xs-4">2,313</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-mp" style="border: none;"> MP</td><td class="col-xs-4">4,483</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-tm" style="border: none;"> TM</td><td class="col-xs-4">3,462</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-tc" style="border: none;"> TC</td><td class="col-xs-4">2,116</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-cg" style="border: none;"> CG</td><td class="col-xs-4">1,485</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-tl" style="border: none;"> TL</td><td class="col-xs-4">2,180</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-vu" style="border: none;"> VU</td><td class="col-xs-4">1,526</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-bq" style="border: none;"> BQ</td><td class="col-xs-4">1,837</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-gl" style="border: none;"> GL</td><td class="col-xs-4">1,462</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-mf" style="border: none;"> MF</td><td class="col-xs-4">1,135</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-je" style="border: none;"> JE</td><td class="col-xs-4">1,664</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-as" style="border: none;"> AS</td><td class="col-xs-4">1,581</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-ad" style="border: none;"> AD</td><td class="col-xs-4">1,792</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-vg" style="border: none;"> VG</td><td class="col-xs-4">1,485</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-ai" style="border: none;"> AI</td><td class="col-xs-4">1,265</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-ws" style="border: none;"> WS</td><td class="col-xs-4">2,158</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-bm" style="border: none;"> BM</td><td class="col-xs-4">1,308</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-pw" style="border: none;"> PW</td><td class="col-xs-4">1,221</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-sb" style="border: none;"> SB</td><td class="col-xs-4">687</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-km" style="border: none;"> KM</td><td class="col-xs-4">588</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-im" style="border: none;"> IM</td><td class="col-xs-4">1,266</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-fm" style="border: none;"> FM</td><td class="col-xs-4">848</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-gi" style="border: none;"> GI</td><td class="col-xs-4">929</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-to" style="border: none;"> TO</td><td class="col-xs-4">611</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-gq" style="border: none;"> GQ</td><td class="col-xs-4">564</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-mh" style="border: none;"> MH</td><td class="col-xs-4">640</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-gg" style="border: none;"> GG</td><td class="col-xs-4">339</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-fo" style="border: none;"> FO</td><td class="col-xs-4">505</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-td" style="border: none;"> TD</td><td class="col-xs-4">200</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-ms" style="border: none;"> MS</td><td class="col-xs-4">303</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-ck" style="border: none;"> CK</td><td class="col-xs-4">215</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-st" style="border: none;"> ST</td><td class="col-xs-4">98</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-ax" style="border: none;"> AX</td><td class="col-xs-4">220</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-ki" style="border: none;"> KI</td><td class="col-xs-4">175</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-li" style="border: none;"> LI</td><td class="col-xs-4">288</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-wf" style="border: none;"> WF</td><td class="col-xs-4">288</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-ss" style="border: none;"> SS</td><td class="col-xs-4">418</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-bl" style="border: none;"> BL</td><td class="col-xs-4">179</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-sm" style="border: none;"> SM</td><td class="col-xs-4">131</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-cf" style="border: none;"> CF</td><td class="col-xs-4">201</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-mc" style="border: none;"> MC</td><td class="col-xs-4">213</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-gw" style="border: none;"> GW</td><td class="col-xs-4">83</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-nr" style="border: none;"> NR</td><td class="col-xs-4">5</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-pm" style="border: none;"> PM</td><td class="col-xs-4">33</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-tv" style="border: none;"> TV</td><td class="col-xs-4">0</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-eh" style="border: none;"> EH</td><td class="col-xs-4">7</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-va" style="border: none;"> VA</td><td class="col-xs-4">0</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-fk" style="border: none;"> FK</td><td class="col-xs-4">0</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-cx" style="border: none;"> CX</td><td class="col-xs-4">19</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-nu" style="border: none;"> NU</td><td class="col-xs-4">14</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-er" style="border: none;"> ER</td><td class="col-xs-4">4</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-nf" style="border: none;"> NF</td><td class="col-xs-4">0</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-tk" style="border: none;"> TK</td><td class="col-xs-4">0</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-io" style="border: none;"> IO</td><td class="col-xs-4">1</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-sh" style="border: none;"> SH</td><td class="col-xs-4">2</td><td class="col-xs-4">$0.100</td></tr><tr><td class="col-xs-4"><img class="flag flag-hm" style="border: none;"> HM</td><td class="col-xs-4">0</td><td class="col-xs-4">$0.100</td></tr></tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="section section__testimonials" id="testimonials">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="section__heading section__heading--no-margin">
              <h1 class="section__heading__title section__heading__title--white">Testimonials</h1><span class="section__heading__seperator section__heading__seperator--white"></span>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6">
            <div class="section__testimonials__item">
              <p class="section__testimonials__item__testimonial equal-height-item"> We've made money from our users that we never thought was possible.  NeptuneAds Push has enabled us to bring in additional revenue in a new way that we've never seen before... certainly these guys are involved in the latest cutting edge technology right now.</p>
              <div class="section__testimonials__item__author">
                <div style="display: none;" class="section__testimonials__item__author__left"><img class="section__testimonials__item__author__left__avatar" src=""></div>
                <div class="section__testimonials__item__author__right"><span class="section__testimonials__item__author__right__name">Nicholas L.</span><span class="section__testimonials__item__author__right__info">Media Buyer</span></div>
              </div>
            </div>
          </div>
          <div class="col-md-6">
            <div class="section__testimonials__item">
              <p class="section__testimonials__item__testimonial equal-height-item"> This is seriously untapped new traffic source that will be 2017's biggest hit with media buyers! Not only am I am to bring in the volume I need but I can target the exact audience I know converts.</p>
              <div class="section__testimonials__item__author">
                <div style="display: none;" class="section__testimonials__item__author__left"><img class="section__testimonials__item__author__left__avatar" src=""></div>
                <div class="section__testimonials__item__author__right"><span class="section__testimonials__item__author__right__name">Joshua M.</span><span class="section__testimonials__item__author__right__info">Media Buyer</span></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="section section__footer" id="footer">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="section__heading section__heading--no-margin">
              <h1 class="section__heading__title">Get In Touch</h1><span class="section__heading__seperator"></span>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
          <h3>Contact Us</h3>
          <div style="margin: 15px 0; padding: 10px; display: flex; justify-content: center; align-content: center">
            <p  style="font-size: 18px; margin: 0 10px;"><i style="padding: 2px" class="fas fa-phone"></i><a href="tel:+1 754-248-2864">+1 754-248-2864</a></p>
            <p  style="font-size: 18px; margin: 0 10px;"><i style="padding: 2px" class="fas fa-envelope"></i>
              <a href="/cdn-cgi/l/email-protection#157c7b737a557b706561607b706560667d3b767a78"><span class="__cf_email__" data-cfemail="ee87808881ae808b9e9a9b808b9e9b9d86c08d8183">[email&#160;protected]</span></a>
            </p>
            <p style="font-size: 18px; margin: 0 10px;"><i style="padding: 2px" class="fas fa-map-pin"></i>1200 Brickell Ave Office 621, Miami, FL 33131</p>
          </div>
          <img class="section__footer__logo" src="https://neptuneads.com/img/neptune.png?v=1">
          <span class="section__footer__copyright">&copy; Copyright NeptunePush LLC 2017 - Present. All rights reserved.</span></div>
        </div>
      </div>
    </section>
    <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script type="text/javascript" src="js/_bower.js"></script>
    <script type="text/javascript" src="js/scripts.js?v=1.04"></script>
	<script>

	(function($){
		/**
		 * Copyright 2012, Digital Fusion
		 * Licensed under the MIT license.
		 * http://teamdf.com/jquery-plugins/license/
		 *
		 * @author Sam Sehnert
		 * @desc A small plugin that checks whether elements are within
		 *		 the user visible viewport of a web browser.
		 *		 only accounts for vertical position, not horizontal.
		 */
		$.fn.visible = function(partial){

			var $t				= $(this),
				$w				= $(window),
				viewTop			= $w.scrollTop(),
				viewBottom		= viewTop + $w.height(),
				_top			= $t.offset().top,
				_bottom			= _top + $t.height(),
				compareTop		= partial === true ? _bottom : _top,
				compareBottom	= partial === true ? _top : _bottom;

			return ((compareBottom <= viewBottom) && (compareTop >= viewTop));
		};

	})(jQuery);

	var current_impressions = 0;
	var impressions = 0;
	var impressions_str = "";
	var animated = false;
	function animateNumbers() {
		if (animated) {
			return;
		}
		animated = true;
		impressions_str = "";
		var i = 0;
		while ($('#number_' + i).length > 0) {
			impressions_str += $('#number_' + i).html();
			i++;
		}

		current_impressions = 0;
		impressions = parseInt(impressions_str);
		console.log(impressions_str);
		doAnimate(1111111, 1);
	}

	function pad(n, width, z) {
		z = z || '0';
		n = n + '';
		return n.length >= width ? n : new Array(width - n.length + 1).join(z) + n;
	}

	function doAnimate(step, timeout) {
		if (current_impressions < impressions) {
			current_impressions += step;
			if (current_impressions > impressions) {
				current_impressions = impressions;
			}

			var number_array = current_impressions.toString();
			number_array = pad(number_array, impressions_str.length, "0");
			number_array = number_array.split("");
			for(var i = 0, length = number_array.length; i < length; i++) {
				$('#number_' + i).html(number_array[i]);
			}

			setTimeout(doAnimate.bind(this, step, timeout), timeout);
		}
	}

	$(window).on("scroll", function () {
		if ($('#number_0').visible(true) && !animated) {
			animateNumbers();
		}
	});
	</script>
	</body>
</html>
