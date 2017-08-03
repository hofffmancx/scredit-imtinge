// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require bootstrap/collapse
//= require ckeditor/init
//= require_tree .




  // 图片自适应大小支持代码块
  // 在product/show.html.erb的页面中，对img图片用这一格式进行校正
  // 让图片在大于div宽度时自动缩小不而溢出，确保版面的公正和美观
  function ReImgSize(){
    for (j=0;j<document.images.length;j++)
    {
      document.images[j].width=(document.images[j].width>420)?"420":document.images[j].width;
    }
  }

function browserRedirect() {
    var sUserAgent = navigator.userAgent.toLowerCase();
    var bIsIpad = sUserAgent.match(/ipad/i) == "ipad";
    var bIsIphoneOs = sUserAgent.match(/iphone os/i) == "iphone os";
    var bIsMidp = sUserAgent.match(/midp/i) == "midp";
    var bIsUc7 = sUserAgent.match(/rv:1.2.3.4/i) == "rv:1.2.3.4";
    var bIsUc = sUserAgent.match(/ucweb/i) == "ucweb";
    var bIsAndroid = sUserAgent.match(/android/i) == "android";
    var bIsCE = sUserAgent.match(/windows ce/i) == "windows ce";
    var bIsWM = sUserAgent.match(/windows mobile/i) == "windows mobile";

    if (bIsIpad || bIsIphoneOs || bIsMidp || bIsUc7 || bIsUc || bIsAndroid || bIsCE || bIsWM) {
        //phone;
        //alert("phonetest");
        //$(".hero hgroup .h1").css("font-size","2em");
        //$(".hero hgroup .h3").css("font-size","1.5em");
        $(".about-title-e").css("font-size","1.5em");
        $(".fade-carousel").css("height","360px");
        $(".fade-carousel .carousel-inner .item ").css("height","360px");
        $(".fade-carousel .slides .slide-1").css("height","360px");
        $(".fade-carousel .slides .slide-2").css("height","360px");
        $(".fade-carousel .slides .slide-3").css("height","360px");

    } else {
        //pc;
        //alert("pctest");
        $(".navbar-rwd").removeClass("navbar-rwd");
        $(".fade-carousel").css("height","616px");
        $(".fade-carousel .carousel-inner .item ").css("height","616px");
        $(".slide-1").css("height","616px");
        $(".slide-2").css("height","616px");
        $(".slide-3").css("height","616px");

    }
}
$(document).ready(function(){
  browserRedirect();
});
