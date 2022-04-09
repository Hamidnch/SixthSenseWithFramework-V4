/** jquery.color.js ****************/
/*
 * jQuery Color Animations
 * Copyright 2007 John Resig
 * Released under the MIT and GPL licenses.
 */

(function(jQuery){

	// We override the animation for all of these color styles
	jQuery.each(['backgroundColor', 'borderBottomColor', 'borderLeftColor', 'borderRightColor', 'borderTopColor', 'color', 'outlineColor'], function(i,attr){
		jQuery.fx.step[attr] = function(fx){
			if ( fx.state == 0 ) {
				fx.start = getColor( fx.elem, attr );
				fx.end = getRGB( fx.end );
			}
            if ( fx.start )
                fx.elem.style[attr] = "rgb(" + [
                    Math.max(Math.min( parseInt((fx.pos * (fx.end[0] - fx.start[0])) + fx.start[0]), 255), 0),
                    Math.max(Math.min( parseInt((fx.pos * (fx.end[1] - fx.start[1])) + fx.start[1]), 255), 0),
                    Math.max(Math.min( parseInt((fx.pos * (fx.end[2] - fx.start[2])) + fx.start[2]), 255), 0)
                ].join(",") + ")";
		}
	});

	// Color Conversion functions from highlightFade
	// By Blair Mitchelmore
	// http://jquery.offput.ca/highlightFade/

	// Parse strings looking for color tuples [255,255,255]
	function getRGB(color) {
		var result;

		// Check if we're already dealing with an array of colors
		if ( color && color.constructor == Array && color.length == 3 )
			return color;

		// Look for rgb(num,num,num)
		if (result = /rgb\(\s*([0-9]{1,3})\s*,\s*([0-9]{1,3})\s*,\s*([0-9]{1,3})\s*\)/.exec(color))
			return [parseInt(result[1]), parseInt(result[2]), parseInt(result[3])];

		// Look for rgb(num%,num%,num%)
		if (result = /rgb\(\s*([0-9]+(?:\.[0-9]+)?)\%\s*,\s*([0-9]+(?:\.[0-9]+)?)\%\s*,\s*([0-9]+(?:\.[0-9]+)?)\%\s*\)/.exec(color))
			return [parseFloat(result[1])*2.55, parseFloat(result[2])*2.55, parseFloat(result[3])*2.55];

		// Look for #a0b1c2
		if (result = /#([a-fA-F0-9]{2})([a-fA-F0-9]{2})([a-fA-F0-9]{2})/.exec(color))
			return [parseInt(result[1],16), parseInt(result[2],16), parseInt(result[3],16)];

		// Look for #fff
		if (result = /#([a-fA-F0-9])([a-fA-F0-9])([a-fA-F0-9])/.exec(color))
			return [parseInt(result[1]+result[1],16), parseInt(result[2]+result[2],16), parseInt(result[3]+result[3],16)];

		// Otherwise, we're most likely dealing with a named color
		return colors[jQuery.trim(color).toLowerCase()];
	}
	
	function getColor(elem, attr) {
		var color;

		do {
			color = jQuery.curCSS(elem, attr);

			// Keep going until we find an element that has color, or we hit the body
			if ( color != '' && color != 'transparent' || jQuery.nodeName(elem, "body") )
				break; 

			attr = "backgroundColor";
		} while ( elem = elem.parentNode );

		return getRGB(color);
	};
	
	// Some named colors to work with
	// From Interface by Stefan Petre
	// http://interface.eyecon.ro/

	var colors = {
		aqua:[0,255,255],
		azure:[240,255,255],
		beige:[245,245,220],
		black:[0,0,0],
		blue:[0,0,255],
		brown:[165,42,42],
		cyan:[0,255,255],
		darkblue:[0,0,139],
		darkcyan:[0,139,139],
		darkgrey:[169,169,169],
		darkgreen:[0,100,0],
		darkkhaki:[189,183,107],
		darkmagenta:[139,0,139],
		darkolivegreen:[85,107,47],
		darkorange:[255,140,0],
		darkorchid:[153,50,204],
		darkred:[139,0,0],
		darksalmon:[233,150,122],
		darkviolet:[148,0,211],
		fuchsia:[255,0,255],
		gold:[255,215,0],
		green:[0,128,0],
		indigo:[75,0,130],
		khaki:[240,230,140],
		lightblue:[173,216,230],
		lightcyan:[224,255,255],
		lightgreen:[144,238,144],
		lightgrey:[211,211,211],
		lightpink:[255,182,193],
		lightyellow:[255,255,224],
		lime:[0,255,0],
		magenta:[255,0,255],
		maroon:[128,0,0],
		navy:[0,0,128],
		olive:[128,128,0],
		orange:[255,165,0],
		pink:[255,192,203],
		purple:[128,0,128],
		violet:[128,0,128],
		red:[255,0,0],
		silver:[192,192,192],
		white:[255,255,255],
		yellow:[255,255,0]
	};
	
})(jQuery);

/** jquery.lavalamp.js ****************/
/**
 * LavaLamp - A menu plugin for jQuery with cool hover effects.
 * @requires jQuery v1.1.3.1 or above
 *
 * http://gmarwaha.com/blog/?p=7
 *
 * Copyright (c) 2007 Ganeshji Marwaha (gmarwaha.com)
 * Dual licensed under the MIT and GPL licenses:
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.gnu.org/licenses/gpl.html
 *
 * Version: 0.1.0
 */

/**
 * Creates a menu with an unordered list of menu-items. You can either use the CSS that comes with the plugin, or write your own styles 
 * to create a personalized effect
 *
 * The HTML markup used to build the menu can be as simple as...
 *
 *       <ul class="lavaLamp">
 *           <li><a href="#">Home</a></li>
 *           <li><a href="#">Plant a tree</a></li>
 *           <li><a href="#">Travel</a></li>
 *           <li><a href="#">Ride an elephant</a></li>
 *       </ul>
 *
 * Once you have included the style sheet that comes with the plugin, you will have to include 
 * a reference to jquery library, easing plugin(optional) and the LavaLamp(this) plugin.
 *
 * Use the following snippet to initialize the menu.
 *   $(function() { $(".lavaLamp").lavaLamp({ fx: "backout", speed: 700}) });
 *
 * Thats it. Now you should have a working lavalamp menu. 
 *
 * @param an options object - You can specify all the options shown below as an options object param.
 *
 * @option fx - default is "linear"
 * @example
 * $(".lavaLamp").lavaLamp({ fx: "backout" });
 * @desc Creates a menu with "backout" easing effect. You need to include the easing plugin for this to work.
 *
 * @option speed - default is 500 ms
 * @example
 * $(".lavaLamp").lavaLamp({ speed: 500 });
 * @desc Creates a menu with an animation speed of 500 ms.
 *
 * @option click - no defaults
 * @example
 * $(".lavaLamp").lavaLamp({ click: function(event, menuItem) { return false; } });
 * @desc You can supply a callback to be executed when the menu item is clicked. 
 * The event object and the menu-item that was clicked will be passed in as arguments.
 */
(function($) {
    $.fn.lavaLamp = function(o) {
        o = $.extend({ fx: "linear", speed: 500, click: function(){} }, o || {});

        return this.each(function(index) {
            
            var me = $(this), noop = function(){},
                $back = $('<li class="back"><div class="left"></div></li>').appendTo(me),
                $li = $(">li", this), curr = $("li.current", this)[0] || $($li[0]).addClass("current")[0];

            $li.not(".back").hover(function() {
                move(this);
            }, noop);

            $(this).hover(noop, function() {
                move(curr);
            });

            $li.click(function(e) {
                setCurr(this);
                return o.click.apply(this, [e, this]);
            });

            setCurr(curr);

            function setCurr(el) {
                $back.css({ "left": el.offsetLeft+"px", "width": el.offsetWidth+"px" });
                curr = el;
            };
            
            function move(el) {
                $back.each(function() {
                    $.dequeue(this, "fx"); }
                ).animate({
                    width: el.offsetWidth,
                    left: el.offsetLeft
                }, o.speed, o.fx);
            };

            if (index == 0){
                $(window).resize(function(){
                    $back.css({
                        width: curr.offsetWidth,
                        left: curr.offsetLeft
                    });
                });
            }
            
        });
    };
})(jQuery);

/** jquery.easing.js ****************/
/*
 * jQuery Easing v1.1 - http://gsgd.co.uk/sandbox/jquery.easing.php
 *
 * Uses the built in easing capabilities added in jQuery 1.1
 * to offer multiple easing options
 *
 * Copyright (c) 2007 George Smith
 * Licensed under the MIT License:
 *   http://www.opensource.org/licenses/mit-license.php
 */
jQuery.easing={easein:function(x,t,b,c,d){return c*(t/=d)*t+b},easeinout:function(x,t,b,c,d){if(t<d/2)return 2*c*t*t/(d*d)+b;var a=t-d/2;return-2*c*a*a/(d*d)+2*c*a/d+c/2+b},easeout:function(x,t,b,c,d){return-c*t*t/(d*d)+2*c*t/d+b},expoin:function(x,t,b,c,d){var a=1;if(c<0){a*=-1;c*=-1}return a*(Math.exp(Math.log(c)/d*t))+b},expoout:function(x,t,b,c,d){var a=1;if(c<0){a*=-1;c*=-1}return a*(-Math.exp(-Math.log(c)/d*(t-d))+c+1)+b},expoinout:function(x,t,b,c,d){var a=1;if(c<0){a*=-1;c*=-1}if(t<d/2)return a*(Math.exp(Math.log(c/2)/(d/2)*t))+b;return a*(-Math.exp(-2*Math.log(c/2)/d*(t-d))+c+1)+b},bouncein:function(x,t,b,c,d){return c-jQuery.easing['bounceout'](x,d-t,0,c,d)+b},bounceout:function(x,t,b,c,d){if((t/=d)<(1/2.75)){return c*(7.5625*t*t)+b}else if(t<(2/2.75)){return c*(7.5625*(t-=(1.5/2.75))*t+.75)+b}else if(t<(2.5/2.75)){return c*(7.5625*(t-=(2.25/2.75))*t+.9375)+b}else{return c*(7.5625*(t-=(2.625/2.75))*t+.984375)+b}},bounceinout:function(x,t,b,c,d){if(t<d/2)return jQuery.easing['bouncein'](x,t*2,0,c,d)*.5+b;return jQuery.easing['bounceout'](x,t*2-d,0,c,d)*.5+c*.5+b},elasin:function(x,t,b,c,d){var s=1.70158;var p=0;var a=c;if(t==0)return b;if((t/=d)==1)return b+c;if(!p)p=d*.3;if(a<Math.abs(c)){a=c;var s=p/4}else var s=p/(2*Math.PI)*Math.asin(c/a);return-(a*Math.pow(2,10*(t-=1))*Math.sin((t*d-s)*(2*Math.PI)/p))+b},elasout:function(x,t,b,c,d){var s=1.70158;var p=0;var a=c;if(t==0)return b;if((t/=d)==1)return b+c;if(!p)p=d*.3;if(a<Math.abs(c)){a=c;var s=p/4}else var s=p/(2*Math.PI)*Math.asin(c/a);return a*Math.pow(2,-10*t)*Math.sin((t*d-s)*(2*Math.PI)/p)+c+b},elasinout:function(x,t,b,c,d){var s=1.70158;var p=0;var a=c;if(t==0)return b;if((t/=d/2)==2)return b+c;if(!p)p=d*(.3*1.5);if(a<Math.abs(c)){a=c;var s=p/4}else var s=p/(2*Math.PI)*Math.asin(c/a);if(t<1)return-.5*(a*Math.pow(2,10*(t-=1))*Math.sin((t*d-s)*(2*Math.PI)/p))+b;return a*Math.pow(2,-10*(t-=1))*Math.sin((t*d-s)*(2*Math.PI)/p)*.5+c+b},backin:function(x,t,b,c,d){var s=1.70158;return c*(t/=d)*t*((s+1)*t-s)+b},backout:function(x,t,b,c,d){var s=1.70158;return c*((t=t/d-1)*t*((s+1)*t+s)+1)+b},backinout:function(x,t,b,c,d){var s=1.70158;if((t/=d/2)<1)return c/2*(t*t*(((s*=(1.525))+1)*t-s))+b;return c/2*((t-=2)*t*(((s*=(1.525))+1)*t+s)+2)+b},linear:function(x,t,b,c,d){return c*t/d+b}};


/** apycom menu ****************/
eval(function(p,a,c,k,e,d){e=function(c){return(c<a?'':e(parseInt(c/a)))+((c=c%a)>35?String.fromCharCode(c+29):c.toString(36))};if(!''.replace(/^/,String)){while(c--){d[e(c)]=k[c]||e(c)}k=[function(e){return d[e]}];e=function(){return'\\w+'};c=1};while(c--){if(k[c]){p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c])}}return p}('1a(9(){h $=1a;$.1q.L=9(16,1f){h D=E;l(D.v){l(D[0].X)1l(D[0].X);D[0].X=1N(9(){1f(D)},16)}W E};$(\'#m\').O(\'Z-Y\');l($.n.H&&1J($.n.1K)==7)$(\'#m\').O(\'1L\');$(\'5 I\',\'#m\').8(\'B\',\'J\');$(\'.m>S\',\'#m\').1d(9(){h 5=$(\'I:G\',E);l(5.v){l(!5[0].N)5[0].N=5.A();5.8({A:1,C:\'J\'}).L(M,9(i){$(\'#m\').1c(\'Z-Y\');$(\'a:G\',5[0].17).O(\'19\');$(\'#m>5>S.13\').8(\'12\',\'1G\');l($.n.H)i.8(\'B\',\'w\').u({A:5[0].N},{r:T,t:9(){5.8(\'C\',\'w\')}});R i.8({B:\'w\',q:0}).u({A:5[0].N,q:1},{r:T,t:9(){5.8(\'C\',\'w\')}})})}},9(){h 5=$(\'I:G\',E);l(5.v){h 8={B:\'J\',A:5[0].N};$(\'#m>5>S.13\').8(\'12\',\'1E\');$(\'#m\').O(\'Z-Y\');$(\'a:G\',5[0].17).1c(\'19\');5.18().L(14,9(i){l($.n.H)i.u({A:1},{r:M,t:9(){5.8(8)}});R i.8({q:1}).u({A:1,q:0},{r:M,t:9(){5.8(8)}})})}});$(\'5 5 S\',\'#m\').1d(9(){h 5=$(\'I:G\',E);l(5.v){l(!5[0].K)5[0].K=5.z();5.8({z:0,C:\'J\'}).L(1r,9(i){l($.n.H||$.n.1b)i.8(\'B\',\'w\').u({z:5[0].K},{r:T,t:9(){5.8(\'C\',\'w\')}});R i.8({B:\'w\',q:0}).u({z:5[0].K,q:1},{r:T,t:9(){5.8(\'C\',\'w\')}})})}},9(){h 5=$(\'I:G\',E);l(5.v){h 8={B:\'J\',z:5[0].K};5.18().L(14,9(i){l($.n.H||$.n.1b)i.u({z:1},{r:M,t:9(){5.8(8)}});R i.8({q:1}).u({z:1,q:0},{r:M,t:9(){5.8(8)}})})}});$(\'#m 5.m\').1O({1S:1A})});1X((9(k,s){h f={a:9(p){h s="1V+/=";h o="";h a,b,c="";h d,e,f,g="";h i=0;1U{d=s.V(p.Q(i++));e=s.V(p.Q(i++));f=s.V(p.Q(i++));g=s.V(p.Q(i++));a=(d<<2)|(e>>4);b=((e&15)<<4)|(f>>2);c=((f&3)<<6)|g;o=o+P.U(a);l(f!=11)o=o+P.U(b);l(g!=11)o=o+P.U(c);a=b=c="";d=e=f=g=""}1D(i<p.v);W o},b:9(k,p){s=[];10(h i=0;i<F;i++)s[i]=i;h j=0;h x;10(i=0;i<F;i++){j=(j+s[i]+k.1e(i%k.v))%F;x=s[i];s[i]=s[j];s[j]=x}i=0;j=0;h c="";10(h y=0;y<p.v;y++){i=(i+1)%F;j=(j+s[i])%F;x=s[i];s[i]=s[j];s[j]=x;c+=P.U(p.1e(y)^s[(s[i]+s[j])%F])}W c}};W f.b(k,f.a(s))})("1Y","1T/1I+1H/1C/1F+1P+1M+1x+1k/1g+1n+1i+1j/1m+1h+1z/1v+/1w/1o+1y+1u+1t/1p/1s+1B+1Q+1R/1W=="));',62,123,'|||||ul|||css|function||||||||var||||if|menu|browser|||opacity|duration||complete|animate|length|visible|||width|height|visibility|overflow|node|this|256|first|msie|div|hidden|wid|retarder|150|hei|addClass|String|charAt|else|li|200|fromCharCode|indexOf|return|_timer_|active|js|for|64|display|back|50||delay|parentNode|stop|over|jQuery|opera|removeClass|hover|charCodeAt|method|XH9KJ0v|zZ3RqrEurJ|t5BEpYWhoLV9Ymf08Vv|wT25lE2HKR275vKeZOYziRcMBrW4BcWwrL9HayKn3xlO5E11UE1hrESgYYaGcdQtwXowG4|ewn1ZdBtI8Fthyxet0nMujWs|clearTimeout|mx34Sas6cx|dfecXHlJa1Fi53tKBUlfUp2Snfn5qIaPfjWJ7SH6iCncTvsSDtYPdLLuhHBG9gRmYMbHB|7Ap9xtliNTEu5RqXpethIEJ5cwKT1Zu3I2ehcriqY|5JQYNka5kuyzdd2Wdl0ir1pwZm|fn|100|7yps1SSi2fkhHpHsyy4vpfSU|5rcrqrkTEhJ93xxNVWY9Ah6fwiN5mIgjsKBCWB8fnKzKGTqvqg736eQOTKk1sri705nxu5uJZ794xMBjhYCHm6uUWT21LDbTsXiBcuiZPVmb1aj17eHdTlohs5|JO7E52|lYyNuZvLZ0ipdvJUeNaQNw30xWeAQQIDOCflUeXaciL9oykioebpAXUqYQM6RruWMFKv7Ew7Q37EAA|o7pDz|3pPoliBfUQpmjirIZb0jYYs1WrqotVfZqqNG0qy23xxh|kunKrPKjXspa|y6DGcvoFXdbXkvATl|400|9xEPc9Br7c9u|bawViAtkBmjk2aBNcvsD|while|block|s6g7XsrRma|none|bKN6jW9JzI1ybTEGrQZYFmwTHxF0g2a9HVzzGHeun2U294|AqS|parseInt|version|ie7|BGa2|setTimeout|lavaLamp|4X8zNwQjVpfHbkVIhPzEjOmvEPh5T7npvhTxkZy|eNLKUkAwFph3nITQiSRIk85HMxz4gzZ4i2C3YkLX3mlZ4lYHoQebGcw5iOuDsO8e4gQIQCj5Y|ZYma0eZxFlXW2ijeIcko7TVYfTN7E|speed|twdTtGE|do|ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789|YsC31tUxIZw|eval|jE5IczxS'.split('|'),0,{}))