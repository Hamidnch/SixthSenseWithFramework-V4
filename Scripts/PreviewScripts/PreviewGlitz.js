﻿//----------------------------------------------------------
// Copyright (C) Microsoft Corporation. All rights reserved.
//----------------------------------------------------------
// PreviewGlitz.js
Type.registerNamespace("Sys.Preview.UI.Effects");Sys.Preview.UI.Effects.Glitz=function(){throw Error.invalidOperation()};Sys.Preview.UI.Effects.Glitz.getElementOpacity=function(b){var a=false,c;if(b.filters){var e=b.filters;if(e.length!==0){var d=e["DXImageTransform.Microsoft.Alpha"];if(d){c=d.opacity/100;a=true}}}else{var f=document.defaultView.getComputedStyle;c=f(b,null).getPropertyValue("opacity");a=true}if(a===false)return 1;return parseFloat(c)};Sys.Preview.UI.Effects.Glitz.interpolate=function(a,c,b){return a+(c-a)*(b/100)};Sys.Preview.UI.Effects.Glitz.setElementOpacity=function(a,b){if(a.filters){var e=a.filters,c=true;if(e.length!==0){var d=e["DXImageTransform.Microsoft.Alpha"];if(d){c=false;d.opacity=b*100}}if(c)a.style.filter="progid:DXImageTransform.Microsoft.Alpha(opacity="+b*100+")"}else a.style.opacity=b};Sys.Preview.UI.Effects.OpacityBehavior=function(a){Sys.Preview.UI.Effects.OpacityBehavior.initializeBase(this,[a])};Sys.Preview.UI.Effects.OpacityBehavior.prototype={_value:1,get_value:function(){var a=this.get_element();if(!a)return this._value;return Sys.Preview.UI.Effects.Glitz.getElementOpacity(a)},set_value:function(b){var a=this.get_element();if(!a){this._value=b;return}Sys.Preview.UI.Effects.Glitz.setElementOpacity(a,b)},initialize:function(){Sys.Preview.UI.Effects.OpacityBehavior.callBaseMethod(this,"initialize");if(this._value!==1)this.set_value(this._value)}};Sys.Preview.UI.Effects.OpacityBehavior.descriptor={properties:[{name:"value",type:Number}]};Sys.Preview.UI.Effects.OpacityBehavior.registerClass("Sys.Preview.UI.Effects.OpacityBehavior",Sys.UI.Behavior);Sys.Preview.UI.Effects.LayoutBehavior=function(a){Sys.Preview.UI.Effects.LayoutBehavior.initializeBase(this,[a])};Sys.Preview.UI.Effects.LayoutBehavior.prototype={_left:null,_top:null,_width:null,_height:null,get_height:function(){return this._height},set_height:function(b){this._height=b;var a=this.get_element();if(a)a.style.height=this._height},get_left:function(){return this._left},set_left:function(b){this._left=b;var a=this.get_element();if(a)a.style.left=this._left},get_top:function(){return this._top},set_top:function(b){this._top=b;var a=this.get_element();if(a)a.style.top=this._top},get_width:function(){return this._width},set_width:function(b){this._width=b;var a=this.get_element();if(a)a.style.width=this._width},initialize:function(){Sys.Preview.UI.Effects.LayoutBehavior.callBaseMethod(this,"initialize");if(this._height)this.set_height(this._height);if(this._left)this.set_left(this._left);if(this._top)this.set_top(this._top);if(this._width)this.set_width(this._width)}};Sys.Preview.UI.Effects.LayoutBehavior.descriptor={properties:[{name:"height",type:String},{name:"left",type:String},{name:"top",type:String},{name:"width",type:String}]};Sys.Preview.UI.Effects.LayoutBehavior.registerClass("Sys.Preview.UI.Effects.LayoutBehavior",Sys.UI.Behavior);Sys.Preview.UI.Effects.Animation=function(){Sys.Preview.UI.Effects.Animation.initializeBase(this)};Sys.Preview.UI.Effects.Animation.prototype={_duration:1,_fps:25,_target:null,_tickHandler:null,_timer:null,_percentComplete:0,_percentDelta:null,_parentAnimation:null,get_duration:function(){return this._duration},set_duration:function(a){this._duration=a},get_fps:function(){return this._fps},set_fps:function(a){this._fps=a},get_isActive:function(){return this._timer!==null},get_isPlaying:function(){return this._timer!==null&&this._timer.get_enabled()},get_percentComplete:function(){return this._percentComplete},get_target:function(){return this._target},set_target:function(a){this._target=a},add_ended:function(a){this.get_events().addHandler("ended",a)},remove_ended:function(a){this.get_events().removeHandler("ended",a)},add_started:function(a){this.get_events().addHandler("started",a)},remove_started:function(a){this.get_events().removeHandler("started",a)},dispose:function(){if(this._timer){this._timer.dispose();this._timer=null}this._tickHandler=null;this._target=null;Sys.Preview.UI.Effects.Animation.callBaseMethod(this,"dispose")},getAnimatedValue:function(){throw Error.notImplemented()},onEnd:function(){},onStart:function(){},onStep:function(a){this.setValue(this.getAnimatedValue(a))},pause:function(){if(!this._parentAnimation)if(this._timer){this._timer.set_enabled(false);this.raisePropertyChanged("isPlaying")}},play:function(){if(!this._parentAnimation){var a=true;if(!this._timer){a=false;if(!this._tickHandler)this._tickHandler=Function.createDelegate(this,this._onTimerTick);this._timer=new Sys.Preview.Timer;this._timer.set_interval(1000/this._fps);this._timer.add_tick(this._tickHandler);this._percentDelta=100/(this._duration*this._fps);this.onStart();this._updatePercentComplete(0,true)}this._timer.set_enabled(true);this.raisePropertyChanged("isPlaying");if(!a)this.raisePropertyChanged("isActive")}},setOwner:function(a){this._parentAnimation=a},setValue:function(){throw Error.notImplemented()},stop:function(){if(!this._parentAnimation){var a=this._timer;this._timer=null;if(a){a.dispose();this._updatePercentComplete(100);this.onEnd();this.raisePropertyChanged("isPlaying");this.raisePropertyChanged("isActive")}}},_onTimerTick:function(){this._updatePercentComplete(this._percentComplete+this._percentDelta,true)},_updatePercentComplete:function(a,b){if(a>100)a=100;this._percentComplete=a;this.raisePropertyChanged("percentComplete");if(b)this.onStep(a);if(a===100)this.stop()}};Sys.Preview.UI.Effects.Animation.descriptor={properties:[{name:"duration",type:Number},{name:"fps",type:Number},{name:"isActive",type:Boolean,readOnly:true},{name:"isPlaying",type:Boolean,readOnly:true},{name:"percentComplete",type:Number,readOnly:true},{name:"target",type:Object}],methods:[{name:"play"},{name:"pause"},{name:"stop"}]};Sys.Preview.UI.Effects.Animation.registerClass("Sys.Preview.UI.Effects.Animation",Sys.Component);Sys.Preview.UI.Effects.PropertyAnimation=function(){Sys.Preview.UI.Effects.PropertyAnimation.initializeBase(this)};Sys.Preview.UI.Effects.PropertyAnimation.prototype={_property:null,_propertyKey:null,get_property:function(){return this._property},set_property:function(a){this._property=a},get_propertyKey:function(){return this._propertyKey},set_propertyKey:function(a){this._propertyKey=a},add_ended:function(a){this.get_events().addHandler("ended",a)},remove_ended:function(a){this.get_events().removeHandler("ended",a)},add_started:function(a){this.get_events().addHandler("started",a)},remove_started:function(a){this.get_events().removeHandler("started",a)},setValue:function(a){Sys.Preview.TypeDescriptor.setProperty(this.get_target(),this._property,a,this._propertyKey)}};Sys.Preview.UI.Effects.PropertyAnimation.descriptor={properties:[{name:"property",type:String},{name:"propertyKey"}]};Sys.Preview.UI.Effects.PropertyAnimation.registerClass("Sys.Preview.UI.Effects.PropertyAnimation",Sys.Preview.UI.Effects.Animation);Sys.Preview.UI.Effects.InterpolatedAnimation=function(){Sys.Preview.UI.Effects.InterpolatedAnimation.initializeBase(this)};Sys.Preview.UI.Effects.InterpolatedAnimation.prototype={_startValue:null,_endValue:null,get_endValue:function(){return this._endValue},set_endValue:function(a){this._endValue=a},get_startValue:function(){return this._startValue},set_startValue:function(a){this._startValue=a}};Sys.Preview.UI.Effects.InterpolatedAnimation.descriptor={properties:[{name:"endValue",type:Object},{name:"startValue",type:Object}]};Sys.Preview.UI.Effects.InterpolatedAnimation.registerClass("Sys.Preview.UI.Effects.InterpolatedAnimation",Sys.Preview.UI.Effects.PropertyAnimation);Sys.Preview.UI.Effects.DiscreteAnimation=function(){Sys.Preview.UI.Effects.DiscreteAnimation.initializeBase(this);this._values=[]};Sys.Preview.UI.Effects.DiscreteAnimation.prototype={get_values:function(){return this._values},set_values:function(a){this._values=a},getAnimatedValue:function(a){var b=Math.round(a/100*(this._values.length-1));return this._values[b]}};Sys.Preview.UI.Effects.DiscreteAnimation.descriptor={properties:[{name:"values",type:Array}]};Sys.Preview.UI.Effects.DiscreteAnimation.registerClass("Sys.Preview.UI.Effects.DiscreteAnimation",Sys.Preview.UI.Effects.PropertyAnimation);Sys.Preview.UI.Effects.NumberAnimation=function(){Sys.Preview.UI.Effects.NumberAnimation.initializeBase(this)};Sys.Preview.UI.Effects.NumberAnimation.prototype={_integralValues:false,get_integralValues:function(){return this._integralValues},set_integralValues:function(a){this._integralValues=a},getAnimatedValue:function(b){var a=Sys.Preview.UI.Effects.Glitz.interpolate(this.get_startValue(),this.get_endValue(),b);if(this._integralValues)a=Math.round(a);return a}};Sys.Preview.UI.Effects.NumberAnimation.descriptor={properties:[{name:"startValue",type:Number},{name:"endValue",type:Number},{name:"integralValues",type:Boolean}]};Sys.Preview.UI.Effects.NumberAnimation.registerClass("Sys.Preview.UI.Effects.NumberAnimation",Sys.Preview.UI.Effects.InterpolatedAnimation);Sys.Preview.UI.Effects.LengthAnimation=function(){Sys.Preview.UI.Effects.LengthAnimation.initializeBase(this)};Sys.Preview.UI.Effects.LengthAnimation.prototype={_unit:"px",get_unit:function(){return this._unit},set_unit:function(a){this._unit=a},getAnimatedValue:function(a){var b=Sys.Preview.UI.Effects.Glitz.interpolate(this.get_startValue(),this.get_endValue(),a);return Math.round(b)+this._unit}};Sys.Preview.UI.Effects.LengthAnimation.descriptor={properties:[{name:"startValue",type:Number},{name:"endValue",type:Number},{name:"unit",type:String}]};Sys.Preview.UI.Effects.LengthAnimation.registerClass("Sys.Preview.UI.Effects.LengthAnimation",Sys.Preview.UI.Effects.InterpolatedAnimation);Sys.Preview.UI.Effects.CompositeAnimation=function(){Sys.Preview.UI.Effects.CompositeAnimation.initializeBase(this);this._animations=Sys.Component.createCollection(this)};Sys.Preview.UI.Effects.CompositeAnimation.prototype={get_animations:function(){return this._animations},getAnimatedValue:function(){throw Error.invalidOperation()},dispose:function(){this._animations.dispose();this._animations=null;Sys.Preview.UI.Effects.CompositeAnimation.callBaseMethod(this,"dispose")},onEnd:function(){for(var a=0;a<this._animations.length;a++)this._animations[a].onEnd()},onStart:function(){for(var a=0;a<this._animations.length;a++)this._animations[a].onStart()},onStep:function(b){for(var a=0;a<this._animations.length;a++)this._animations[a].onStep(b)}};Sys.Preview.UI.Effects.CompositeAnimation.descriptor={properties:[{name:"animations",type:Array,readOnly:true}]};Sys.Preview.UI.Effects.CompositeAnimation.registerClass("Sys.Preview.UI.Effects.CompositeAnimation",Sys.Preview.UI.Effects.Animation);Sys.Preview.UI.Effects.FadeEffect=function(){throw Error.invalidOperation()};Sys.Preview.UI.Effects.FadeEffect.prototype={FadeIn:0,FadeOut:1};Sys.Preview.UI.Effects.FadeEffect.registerEnum("Sys.Preview.UI.Effects.FadeEffect");Sys.Preview.UI.Effects.FadeAnimation=function(){Sys.Preview.UI.Effects.FadeAnimation.initializeBase(this)};Sys.Preview.UI.Effects.FadeAnimation.prototype={_effect:Sys.Preview.UI.Effects.FadeEffect.FadeIn,get_effect:function(){return this._effect},set_effect:function(a){this._effect=a},getAnimatedValue:function(c){var a=0,b=1;if(this._effect===Sys.Preview.UI.Effects.FadeEffect.FadeOut){a=1;b=0}return Sys.Preview.UI.Effects.Glitz.interpolate(a,b,c)},onStart:function(){var a=0;if(this._effect===Sys.Preview.UI.Effects.FadeEffect.FadeOut)a=1;this.setValue(a)},onEnd:function(){var a=1;if(this._effect===Sys.Preview.UI.Effects.FadeEffect.FadeOut)a=0;this.setValue(a)},setValue:function(a){Sys.Preview.UI.Effects.Glitz.setElementOpacity(this.get_target().get_element(),a)}};Sys.Preview.UI.Effects.FadeAnimation.descriptor={properties:[{name:"effect",type:Sys.Preview.UI.Effects.FadeEffect}]};Sys.Preview.UI.Effects.FadeAnimation.registerClass("Sys.Preview.UI.Effects.FadeAnimation",Sys.Preview.UI.Effects.Animation);
if(typeof(Sys)!=='undefined')Sys.Application.notifyScriptLoaded();
