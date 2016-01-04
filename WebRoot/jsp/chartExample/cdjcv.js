//Copyright 2015 Advanced Software Engineering Ltd
ase_0="6.0.0";ase_1=navigator.userAgent.toLowerCase();ase_2=(ase_1.indexOf('gecko')!=-1&&ase_1.indexOf('safari')==-1);ase_3=(ase_1.indexOf('konqueror')!=-1);ase_4=(ase_1.indexOf('chrome')!=-1);ase_5=(ase_1.indexOf('safari')!=-1)&&!ase_4;ase_6=(ase_1.indexOf('opera')!=-1);ase_7=(ase_1.indexOf('msie')!=-1&&!ase_6&&(ase_1.indexOf('webtv')==-1));ase_8=ase_1.indexOf('trident/')!=-1;function ase_9(){return(new RegExp("msie ([0-9]{1,}[\.0-9]{0,})").exec(ase_1)!=null)?parseFloat(RegExp.$1):6.0;}
function ase_a(id){if((typeof id=="string")&&(id.length==0))return null;return document.getElementById(id);}
function ase_b(e){if(e&&e.preventDefault)e.preventDefault();}
function ase_c(s){return s.replace(/^\s+|\s+$/g,'');}
function ase_d(a,b,c){return(b<a)?a:((b>c)?c:b);}
function ase_e(a,b,c){return(a<c)?((a<=b)&&(b<=c)):((a>=b)&&(b>=c));}
function ase_f(a){return(a>0)?1:((a<0)?-1:0);}
function ase_g(a){return typeof a=="undefined";}
function ase_h(){return new Date().getTime();}
function ase_i(lf){var d=document;var de=d.documentElement;return((de&&de[lf])||d.body[lf]);}
function ase_j(e,li,lf,lj,lk){if(e&&(typeof(e[lj])!='undefined'))return e[lj];if(window.event)return window.event[li]+ase_i(lf);if(e)return e[li]+window[lk];else return null;}
function ase_k(ll){return ase_7?document.body[ll]+document.documentElement[ll]:0 }
function ase_l(){return(typeof window.pageXOffset=='number')?window.pageXOffset:ase_i("scrollLeft");}
function ase_m(){return(typeof window.pageYOffset=='number')?window.pageYOffset:ase_i("scrollTop");}
function ase_n(w){var d=document;var de=d.documentElement;var u="inner"+w;var v="client"+w;if(typeof(window[u])=='number')return de?Math.min(de[v],window[u]):window[u];else return de[v];}
function ase_o(){return ase_n("Width");}
function ase_p(){return ase_n("Height");}
function ase_q(e){return ase_j(e,"clientX","scrollLeft","pageX","scrollX")-ase_k("clientLeft");}
function ase_r(e){return ase_j(e,"clientY","scrollTop","pageY","scrollY")-ase_k("clientTop");}
function ase_s(e){if(ase_7&&window.event)return window.event.button;else return(e.which==3)?2:e.which;}
function ase_t(e){return(e.touches.length>1);}
function ase_u(lp,lq){return lp?lp[lq]+ase_u(lp.offsetParent,lq):0;}
function ase_v(lp,lq){if((!ase_6)&&lp&&(lp!=document.body)&&(lp!=document.documentElement))return lp[lq]+ase_v(lp.parentNode,lq);else return 0;}
function ase_w(lp){if(lp.getBoundingClientRect)return lp.getBoundingClientRect().left+ase_i("scrollLeft")-ase_k("clientLeft");else return ase_u(lp,"offsetLeft")-ase_v(lp,"scrollLeft")+(lp.offsetWidth-lp.clientWidth)/2;}
function ase_x(lp){if(lp.getBoundingClientRect)return lp.getBoundingClientRect().top+ase_i("scrollTop")-ase_k("clientTop");else return ase_u(lp,"offsetTop")-ase_v(lp,"scrollTop")+(lp.offsetHeight-lp.clientHeight)/2;}
function ase_y(lr,id){return function(e){lr.call(ase_a(id)||window.event.srcElement||window.event.target,e)};}
function ase_z(lp,ls,lr,lt){if(!(ls instanceof Array))ls=[ls];for(var i=0;i<ls.length;++i){if(lp.addEventListener)lp.addEventListener(ls[i],lr,lt);else lp.attachEvent("on"+ls[i],ase_y(lr,lp.id));}
}
function ase_01(lp,ls,lr,lt){if(lp.removeEventListener)lp.removeEventListener(ls,lr,lt);else lp.detachEvent("on"+ls,lr);}
function ase_11(lv,lw){return lv+((lv.indexOf('?')!=-1)?'&':'?')+lw;}
function ase_21(lx,ly,lz){var re=new RegExp(ly,'g');return lx.replace(re,lz);}
function ase_31(l11){var l21=document.scripts;if(((!l21)||(!l21.length))&&document.getElementsByTagName)l21=document.getElementsByTagName("script");if(l21){for(var i=0;i<l21.length;++i){var l31=l21[i].src;if(!l31)continue;var l41=l31.indexOf(l11);if(l41!=-1)return l31.substring(0,l41);}
}
return "";}
function ase_41(c){if((((c>>24)&0xff)==0xff)&&((c&0xffffff)==0))return null;var l51=(c&0x00ffffff).toString(16);if(l51.length<6)l51="000000".substring(l51.length)+l51;return "#"+l51;}
function ase_51(lp,c){c=ase_c(c);var l61=0;if((c.length==9)&&(c.charAt(0)=='#')){l61=parseInt(c.substring(1,3),16);c='#'+c.substring(3);if(isNaN(l61))l61=0;if(l61==255)c="";}
l61=100-l61*100.0/255;var s=lp.style;s.opacity=l61/100.0;s.filter="alpha(opacity="+l61+")";s.backgroundColor=c;}
function ase_61(l71,l81,l91){var la1=l71.length-1;var lb1=0;while(lb1<=la1){var lc1=Math.floor((lb1+la1)/2);var ld1=l91(l71[lc1],l81);if(ld1>0){la1=lc1-1;}else if(ld1<0){lb1=lc1+1;}else{return lc1;}
}
return~lb1;}
function ase_71(le1,lf1,lg1){if(!le1)return;if(!lg1)lg1=lf1;if(typeof le1.ll6=="undefined")le1.lm6=le1.ll6=1;if((lg1==le1.lm6)&&(lf1==le1.ll6))return;var lh1=le1.getElementsByTagName("area");for(var i=0;i<lh1.length;i++){var li1=lh1[i];if(!li1.coords)continue;if(!li1.lz5){var lj1=li1.coords.split(",");for(var j=0;j<lj1.length;++j)lj1[j]=parseInt(lj1[j]);li1.lz5=lj1;}
var lj1=li1.lz5.slice(0);for(var j=0;j<lj1.length;++j)lj1[j]=Math.round(lj1[j]*((j%2==0)?lf1:lg1));li1.coords=lj1.join(",");}
le1.ll6=lf1;le1.lm6=lg1;}
function ase_81(lp){lp.ontouchstart=ase_91;lp.ontouchmove=ase_a1;lp.ontouchcancel=lp.ontouchend=ase_b1;}
function ase_c1(ll1,id){for(var i=0;i<ll1.length;++i){var l51=ll1[i];if(l51.identifier==id)return l51;}
return null;}
function ase_91(e){if(ase_t(e))return;ase_b(e);e=e.changedTouches[0];this.lx6=e.identifier;this.le6=ase_h();this.lx5=e.pageX;this.ly5=e.pageY;this.l26=parseFloat(this.style.left);this.l36=parseFloat(this.style.top);}
function ase_a1(e){e=ase_c1(e.changedTouches,this.lx6);if(!e)return;var lm1=this.lx5-e.pageX;var ln1=this.ly5-e.pageY;this.style.left=(this.l26-lm1)+"px";this.style.top=(this.l36-ln1)+"px";}
function ase_b1(e){if(!ase_c1(e.changedTouches,this.lx6))return;this.lx6=null;this.ld6=ase_h();if(this.le6&&(this.ld6-this.le6<300))this.style.visibility='hidden';}
ase_d1=function(lp,e){var e1=e.changedTouches[0];if(e.type=="touchstart"){var lp1=ase_h();var lq1=(lp1-lp.le6<_jcv.doubleTouchTimer)&&(lp.ld6>lp.le6);lp.le6=lp1;lp.lf6=e1.pageX;lp.lg6=e1.pageY;return lq1?"doubletap":null;}
if(e.type=="touchend"){var lp1=ase_h();lp.ld6=lp1;if((lp.ld6-lp.le6<=_jcv.tapTimer)&&(Math.abs(e1.pageX-lp.lf6)<_jcvp.lj)&&(Math.abs(e1.pageY-lp.lg6)<_jcvp.lj))return "tap";}
return null;}
function ase_e1(lr1,ls1,lt1){var lu1=lr1.indexOf(ls1);var lv1=lr1.indexOf(lt1);if((lu1<0)||(lv1<=lu1))return '';else return lr1.substring(lu1+ls1.length,lv1);}
function ase_f1(lr1,lw1){var l41=lr1.indexOf(lw1);return(l41>=0)?lr1.substring(0,l41):lr1;}
function ase_g1(lr1,lw1){var l41=lr1.indexOf(lw1);return(l41>=0)?lr1.substring(l41+1,lr1.length):"";}
function ase_h1(v){return ase_21(ase_21(v,'&','&amp;'),'"','&#34;');}
function ase_i1(){if(typeof XMLHttpRequest!='undefined')return new XMLHttpRequest();
/*@cc_on
@if(@_jscript_version>=5)
try{return new ActiveXObject("Msxml2.XMLHTTP");}catch(e){}
try{return new ActiveXObject("Microsoft.XMLHTTP");}catch(e){}
@end
@*/
}
function ase_j1(lv,lx1,ly1){var r=ase_i1();if(r){window.ase_k1=false;if(!window.ase_l1){window.ase_l1=function(){window.ase_k1=true;};ase_z(window,'beforeunload',window.ase_l1);}
r.onreadystatechange=function(){if(r.readyState==4){var status=-9999;eval("try { status = r.status; } catch(e) {}");if(status==-9999)return;if((r.status==200)||(r.status==304))lx1(r.responseText);else if(ly1){if(r.status==0){if(!window.ase_k1)ly1(600,"Unable to connect to server");}
else ly1(r.status,r.responseText);}
window.setTimeout(function(){r.onreadystatechange=function(){};r.abort();},1);}
}
if((lv.length<1000)||(ase_6&&!r.setRequestHeader)){r.open('GET',lv,true);r.send(null);}
else {r.open('POST',ase_f1(lv,"?"),true);r.setRequestHeader("Content-Type","application/x-www-form-urlencoded");r.send(ase_g1(lv,"?"));}
}
return r;}
function _jcv(v){this.l01=v.id;v.lr2=v.useMap;this.l42=v.style.cursor;this.l62();this.lw7(this.l01);this.lo={};var l12=v.id+"_JsChartViewerState";this.l92=ase_a(l12);if(!this.l92){var p=v.parentNode||v.parentElement;var s=this.l92=document.createElement("HIDDEN");s.id=s.name=l12;s.value=this.lp1();p.insertBefore(s,v);}
else {this.decodeState(this.l92.value);this.lz4();}
this.l72();if(!ase_7)this.lg1(this.lb2());if(this.ln)this.partialUpdate();}
_jcvp=_jcv.prototype;_jcv.lh2=function(l42){var l52=window.cdjcv_path;if(typeof l52=="undefined")l52=ase_31("cdjcv.js");else if((l52.length>0)&&("/=".indexOf(l52.charAt(l52.length-1))==-1))l52+='/';return l52+l42;}
_jcv.addEventListener=ase_z;_jcv.removeEventListener=ase_01;_jcv.Horizontal=0;_jcv.Vertical=1;_jcv.HorizontalVertical=2;_jcv.Default=0;_jcv.Scroll=2;_jcv.ZoomIn=3;_jcv.ZoomOut=4;_jcv.ReverseScroll=5;_jcv.BottomLeft=1;_jcv.Bottom=2;_jcv.BottomCenter=2;_jcv.BottomRight=3;_jcv.Left=4;_jcv.Center=5;_jcv.Right=6;_jcv.TopLeft=7;_jcv.Top=8;_jcv.TopCenter=8;_jcv.TopRight=9;_jcv.lj5=_jcv.Center;_jcv.li5=100;_jcv.lk5=0;_jcv.Transparent=0xff000000;_jcv.msgContainer='<div style="font:bold 8pt Verdana;padding:3px 8px 3px 8px;border:1px solid #000000;background-color:#FFCCCC;color:#000000">%msg</div>';_jcv.okButton='<center>[<a href="javascript:%closeScript"> OK </a>]</center>';_jcv.xButton='[<a href="javascript:%closeScript"> X </a>]';_jcv.shortErrorMsg='Error %errCode accessing server'+_jcv.okButton;_jcv.serverErrorMsg=_jcv.xButton+'<div style="font:bold 15pt Arial;">Error %errCode accessing server</div><hr>%errMsg';_jcv.updatingMsg='<div style="padding:0px 8px 0px 6px;background-color:#FFFFCC;color:#000000;border:1px solid #000000"><table><tr><td><img src="'+_jcv.lh2('wait.gif')+'"></td><td style="font:bold 8pt Verdana;">Updating</td></tr></table></div>';_jcv.ly1=new Array("l0","l1","l2","l3","l4","l5","l6","l7","l8","l9","la","lb","lc","ld","le","lf","lg","lh","li","lj","lk","ll","lm","ln","lo","lp","lq","lr","ls","lt","lu","lv","lw","lx","ly","lz");_jcv.doubleTouchTimer=300;_jcv.tapTimer=200;_jcv.moveConfirmTimer=300;_jcv.mouseHoldTimer=1000;_jcv.li7="_jcv_tdcliprect";_jcv.lj7="_jcv_tdrect";_jcv.l78=function(lp){var lp1=ase_h();var lq1=((lp1-lp.le6<_jcv.doubleTouchTimer)&&(lp1-lp.ld6<_jcv.doubleTouchTimer)&&(lp.ld6>lp.le6));lp.le6=lp1;return lq1;}
_jcv.la8=function(lp){if(lp.lt6&&(Math.abs(ase_h()-lp.lt6)<_jcv.mouseHoldTimer))return true;lp.lt6=0;return false;}
_jcv.l88=function(lp){lp.lt6=ase_h();}
_jcv.get=function(id){var imgObj=ase_a(id);if(!imgObj)return null;if(!imgObj._jcv)imgObj._jcv=new _jcv(imgObj);return imgObj._jcv;}
_jcvp.getId=function(){return this.l01;}
_jcvp.l82=function(){return ase_a(this.l01);}
_jcvp.l08=function(l72){var id=this.getId();return(function(e){_jcv.get(id)[l72](e,this);});}
_jcvp.l62=function(){this.l82().ld1=function(e,id){if(_jcv.la8(this._jcv))return;var l51;l51=this._jcv["onImg"+id](e);if(this["_jcvOn"+id+"Chain"])l51=this["_jcvOn"+id+"Chain"](e);return l51;};this.l82()._jcvOnMouseMoveChain=this.l82().onmousemove;this.l82()._jcvOnMouseUpChain=this.l82().onmouseup;this.l82()._jcvOnMouseDownChain=this.l82().onmousedown;this.l82()._jcvOnMouseOutChain=this.l82().onmouseout;var l82=this.l01;this.l82().onmousemove=function(e){return ase_a(l82).ld1(e,"MouseMove");}
this.l82().onmousedown=function(e){return ase_a(l82).ld1(e,"MouseDown");}
this.l82().onmouseup=function(e){return ase_a(l82).ld1(e,"MouseUp");}
this.l82().onmouseout=function(e){return ase_a(l82).ld1(e,"MouseOut");}
}
_jcvp.setDisableTouch=function(b){this.lu7=b;}
_jcvp.lr7=function(e,id){if(ase_t(e))return;var et=e.type.toLowerCase();this.l35(this,et+"chart",e);var la2=this.isMouseOnPlotArea();if(la2)this.l35(this,et+"plotarea",e);var lb2=ase_d1(this,e);if(lb2){this.l35(this,lb2+"chart",e);if(la2)this.l35(this,lb2+"plotarea",e);}
if(this.lu7)return;switch(this.la){case _jcv.ZoomIn:case _jcv.ZoomOut:if((lb2=="tap")&&la2)this.l58(e);break;case _jcv.Scroll:case _jcv.ReverseScroll:switch(et){case "touchstart":if(la2)this.lj6(e);case "touchmove":this.lh6(e);break;case "touchend":this.li6(e);break;}
break;}
}
_jcvp.lj6=function(e){if((this.ls6!=null)&&(e.touches.length!=1))return;ase_b(e);if(this.l12)return;var e1=e.changedTouches[0];this.ls6=e1.identifier;this.ln5=0;this.lo5=0;this.ly6=e1.pageX;this.lz6=e1.pageY;}
_jcvp.lh6=function(e){var e1=ase_c1(e.changedTouches,this.ls6);if(!e1)return;ase_b(e);this.ln5=this.lf7(this.ln5+e1.pageX-this.ly6);this.lo5=this.lg7(this.lo5+e1.pageY-this.lz6);this.ly6=e1.pageX;this.lz6=e1.pageY;var c=this.ll2(_jcv.li7);var s=c.style;if(!c.lh8){c.lh8=true;s.pointerEvents="none";s.overflow="hidden";s.backgroundColor="";s.visibility="visible";}
s.left=this.l13(this.l0)+"px";s.top=this.l23(this.l1)+"px";s.width=this.l03(this.l2)+"px";s.height=this.lz2(this.l3)+"px";s.display="";var t=this.ll2(_jcv.lj7);s=t.style;if(!t.lh8){t.lh8=true;s.visibility="visible";s.backgroundColor="";s.borderStyle="solid";c.appendChild(t);}
s.borderWidth=(this.getSelectionBorderWidth())+"px";s.borderColor=this.getSelectionBorderColor();s.width=(this.l03(this.l2)-t.offsetWidth+t.clientWidth)+"px";s.height=(this.lz2(this.l3)-t.offsetHeight+t.clientHeight)+"px";s.left=this.ln5+"px";s.top=this.lo5+"px";}
_jcvp.li6=function(e){var e1=ase_c1(e.changedTouches,this.ls6);if(e1||(e.touches.length==0)){var c=this.la4(_jcv.li7);if(c)c.style.display="none";this.ls6=null;}
if(!e1)return;ase_b(e);if(this.l12)return;var ld2=this.lr6()?1:-1;this.lm1(this.lb,this.l6*this.l43(this.ln5*ld2)/this.l2,this.l6,this.l7*this.l33(this.lo5*ld2)/this.l3,this.l7);}
_jcvp.l58=function(e){var mX=this.getPlotAreaMouseX();var mY=this.getPlotAreaMouseY();switch(this.la){case _jcv.ZoomIn:this.zoomAt(mX,mY,this.ld);break;case _jcv.ZoomOut:this.zoomAt(mX,mY,this.le);break;default:return;}
ase_b(e);}
_jcvp.lw7=function(id){if(this.l82().addEventListener){var l82=this.l01;var lg2=function(e){_jcv.get(l82).lr7(e,id);};var lh2=["touchstart","touchmove","touchend","touchcancel"];for(var i=0;i<lh2.length;++i)ase_a(id).addEventListener(lh2[i],lg2,true);}
}
_jcvp.l53=function(x){return this.l43(x-ase_w(this.l82()));}
_jcvp.l63=function(y){return this.l33(y-ase_x(this.l82()));}
_jcvp.l43=function(w){this.lf5();var lp=this.l82();if(this.l16&&lp.clientWidth)return w*this.l16/lp.clientWidth;return w;}
_jcvp.l33=function(h){this.lf5();var lp=this.l82();if(this.l06&&lp.clientHeight)return h*this.l06/lp.clientHeight;return h;}
_jcvp.l13=function(x){return this.l03(x)+ase_w(this.l82());}
_jcvp.l23=function(y){return this.lz2(y)+ase_x(this.l82());}
_jcvp.l03=function(w){this.lf5();var lp=this.l82();if(this.l16&&lp.clientWidth)return w*lp.clientWidth/this.l16;return w;}
_jcvp.lz2=function(h){this.lf5();var lp=this.l82();if(this.l06&&lp.clientHeight)return h*lp.clientHeight/this.l06;return h;}
_jcvp.toCssW=_jcvp.l03;_jcvp.toCssH=_jcvp.lz2;_jcvp.xShiftInsideChart=function(lp){var ll2=this.l82();var lm1=ase_w(ll2)-ase_w(lp);var lm2=ll2.offsetWidth-lp.offsetWidth;var ln2=Math.max(0,lm1)+Math.min(0,lm1+lm2);if(ln2!=0)lp.style.left=parseFloat(lp.style.left)+ln2+"px";}
_jcvp.lf5=function(){if(!this.l16){if(this.lv){this.l16=this.lv;this.l06=this.lw;}
else {var lp=this.l82();if(lp.naturalWidth){this.l16=lp.naturalWidth;this.l06=lp.naturalHeight;}
else {var lo2=new Image();lo2.src=lp.src;this.l16=lo2.width;this.l06=lo2.height;}
}
}
}
_jcvp.setCustomAttr=function(k,v){this.lo[k]=v;this.lt2();}
_jcvp.getCustomAttr=function(k){return this.lo[k];}
_jcvp.getValueAtViewPort=function(id,lq2,lr2){var ls2=parseFloat(this.getCustomAttr(id+"_min"));var lt2=parseFloat(this.getCustomAttr(id+"_max"));if(!lr2)return ls2+(lt2-ls2)*lq2;else return ls2*Math.pow(lt2/ls2,lq2);}
_jcvp.getViewPortAtValue=function(id,lu2,lr2){var ls2=parseFloat(this.getCustomAttr(id+"_min"));var lt2=parseFloat(this.getCustomAttr(id+"_max"));if(!lr2)return(lu2-ls2)/(lt2-ls2);else return Math.log(lu2/ls2)/Math.log(lt2/ls2);}
_jcvp.l4=0;_jcvp.l5=0;_jcvp.l6=1;_jcvp.l7=1;_jcvp.setViewPortLeft=function(x){this.l4=x;this.lt2();}
_jcvp.getViewPortLeft=function(){return this.l4;}
_jcvp.setViewPortTop=function(y){this.l5=y;this.lt2();}
_jcvp.getViewPortTop=function(){return this.l5;}
_jcvp.setViewPortWidth=function(w){this.l6=w;this.lt2();}
_jcvp.getViewPortWidth=function(){return this.l6;}
_jcvp.setViewPortHeight=function(h){this.l7=h;this.lt2();}
_jcvp.getViewPortHeight=function(){return this.l7;}
_jcvp.l0=-1;_jcvp.l1=-1;_jcvp.l2=-1;_jcvp.l3=-1;_jcvp.ly4=false;_jcvp.lz4=function(){this.l16=0;this.l06=0;if((!this.ly4)&&(this.l2>0))return;var lv2=1E308;var lw2=lv2;var lx2=-lv2;var ly2=lx2;for(var i=0;i<this.getChartCount();++i){var c=this.getChart(i);var p=c.getPlotArea();lv2=Math.min(p.getLeftX()+c.getAbsOffsetX(),lv2);lw2=Math.min(p.getTopY()+c.getAbsOffsetY(),lw2);lx2=Math.max(p.getRightX()+c.getAbsOffsetX(),lx2);ly2=Math.max(p.getBottomY()+c.getAbsOffsetY(),ly2);}
var lz2=(lv2<=lx2);this.l0=lz2?lv2:-1;this.l1=lz2?lw2:-1;this.l2=lz2?lx2-lv2:-1;this.l3=lz2?ly2-lw2:-1;this.ly4=lz2;}
_jcvp.lf1=function(x,y){x=this.l53(x);y=this.l63(y);return(this.l0<=x)&&(x<=this.l0+this.l2)&&(this.l1<=y)&&(y<=this.l1+this.l3);}
_jcvp.msgBox=function(l03,l13){var m=this.lh1;if(!m&&l03){var d=document;{m=d.createElement("DIV");m.style.position='absolute';m.style.visibility='hidden';d.body.appendChild(m);}
if(m)this.lh1=m;}
if(m){window.clearTimeout(m.li1);var s=m.style;if(l03){if(l13)m.li1=window.setTimeout(function(){s.visibility='hidden';},Math.abs(l13));if(l13<0)l03+=_jcv.okButton;if(l03.substring(0,4).toLowerCase()!="<div")l03=ase_21(_jcv.msgContainer,'%msg',l03);var l33="_jcv.get('"+this.l01+"').msgBox();";m.innerHTML=ase_21(l03,'%closeScript',l33);s.visibility='visible';s.left=this.l13(Math.max(0,this.l0+(this.l2-this.l43(m.offsetWidth))/2))+"px";s.top=this.l23(Math.max(0,this.l1+(this.l3-this.l33(m.offsetHeight))/2))+"px";}
else {s.visibility='hidden';}
}
}
_jcvp.l8=2;_jcvp.l9="#000000";_jcvp.setSelectionBorderWidth=function(w){this.l8=w;this.lt2();}
_jcvp.getSelectionBorderWidth=function(){return this.l8;}
_jcvp.setSelectionBorderColor=function(c){this.l9=c;this.lt2();}
_jcvp.getSelectionBorderColor=function(){return this.l9;}
_jcvp.la4=function(id){return ase_a(this.getId()+"_"+id);}
_jcvp.ll2=function(id){id=this.getId()+"_"+id;var l51=ase_a(id);if(!l51){var d=document;{l51=d.createElement("DIV");l51.id=id;var s=l51.style;s.position="absolute";s.visibility="hidden";s.backgroundColor="#000000";s.width="1px";s.height="1px";s.cursor=this.l82().style.cursor;d.body.appendChild(l51);if(l51.clientHeight!=1)l51.innerHTML="<img width='1px' height='1px' />";}
if(!this.lr4)this.lr4=[];this.lr4.push(id);}
return l51;}
_jcvp.lz1=function(x,y,l43,l53){var l63=this.ll2("leftLine").style;var l73=this.ll2("rightLine").style;var l83=this.ll2("topLine").style;var l93=this.ll2("bottomLine").style;l63.left=l83.left=l93.left=x+"px";l63.top=l73.top=l83.top=y+"px";l83.width=l93.width=l43+"px";l93.top=(y+l53-this.l8+1)+"px";l63.height=l73.height=l53+"px";l73.left=(x+l43-this.l8+1)+"px";l63.width=l73.width=l83.height=l93.height=this.l8+"px";l63.backgroundColor=l73.backgroundColor=l83.backgroundColor=l93.backgroundColor=this.l9;}
_jcvp.l02=function(b){var la3=["leftLine","rightLine","topLine","bottomLine"];for(var i=0;i<la3.length;++i){var lp=this.la4(la3[i]);if(lp)lp.style.visibility=b?"visible":"hidden";}
}
_jcvp.onToolTipMouseMove=function(e,li1){if(_jcv.la8(this))return;if(li1!=this.la6){this.la6=li1;this.l25(li1,"mouseoverhotspot",e);}
this.l25(li1,"mousemovehotspot",e);}
_jcvp.onToolTipMouseOut=function(e,li1){if(_jcv.la8(this))return;this.la6=null;this.l25(li1,"mouseouthotspot",e);}
_jcvp.showToolTip=function(lb3,lc3,ld3,le3,lf3){var lg3=(null==ld3);if(null==lc3)lc3="padding:3px 5px;font:bold 12px Arial;background-color:#DDFFFF;-webkit-border-radius:5px;-moz-border-radius:5px;border-radius:5px;border:1px solid black;";var lh3=this.lk6?-0:0;var li3=this.lk6?-20:20;if(null==lf3)lf3=_jcv.TopLeft;if(lg3){ld3=this.getChartMouseX()+this.l43(lh3);le3=this.getChartMouseY()+this.l33(li3);lf3=this.lk6?_jcv.Bottom:_jcv.TopLeft;}
var t=this.showTextBox("tooltip",ld3,le3,lf3,lb3,lc3);if(lg3){var lj3=this.l13(ld3);var lk3=this.l23(le3);var ll3=lj3-lh3;var lm3=lk3-li3;var ln3=ase_l();var lo3=ln3+ase_o()-2;var lp3=ase_m();var lq3=lp3+ase_p()-2;var lr3=lo3-t.clientWidth;var ls3=lq3-t.clientHeight;var lt3=function(x){return Math.max(ln3,x)+"px";};var lu3=function(x){return Math.min(lr3,x)+"px";};var lv3=function(y){return Math.max(lp3,y)+"px";};var lw3=function(y){return Math.min(ls3,y)+"px";};if(this.lk6){var lx3=(lj3-t.clientWidth/2<ln3);var ly3=(lj3+t.clientWidth/2>lo3);var lz3=(lk3-t.clientHeight<lp3);if(lz3){if(ll3-t.clientWidth-10>ln3){t.style.top=lp3+"px";t.style.left=lt3(ll3-t.clientWidth-20);}
else if(lm3+10<ls3){if(lx3)t.style.left=ln3+"px";else if(ly3)t.style.left=lt3(lr3);t.style.top=lw3(lm3+20);}
else if((ll3+10<lr3)&&(lp3<ls3)){t.style.left=lu3(ll3+20);t.style.top=lw3(lm3+20);}
}
else {if(lx3)t.style.left=ln3+"px";else if(ly3)t.style.left=lt3(lr3);}
}
else {var ly3=(lj3>lr3);var l04=(lk3>ls3);if(ly3){if(!l04){t.style.left=lt3(lr3);}
else if(lp3+t.clientHeight+8<lm3){t.style.top=(lm3-t.clientHeight-8)+"px";t.style.left=lt3(lr3);}
else if((ln3+t.clientWidth+8<ll3)&&(lp3<ls3)){t.style.left=(ll3-t.clientWidth-8)+"px";t.style.top=lv3(ls3);}
}
else if(l04){if(ll3+12<lr3){t.style.left=(ll3+12)+"px";t.style.top=lv3(ls3);}
else if(lp3+t.clientHeight+5<lm3){t.style.top=(lm3-t.clientHeight-4)+"px";}
else if((ln3+t.clientWidth+8<ll3)&&(lp3<ls3)){t.style.left=(ll3-t.clientWidth-8)+"px";t.style.top=lv3(ls3);}
}
}
}
if(this.lk6)ase_81(t);return t;}
_jcvp.onToolTipTouchStart=function(e,li1){_jcv.l88(this);if(ase_t(e))return;this.l35(li1,_jcv.l78(li1)?"dbltouchhotspot":"touchstarthotspot",e);}
_jcvp.onToolTipTouchEnd=function(e,li1){_jcv.l88(this);if(ase_t(e))return;this.l35(li1,"touchendhotspot",e);li1.ld6=ase_h();}
_jcvp.initToolTipHandler=function(){this.setAutoResizeImageMap();var le1=_jcv.l22(this.l82());if(!le1)return;var lh1=le1.getElementsByTagName("area");if(!lh1)return;var l14=this.l08("onToolTipTouchStart");var l24=this.l08("onToolTipTouchEnd");var l34=this.l08("onToolTipMouseMove");var l44=this.l08("onToolTipMouseOut");for(var i=0;i<lh1.length;i++){var li1=lh1[i];if(li1.lb7)continue;ase_z(li1,"touchstart",l14,true);ase_z(li1,"touchend",l24,true);ase_z(li1,"mousemove",l34,true);ase_z(li1,"mouseout",l44,true);li1.lb7=1;}
}
_jcvp.la=_jcv.Default;_jcvp.lb=_jcv.Horizontal;_jcvp.lc=_jcv.Horizontal;_jcvp.ld=2;_jcvp.le=0.5;_jcvp.lf=0.01;_jcvp.lg=1;_jcvp.lh=0.01;_jcvp.li=1;_jcvp.getMouseUsage=function(){return this.la;}
_jcvp.setMouseUsage=function(l54){this.la=l54;this.lt2();}
_jcvp.getScrollDirection=function(){return this.lb;}
_jcvp.setScrollDirection=function(l64){this.lb=l64;this.lt2();}
_jcvp.getZoomDirection=function(){return this.lc;}
_jcvp.setZoomDirection=function(l64){this.lc=l64;this.lt2();}
_jcvp.getZoomInRatio=function(){return this.ld;}
_jcvp.setZoomInRatio=function(lq2){if(lq2>0)this.ld=lq2;this.lt2();}
_jcvp.getZoomOutRatio=function(){return this.le;}
_jcvp.setZoomOutRatio=function(lq2){if(lq2>0)this.le=lq2;this.lt2();}
_jcvp.getZoomInWidthLimit=function(){return this.lf;}
_jcvp.setZoomInWidthLimit=function(lq2){this.lf=lq2;this.lt2();}
_jcvp.getZoomOutWidthLimit=function(){return this.lg;}
_jcvp.setZoomOutWidthLimit=function(lq2){this.lg=lq2;this.lt2();}
_jcvp.getZoomInHeightLimit=function(){return this.lh;}
_jcvp.setZoomInHeightLimit=function(lq2){this.lh=lq2;this.lt2();}
_jcvp.getZoomOutHeightLimit=function(){return this.li;}
_jcvp.setZoomOutHeightLimit=function(lq2){this.li=lq2;this.lt2();}
_jcvp.lq1=function(){return((this.lc!=_jcv.Vertical)&&(this.l6>this.lf))||((this.lc!=_jcv.Horizontal)&&(this.l7>this.lh));}
_jcvp.lr1=function(){return((this.lc!=_jcv.Vertical)&&(this.l6<this.lg))||((this.lc!=_jcv.Horizontal)&&(this.l7<this.li));}
_jcvp.l73=-1;_jcvp.l83=-1;_jcvp.lj=5;_jcvp.getMinimumDrag=function(){return this.lj;}
_jcvp.setMinimumDrag=function(l74){this.lj=l74;this.lt2();}
_jcvp.lj1=function(e,d){return this.li8(ase_q(e)-this.l73,ase_r(e)-this.l83,d,this.lj);}
_jcvp.li8=function(l84,l94,d,la4){l84=Math.abs(l84);l94=Math.abs(l94);switch(d){case _jcv.Horizontal:return l84>=la4;case _jcv.Vertical:return l94>=la4;default:return(l84>=la4)||(l94>=la4);}
}
_jcvp.onImgMouseDown=function(e){if(this.lb4){window.clearTimeout(this.li4);this.lb4=false;}
this.lv3("chartmousedown",e);this.lv3("mousedownchart",e);if(this.l12)return;if(this.lf1(ase_q(e),ase_r(e))&&(ase_s(e)==1)){if((this.la!=_jcv.Default)&&((!ase_7)||(ase_9()<9)))ase_b(e);this.ls2(true);this.l11(e);}
}
_jcvp.onImgMouseMove=function(e){if(this.lb4){window.clearTimeout(this.li4);this.lb4=false;}
this.l51(e);var lb4=this.lr3;this.lr3=this.lf1(ase_q(e),ase_r(e));if(this.lr3)this.l31(e);else if(lb4)this.la1(e);if(this.l12)return;this.lo3=this.lg2||this.lr3;if(this.lo3&&this.lg2){if(this.l05||(ase_q(e)!=this.l73)||(ase_r(e)!=this.l83)){this.l05=true;if((this.la!=_jcv.Default)&&this.l82().useMap)this.l82().useMap=null;this.l21(e);}
}
this.lg1(this.le1(e));return this.la==_jcv.Default;}
_jcvp.onImgMouseUp=function(e){this.lv3("chartmouseup",e);this.lv3("mouseupchart",e);if(this.l12)return;if(this.lg2&&(ase_s(e)==1)){this.ls2(false);this.l41(e);}
if(!this.l12)this.lg1(this.le1(e));}
_jcvp.onImgMouseOut=function(e){if(!this.lb4){var id=this.l01;var x=this.l53(ase_q(e));var y=this.l63(ase_r(e));this.li4=window.setTimeout(function(){_jcv.get(id).l71(e,x,y)},1);this.lb4=true;}
}
_jcvp.l71=function(e,x,y){if(this.lr3){this.lr3=false;this.la1(e);}
this.l61(e);}
_jcvp.ls2=function(b){var imgObj=this.l82();if(b){if(((this.la==_jcv.ZoomIn)||(this.la==_jcv.ZoomOut))&&imgObj.useMap)imgObj.useMap=null;if(imgObj.setCapture&&!ase_2)imgObj.setCapture();else {if(!window._jcvOnMouseUpChain)window._jcvOnMouseUpChain=window.onmouseup;if(!window._jcvOnMouseMoveChain)window._jcvOnMouseMoveChain=window.onmousemove;window.onmouseup=imgObj.onmouseup;window.onmousemove=imgObj.onmousemove;}
}
else {if(imgObj.useMap!=imgObj.lr2)imgObj.useMap=imgObj.lr2;if(imgObj.setCapture&&!ase_2)imgObj.releaseCapture();else {window.onmouseup=window._jcvOnMouseUpChain;window.onmousemove=window._jcvOnMouseMoveChain;window._jcvOnMouseUpChain=null;window._jcvOnMouseMoveChain=null;}
}
this.lg2=b;this.l05=false;}
_jcvp.setZoomInCursor=function(lc4){this.lk=lc4;this.lt2();}
_jcvp.getZoomInCursor=function(){return this.lk;}
_jcvp.setZoomOutCursor=function(lc4){this.ll=lc4;this.lt2();}
_jcvp.getZoomOutCursor=function(){return this.ll;}
_jcvp.setNoZoomCursor=function(lc4){this.lq=lc4;this.lt2();}
_jcvp.getNoZoomCursor=function(){return this.lq;}
_jcvp.setScrollCursor=function(lc4){this.lm=lc4;this.lt2();}
_jcvp.getScrollCursor=function(){return this.lm;}
_jcvp.ls4=function(c,x,y){return "url('"+_jcv.lh2(c)+"'), auto";}
_jcvp.lb2=function(){switch(this.la){case _jcv.ZoomIn:if(this.lq1()){if(this.lk)return this.lk;else if(ase_4||ase_5)return "-webkit-zoom-in";else if(ase_2&&!ase_8)return "-moz-zoom-in";else return this.ls4('zoomin.cur');}
else return this.lq?this.lq:"";case _jcv.ZoomOut:if(this.lr1()){if(this.ll)return this.ll;else if(ase_4||ase_5)return "-webkit-zoom-out";else if(ase_2&&!ase_8)return "-moz-zoom-out";else return this.ls4('zoomout.cur');}
else return this.lq?this.lq:"";default:return "";}
}
_jcvp.le1=function(e){if(this.l12)return "wait";if(this.lf2){if(this.lm)return this.lm;if(!e&&!window.event)return "";switch(this.lb){case _jcv.Horizontal:return(ase_q(e)>=this.l73)?"e-resize":"w-resize";case _jcv.Vertical:return(ase_r(e)>=this.l83)?"s-resize":"n-resize";default:return "move";}
}
if(this.lo3)return this.lb2();else return "";}
_jcvp.lg1=function(ld4){if(ld4!=this.l42){this.l42=ld4;this.l82().style.cursor=new String(ld4);if(this.lr4){for(var i=0;i<this.lr4.length;++i){var lp=ase_a(this.lr4[i]);if(lp)lp.style.cursor=new String(ld4);}
}
}
}
_jcvp.lv3=function(le4,e){this.l07(ase_q(e),ase_r(e));this.applyHandlers(le4,e);}
_jcvp.l07=function(x,y){this.ly3=this.l53(x);this.lz3=this.l63(y);if(this.lu6()){this.l04=Math.max(this.l0,Math.min(this.ly3,this.l0+this.l2));this.l14=Math.max(this.l1,Math.min(this.lz3,this.l1+this.l3));}
}
_jcvp.getChartMouseX=function(){return this.ly3;}
_jcvp.getChartMouseY=function(){return this.lz3;}
_jcvp.getPlotAreaMouseX=function(){var l51=this.l04;return ase_g(l51)?this.l0+this.l2:l51;}
_jcvp.getPlotAreaMouseY=function(){var l51=this.l14;return ase_g(l51)?this.l1+this.l3:l51;}
_jcvp.lk4=16;_jcvp.ll4=16;_jcvp.lm4=16;_jcvp.lj4=16;_jcvp.setPlotAreaMouseMargin=function(lf4,lg4,lh4,li4){if(arguments.length==1)lg4=lh4=li4=lf4;this.lk4=lf4;this.ll4=lg4;this.lm4=lh4;this.lj4=li4;}
_jcvp.setPlotAreaMouseMargin2=_jcvp.setPlotAreaMouseMargin;_jcvp.lu6=function(){var lw2=this.l1-this.lm4;var ly2=this.l1+this.l3+this.lj4;var lv2=this.l0-this.lk4;var lx2=this.l0+this.l2+this.ll4;var x=this.getChartMouseX();var y=this.getChartMouseY();var lj4=(y>=lw2)&&(y<=ly2);var lk4=(x>=lv2)&&(x<=lx2);return lj4&&lk4;}
_jcvp.l51=function(e){this.lv3("mousemovechart",e);if(this.lu6())this.l81(e);else this.l91(e);}
_jcvp.l61=function(e){this.l91(e);this.applyHandlers("mouseoutchart",e);}
_jcvp.l81=function(e){this.lp3=true;this.applyHandlers("mousemoveplotarea",e);}
_jcvp.l91=function(e){if(this.lp3){this.lp3=false;this.applyHandlers("mouseoutplotarea",e);}
}
_jcvp.isMouseOnPlotArea=function(){return this.lu6();}
_jcvp.lg4=function(id,ll4){var l51=this.la4(id);if(!l51){l51=this.ll2(id);if(!ll4)this.l94(l51,id=="tooltip");}
this.lb8(id);return l51;}
_jcvp.lb8=function(id){if(!this.lb3)this.lb3=[];for(var i=0;i<this.lb3.length;++i){if(this.lb3[i]==id)return;}
this.lb3.push(id);}
_jcvp.l94=function(lp,lm4){lp.onmousedown=this.l82().onmousedown;lp.onmousemove=this.l82().onmousemove;lp.onmouseout=this.l82().onmouseout;lp.onmouseover=this.l82().onmousemove;if(!lm4)this.lw7(lp.id);}
_jcvp.drawHLine=function(id,y,x1,x2,lp4){if(x1>x2){var lq4=x1;x1=x2;x2=lq4;}
return this.lj3(id,y,x1,x2,lp4);}
_jcvp.lj3=function(id,y,x1,x2,lp4){var lr4=x2-x1+1;var lp=this.lg4(id);var s=lp.style;if((lr4<=0)||!lp4)s.visibility="hidden";else {s.width=this.l03(lr4)+"px";s.height="0px";if(lp4!="[unchanged]")s.borderTop=lp4;s.backgroundColor="";s.left=this.l13(x1)+"px";s.top=(this.l23(y)-Math.floor(lp.clientTop/2))+"px";s.visibility="visible";}
return lp;}
_jcvp.drawVLine=function(id,x,y1,y2,lp4){if(y1>y2){var lq4=y1;y1=y2;y2=lq4;}
return this.lk3(id,x,y1,y2,lp4);}
_jcvp.lk3=function(id,x,y1,y2,lp4){var lr4=y2-y1+1;var lp=this.lg4(id);var s=lp.style;if((lr4<=0)||!lp4)s.visibility="hidden";else {s.width="0px";s.height=this.lz2(lr4)+"px";if(lp4!="[unchanged]")s.borderLeft=lp4;s.backgroundColor="";s.left=(this.l13(x)-Math.floor(lp.clientLeft/2))+"px";s.top=this.l23(y1)+"px";s.visibility="visible";}
return lp;}
_jcvp.showCrossHair=function(x,y,lp4,lf4,lg4,lh4,li4,lu4){if(!lp4)lp4="1px dotted black";if(!lf4)lf4=0;if(!lg4)lg4=0;if(!lh4)lh4=0;if(!li4)li4=0;if(ase_g(lu4))lu4=5;var lv4=this.l0+1-lf4;var lw4=lv4+this.l2-1+lg4;var lx4=this.l1+1-lh4;var ly4=lx4+this.l3-1+li4;x=Math.max(this.l0,Math.min(this.l0+this.l2,x));y=Math.max(this.l1,Math.min(this.l1+this.l3,y));if(lu4){this.lj3("hLeftLine",y,lv4,Math.min(lw4,x-lu4),lp4);this.lj3("hRightLine",y,Math.max(lv4,x+lu4),lw4,lp4);this.lk3("vTopLine",x,lx4,Math.min(ly4,y-lu4),lp4);this.lk3("vBottomLine",x,Math.max(lx4,y+lu4),ly4,lp4);}
else {this.lj3("hLeftLine",y,lv4,lw4,lp4);this.lj3("hRightLine",0,0,0,null);this.lk3("vTopLine",x,lx4,ly4,lp4);this.lk3("vBottomLine",0,0,0,null);}
}
_jcvp.hideCrossHair=function(){var la3=["hLeftLine","hRightLine","vTopLine","vBottomLine"];for(var i=0;i<la3.length;++i)this.hideObj(la3[i]);}
_jcvp.ln4=function(x,l43,lz4,l05){if(lz4)return x-Math.floor(l43/2);else if(l05)return x-l43;else return x;}
_jcv.ld4=function(l15){return(l15==_jcv.Top)||(l15==_jcv.Center)||(l15==_jcv.Bottom);}
_jcv.le4=function(l15){return(l15==_jcv.TopRight)||(l15==_jcv.Right)||(l15==_jcv.BottomRight);}
_jcv.lf4=function(l15){return(l15==_jcv.Left)||(l15==_jcv.Center)||(l15==_jcv.Right);}
_jcv.lc4=function(l15){return(l15==_jcv.Bottom)||(l15==_jcv.BottomLeft)||(l15==_jcv.BottomRight);}
_jcv.setStyle=function(s){var l25=s.split(';');var l35=[];for(var i=0;i<l25.length;++i){var av=ase_c(l25[i]);var l41=av.indexOf(":");if(l41==-1)continue;var l55=ase_c(av.substring(0,l41)).split('-');for(var j=1;j<l55.length;++j)l55[j]=l55[j].charAt(0).toUpperCase()+l55[j].substring(1);var a=l55.join('');if(a){var v=ase_c(av.substring(l41+1));if(a.toLowerCase()=="class")this.className=v;else l35.push(a,v);}
}
for(var j=0;j<l35.length;j+=2)this.style[l35[j]]=l35[j+1];}
_jcvp.ln7=function(id,x,y,l15,lr1,l65,l75){this.removeAutoHide(id);var l85=this.la4(id);var lp=this.lg4(id,l75);lp.setStyle=_jcv.setStyle;var s=lp.style;if(!l85)lp.setStyle("background-color:;width:;height:;left:0px;top:0px;");if((lr1.length>=5)&&(lr1.substring(0,4).toLowerCase()=="<img")&&(lr1.indexOf(">")==lr1.length-1))s.lineHeight="0px";if(l65)lp.setStyle(l65);if(lr1!="[unchanged]")lp.innerHTML=lr1;s.visibility="visible";s.left=this.ln4(this.l13(x),lp.offsetWidth,_jcv.ld4(l15),_jcv.le4(l15))+"px";s.top=this.ln4(this.l23(y),lp.offsetHeight,_jcv.lf4(l15),_jcv.lc4(l15))+"px";return lp;}
_jcvp.showTextBox=function(id,x,y,l15,lr1,l65){return this.ln7(id,x,y,l15,lr1,l65,false);}
_jcvp.showClickableTextBox=function(id,x,y,l15,lr1,l65){return this.ln7(id,x,y,l15,lr1,l65,true);}
_jcvp.hideObj=function(id,l95){this.l77(id);if((!l95)&&(id.toLowerCase()=="all")){var la5=this.lb3;if(la5){for(var i=0;i<la5.length;++i)this.hideObj(la5[i],1);}
}
else if(id.toLowerCase()=="crosshair"){this.hideCrossHair();}
else {var lp=this.la4(id);if(lp)lp.style.visibility="hidden";}
}
_jcvp.isVisible=function(id){var lp=this.la4(id);return(lp&&(lp.style.visibility=="visible"));}
_jcvp.l77=function(id){if(this.l15){var lb5=this.l15[id];if(lb5){window.clearTimeout(lb5);delete this.l15[id];}
}
}
_jcvp.lc5=function(id,l13,lc5){this.l77(id);if((!l13)||(l13<0)){if(!l13)this.hideObj(id);return;}
if(!this.l15)this.l15={};var ld5=this;this.l15[id]=window.setTimeout(function(){ld5.lv7(id,l13)},lc5||l13);}
_jcvp.lv7=function(id,l13){var lp=this.la4(id);if(lp&&lp.le6){var lp1=ase_h();var le5=lp1-((lp.le6>(lp.ld6||0))?lp1:lp.ld6);if(le5<l13)return this.lc5(id,l13,l13-le5);}
this.hideObj(id);}
_jcvp.l45=function(){if(!this.lv6){this.ll7();var id=this.l01;this.lv6=function(){_jcv.get(id).le5();};this.lw6=window.setInterval(this.lv6,_jcv.moveConfirmTimer);ase_z(window,"resize",this.lv6,false);ase_z(this.l82(),"move",this.lv6,false);ase_z(this.l82(),"resize",this.lv6,false);}
}
_jcvp.ld5=function(){if(this.lv6){window.clearInterval(this.lw6);ase_01(window,"resize",this.lv6,false);ase_01(this.l82(),"move",this.lv6,false);ase_01(this.l82(),"resize",this.lv6,false);this.lv6=null;}
}
_jcvp.le5=function(){var lp=this.l82();if((this.lt5!=ase_w(lp))||(this.lu5!=ase_x(lp))||(this.ls5!=lp.clientWidth)||(this.lr5!=lp.clientHeight)){this.ll7();this.applyHandlers("chartmove");}
}
_jcvp.ll7=function(){var lp=this.l82();this.lt5=ase_w(lp);this.lu5=ase_x(lp);this.ls5=lp.clientWidth;this.lr5=lp.clientHeight;}
_jcvp.lh7=function(lf1,lg1){ase_71(_jcv.l22(this.l82()),lf1?lf1:this.l03(1),lg1?lg1:this.lz2(1));}
_jcvp.lq7=function(){this.lh7();this.hideObj("tooltip");}
_jcvp.setAutoResizeImageMap=function(b){if(ase_g(b))b=true;if(b){if(this.l65)return;this.l65=this.attachHandler(["ChartMove","Now"],this.lq7);}
else {if(this.l65)this.detachHandler(this.l65);this.l65=null;}
}
_jcvp.setAutoHide=function(id,lf5){if(lf5 instanceof Array){for(var i=0;i<lf5.length;++i)this.setAutoHide(id,lf5[i]);return;}
if(id.toLowerCase()=="all")id="all";lf5=lf5.toLowerCase();if(!this.lw3)this.lw3={};if(!this.lw3[lf5])this.lw3[lf5]={};this.lw3[lf5][id]=1;}
_jcvp.removeAutoHide=function(id,lf5){if(lf5 instanceof Array){for(var i=0;i<lf5.length;++i)this.removeAutoHide(id,lf5[i]);return;}
if(this.lw3){var lg5=this.lw3[lf5];if(lg5)delete lg5[id];}
this.l77(id);}
_jcvp.lu3=function(lf5){if(this.lw3){var lg5=this.lw3[lf5];if(lg5){if(lg5["all"])this.hideObj("all");else {for(var id in lg5)this.hideObj(id);}
this.lw3[lf5]={};}
}
}
_jcv.lp4=function(a,id){if((!a)||(!a.length))return null;if(!id)id=0;var lh5=typeof id=="number";var l51=lh5?a[id]:_jcv.lq4(a,id);if(!l51)l51=lh5?_jcv.lq4(a,id):a[id];return l51;}
_jcv.lq4=function(a,id){for(var i=0;i<a.length;++i){var lp=a[i];if(lp&&(lp.id==id))return lp;}
return null;}
_jcv.lh3=["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];_jcv.li3=["Sun","Mon","Tue","Wed","Thu","Fri","Sat"];_jcv.lg3=["am","pm"];_jcv.l74=function(s,c,n){return(s.indexOf(c)!=-1)?s.replace(new RegExp(c+c,'g'),(n<10)?"0"+n:n).replace(new RegExp(c,'g'),n):s;}
_jcv.lw4=function(s,c,r){return(s.indexOf(c)!=-1)?s.replace(new RegExp(c,'g'),r):s;}
_jcvp.htmlRect=function(w,h,lj5,lk5){lk5=lk5?"border:"+lk5+";":"";lj5=lj5?"background-color:"+lj5+";":"";var lv=(ase_7&&(ase_9()<8))?_jcv.lh2('spacer.gif'):'data:image/gif;base64,R0lGODlhAQABAID/AMDAwAAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==';var l51="<img width='"+w+"px' height='"+h+"px' src='"+lv+"' style='max-width:none;max-height:none;pointer-events:none;"+lk5+lj5+"'";return l51+" />";}
_jcvp.getChart=function(id){var ll5=window[this.l01+"_chartModel"];if(!ll5)return null;var lm5=(ll5.charts||id);if(lm5)ll5=_jcv.lp4(ll5.charts,id);if(!ll5)return null;if(!ll5.obj)ll5.obj=lm5?new _jcvxyc(ll5.x,ll5.y,ll5.c,this):new _jcvxyc(0,0,ll5,this);return ll5.obj;}
_jcvp.getChartByZ=_jcvp.getChart;_jcvp.getChartCount=function(id){var l51=0;while(this.getChart(l51))++l51;return l51;}
_jcv.lx3=function(a,b){if(a==null)return(b==null)?0:-1;else return(b==null)?1:(a-b);}
function _jcvxyc(ln5,lo5,ll5,lp5){this.offsetX=ln5;this.offsetY=lo5;this.data=ll5;this.lx4=lp5;}
_jcvxycp=_jcvxyc.prototype;_jcvxycp.getAbsOffsetX=function(){return this.offsetX;}
_jcvxycp.getAbsOffsetY=function(){return this.offsetY;}
_jcvxycp.getPlotArea=function(){if(!this.pa)this.pa=new _jcvpa(this.data.plotarea);return this.pa;}
_jcvxycp.getLayer=function(i){if(!this.lt3){this.lt3={};var lr5=null;for(var j=0;j<this.data.layers.length;++j){var ls5=this.data.layers[j];this.lt3[ls5.id]=j;}
}
var lt5=this.lt3[i];return this.lh4((lt5==null)?null:this.data.layers[lt5]);}
_jcvxycp.getLayerByZ=function(i){return this.lh4(_jcv.lp4(this.data.layers,i));}
_jcvxycp.lh4=function(ll5){if(!ll5)return null;if(!ll5.obj)ll5.obj=new _jcvl(this,ll5);return ll5.obj;}
_jcvxycp.getLayerCount=function(){var lu5=this.data.layers;return lu5?lu5.length:0;}
_jcvxycp.getNearestXValue=function(ld3){var l51=null;var lv5=null;var lw5=this.xAxis();var lr5=null;for(var i=0;lr5=this.getLayer(i);++i){var lx5=lr5.getNearestXValue(ld3);if(lx5==null)continue;var ly5=Math.abs(lw5.ll3(lx5)-ld3);if((lv5==null)||(lv5>ly5)){l51=lx5;lv5=ly5;}
}
return l51;}
_jcvxycp.getAxis=function(i){var ll5=_jcv.lp4(this.data.axes,i);if(!ll5)return null;if(!ll5.obj)ll5.obj=new _jcva(this,ll5);return ll5.obj;}
_jcvxycp.xAxis=function(){return this.getAxis(0);}
_jcvxycp.xAxis2=function(){return this.getAxis(1);}
_jcvxycp.yAxis=function(){return this.getAxis(2);}
_jcvxycp.yAxis2=function(){return this.getAxis(3);}
_jcvxycp.getXCoor=function(v){return this.xAxis().lm3(v);}
_jcvxycp.getYCoor=function(v,lw5){if(!lw5)lw5=this.yAxis();return lw5.lm3(v);}
_jcvxycp.getXValue=function(ld3){return this.xAxis().ln3(ld3);}
_jcvxycp.getYValue=function(le3,lw5){if(!lw5)lw5=this.yAxis();return lw5.ln3(le3);}
_jcvxycp.setNumberFormat=function(lz5,l06,l16){lz5=lz5||"~";l06=l06||"~";l16=l16||"~";this.data.lf3=lz5.substring(0,1)+l06.substring(0,1)+l16.substring(0,1);}
_jcvxycp.setMonthNames=function(l26){this.data.ld3=l26;}
_jcvxycp.setWeekDayNames=function(l26){this.data.le3=l26;}
_jcvxycp.setAMPM=function(am,pm){this.data.lc3=[am,pm];}
_jcvxycp.l64=function(l56,d){if(d==null)return;if(!d.getMonth)d=_jcv.NTime(d);var l66=this.data.ld3||_jcv.lh3;var l76=this.data.le3||_jcv.li3;var l86=this.data.lc3||_jcv.lg3;var f=l56.replace(/mmm/g,'#p').replace(/M/g,'#M').replace(/w/g,'#w').replace(/a/g,'#a');for(var i=0;(i<4)&&(f.indexOf('y')!=-1);++i)f=f.replace(new RegExp("yyyy".substring(0,4-i),'g'),(i!=3)?new String(d.getFullYear()).substring(i,4):d.getFullYear());f=_jcv.l74(f,'m',d.getMonth()+1);f=_jcv.l74(f,'d',d.getDate());f=_jcv.l74(f,'h',(f.indexOf('a')!=-1)?(d.getHours()+11)%12+1:d.getHours());f=_jcv.l74(f,'n',d.getMinutes());f=_jcv.l74(f,'s',d.getSeconds());for(var j=0;(j<3)&&(f.indexOf('f')!=-1);++j)f=f.replace(new RegExp("fff".substring(0,3-j),'g'),new String(d.getMilliseconds()+1000).substring(1,4-j));for(var k=0;(k<3)&&(f.indexOf('#M')!=-1);++k)f=f.replace(new RegExp("#M#M#M".substring(0,6-2*k),'g'),l66[d.getMonth()].toUpperCase().substring(0,3-k));f=_jcv.lw4(f,"#p",l66[d.getMonth()]);f=_jcv.lw4(f,"#w",l76[d.getDay()]);f=_jcv.lw4(f,"#a",l86[(d.getHours()>=12)?1:0]);return f;}
_jcvxycp.lo4=function(c,la6){if(!c||(c=='?'))return la6;else return(c=='~')?"":c;}
_jcvxycp.l84=function(l56,d){if(d==null)return null;var lb6=this.data.lf3||"~.-";var re=(/^([eEgGpP]?)(\d*)(.?)(.?)(.?)(.?)/).exec(l56);var lc6=re[1];var ld6=re[2]?parseInt(re[2]):-1;var lz5=this.lo4(re[3],lb6.charAt(0));var l06=this.lo4(re[4],lb6.charAt(1));var l16=this.lo4(re[5],lb6.charAt(2));var le6=this.lo4(re[6],"");var lf6=false;var lg6=0;var lh6=d<0;if(lh6)d=-d;if(lc6!=""){lg6=(d>0)?Math.floor(Math.log(d)/Math.LN10):0;if((lc6=='g')||(lc6=='G')){lf6=true;var li6=(ld6<0)?4:ld6;if((lg6>=li6)||(lg6<-3)){lc6=(lc6=='g')?'e':'E';--ld6;}
else {if(lg6>=0)ld6=li6-1-lg6;else ld6=Math.max(4,ld6);}
}
if((lc6=='e')||(lc6=='E')){d/=Math.pow(10,lg6);if(ld6<0)ld6=3;}
if((lc6=='p')||(lc6=='P')){lf6=true;if(ld6<0)ld6=3;ld6=Math.max(0,Math.min(ld6,ld6-lg6));}
}
var lj6=Math.floor(d);var lk6=d-lj6;if(lk6>0.999999999999){lk6=0;++lj6;}
else if(lk6<0.000000000001){lk6=0;}
else {if((ld6<0)&&(lj6>=100000000*lk6))ld6=0;if(ld6>=0)d+=Math.pow(10,-ld6)*0.5;else d+=0.0000005;if(lj6!=Math.floor(d)){lj6=Math.floor(d);lk6=0;}
}
if((lj6==10)&&((lc6=='e')||(lc6=='E'))){++lg6;lj6=1;lk6/=10;}
if((lj6==0)&&(lk6==0))lh6=false;var ll6=le6+lj6;for(var lm6=ll6.length-3;lm6>((0!=le6)?0:1);lm6-=3)ll6=ll6.substring(0,lm6)+lz5+ll6.substring(lm6);if(((ld6>0)&&(!lf6||(lk6>0)))||((ld6<0)&&(lk6>0))){var ln6=(ld6>0)?ld6:6;var lo6=Math.round(Math.pow(10,ln6));var lp6=new String(Math.round(lk6*lo6)%lo6);while(lp6.length<ln6)lp6='0'+lp6;if((ld6<0)||lf6)lp6=lp6.replace(/0*$/,'');if(lp6.length>0)ll6+=(l06==""?'.':l06)+lp6;}
if(lh6&&ll6.match(/[1-9]/))ll6=l16+ll6;if((lc6=='e')||(lc6=='E'))ll6+=lc6+(((lg6>=0)&&!lf6)?'+':'')+lg6;return ll6;}
_jcvxycp.l54=function(l56,d){if(!l56)l56="";var lq6=l56?l56.charAt(0):'\0';if(("eEgGpP".indexOf(lq6)==-1)&&(((lq6>='A')&&(lq6<='Z'))||((lq6>='a')&&(lq6<='z'))))return this.l64(l56,d);else return this.l84(l56,d);}
_jcvxycp.formatValue=function(lu2,l56){if((!l56)||(l56.indexOf('{')==-1))return this.l54(l56,lu2);else return l56.replace(new RegExp("[{]value(?:|([^}]*))?[}]",'g'),this.l54("$1",lu2));}
function _jcvpa(ll5){this.data=ll5;}
_jcvpap=_jcvpa.prototype;_jcvpap.getLeftX=function(){return this.data.x;}
_jcvpap.getTopY=function(){return this.data.y;}
_jcvpap.getWidth=function(){return this.data.w;}
_jcvpap.getHeight=function(){return this.data.h;}
_jcvpap.getRightX=function(){return this.getLeftX()+this.getWidth();}
_jcvpap.getBottomY=function(){return this.getTopY()+this.getHeight();}
function _jcva(ls6,ll5){this.lv4=ls6;this.data=ll5;}
_jcvap=_jcva.prototype;_jcvap.getX=function(){return this.data.x;}
_jcvap.getY=function(){return this.data.y;}
_jcvap.getLength=function(){return this.data.l;}
_jcvap.getAlignment=function(){return this.data.dir;}
_jcvap.ln3=function(lu6){if(lu6==null)return null;var lq2=(lu6-this.data.minC)/(this.data.maxC-this.data.minC);if(this.data.st!=4)return lq2*(this.data.maxV-this.data.minV)+this.data.minV;else return Math.pow(this.data.maxV/this.data.minV,lq2)*this.data.minV;}
_jcvap.ll3=function(lu2){if(lu2==null)return null;if(lu2.getFullYear)lu2=_jcv.CTime(lu2);if(this.data.st!=4)return(lu2-this.data.minV)/(this.data.maxV-this.data.minV)*(this.data.maxC-this.data.minC)+this.data.minC;else return Math.log(lu2/this.data.minV)/Math.log(this.data.maxV/this.data.minV)*(this.data.maxC-this.data.minC)+this.data.minC;}
_jcvap.lm3=function(lu2){var l51=this.ll3(lu2);return(l51==null)?null:Math.round(l51);}
_jcvap.getMinValue=function(){return this.data.minV;}
_jcvap.getMaxValue=function(){return this.data.maxV;}
_jcvap.getLabel=function(v){var lv6=this.data.labels[v];return lv6?lv6[0]:null;}
_jcvap.getFormattedLabel=function(v,l56){var lw6=this.data.labels[v];if(lw6){if((v=lw6[1])==null)return lw6[0];}
if(!l56&&(v!=null)&&(v>=56770934400)&&(v<=69393715200))l56=(v%86400==0)?"mmm dd, yyyy":"mmm dd, yyyy hh:nn:ss";return this.lv4.formatValue(v,l56);}
function _jcvl(ls6,ls5){this.lv4=ls6;this.ls3=ls5;}
_jcvlp=_jcvl.prototype;_jcvlp.getDataSet=function(i){var ll5=this.ls3.dataSets[i];if(!ll5)return null;if(!ll5.obj){ll5.i=i;ll5.obj=new _jcvd(this,ll5);}
return ll5.obj;}
_jcvlp.getDataSetById=function(id){var ly6=this.ls3.dataSets;for(var i=0;i<ly6.length;++i){if(ly6[i].id==id)return this.getDataSet(i);}
return null;}
_jcvlp.getDataSetByZ=function(i){return this.getDataSet(this.ls3.dataSets.length-i-1);}
_jcvlp.getDataSetCount=function(){var ly6=this.ls3.dataSets;return ly6?ly6.length:0;}
_jcvlp.getXPosition=function(i){if(this.ls3.xValues)return this.ls3.xValues[i];if((this.ls3.minX!=null)&&(this.ls3.maxX!=null)){if(this.ls3.dss==1)return(i==0)?(this.ls3.maxX+this.ls3.minX)/2:null;else return((this.ls3.maxX-this.ls3.minX)*i)/(this.ls3.dss-1)+this.ls3.minX;}
return i;}
_jcvlp.getXCoor=function(){if(!this.ls3.lu4){var lz6=0;for(var j=0;j<this.ls3.dataSets.length;++j)lz6=Math.max(lz6,this.ls3.dataSets[j].data.length);var lw5=this.lv4.xAxis();var ls2=Math.min(lw5.getMinValue(),lw5.getMaxValue());var lt2=Math.max(lw5.getMinValue(),lw5.getMaxValue());var l07=[];for(var i=0;i<lz6;++i){var l17=this.getXPosition(i);if((l17==null)||(l17>lt2)||(l17<ls2))l07[i]=null;else l07[i]=lw5.ll3(l17);}
this.ls3.lu4=l07;}
return this.ls3.lu4;}
_jcvlp.getNearestXIndex=function(ly){var l07=this.getXCoor();if((ly==null)||!l07||!l07.length)return null;var l27=this.ls3.lt4;if(l07!=this.ls3.l24){l27=[];for(var i=0;i<l07.length;++i)l27[i]=i;l27.sort(function(a,b){return _jcv.lx3(l07[a],l07[b]);});this.ls3.lt4=l27;this.ls3.l24=l07;}
var l51=ase_61(l27,ly,function(a,b){return _jcv.lx3(l07[a],b);});if(l51>=0)return l27[l51];l51=~l51;if(l51>=l27.length)return l27[l27.length-1];if(l51==0)return l27[0];var l37=l27[l51-1];var l47=l27[l51];if((l07[l37]==null)||(ly-l07[l37]>l07[l47]-ly))return l47;else return l37;}
_jcvlp.getNearestXValue=function(ly){var l51=this.getNearestXIndex(ly);return(l51!=null)?this.getXPosition(l51):null;}
_jcvlp.getXIndexOf=function(l17,l57){if(!l57)l57=0;var l51=this.getNearestXIndex(this.lv4.xAxis().ll3(l17));return((l51==null)||(Math.abs(this.getXPosition(l51)-l17)>l57))?null:l51;}
function _jcvd(ls6,ll5){this.lv4=ls6;this.data=ll5;}
_jcvdp=_jcvd.prototype;_jcvdp.getDataName=function(){return this.data.id;}
_jcvdp.getDataSetNo=function(){return this.data.i;}
_jcvdp.getDataGroup=function(){return this.data.g;}
_jcvdp.getDataColor=function(){return ase_41(this.data.color);}
_jcvdp.getUseYAxis=function(){return this.lv4.lv4.getAxis(this.data.axis);}
_jcvdp.getValue=function(i){return((i>=0)&&(i<this.data.data.length))?this.data.data[i]:null;}
_jcvdp.getPosition=function(i){var lu2=this.getValue(i);if(lu2==null)return null;var l77=this.getDataSetNo();var l87=this.getDataGroup();switch(this.lv4.ls3.dcm){case 1:for(var j=l77-1;(j>=0)&&(this.lv4.getDataSet(j).getDataGroup()==l87);--j){var v=this.lv4.getDataSet(j).getValue(i);if((v!=null)&&((lu2>=0)^(v<0)))lu2+=v;}
return lu2;case 4:lu2=Math.abs(lu2);var l97=1;for(var k=l77-1;(k>=0)&&(this.lv4.getDataSet(k).getDataGroup()==l87);--k){var v=this.lv4.getDataSet(k).getValue(i);if(v!=null){++l97;lu2+=Math.abs(v);}
}
var la7=lu2;var lb7=l97;for(var n=l77+1;(n<this.lv4.getDataSetCount())&&(this.lv4.getDataSet(n).getDataGroup()==l87);++n){var v=this.lv4.getDataSet(n).getValue(i);if(v!=null){++lb7;la7+=Math.abs(v);}
}
return(la7<=0)?(l97*100/lb7):(lu2*100/la7);default:return lu2;}
}
_jcvdp.getValueCount=function(){return this.data.data.length;}
_jcv.NTime=function(dt){var t=Math.floor(dt);var ms=Math.min(999,Math.floor(Math.round((dt-t)*100000)/100));var s=t%60;t=(t-s)/60;var n=t%60;t=(t-n)/60;var h=t%24;t=(t-h)/24;var y=Math.floor(t/365.2425)+1;t-=_jcv.l44(y);if(_jcv.lq3(y)){if(t>=366){++y;t-=366;}
}
else {if(t>=365){++y;t-=365;}
}
for(var m=1;m<12;++m){if(t<_jcv.l34(y,m+1))break;}
var d=t-_jcv.l34(y,m)+1;return new Date(y,m-1,d,h,n,s,ms);}
_jcv.lq3=function(y){return((y%400==0)||((y%4==0)&&(y%100!=0)));}
_jcv.l44=function(y){--y;return y*365+Math.floor(y/4)-Math.floor(y/100)+Math.floor(y/400);}
_jcv.la3=[0,31,59,90,120,151,181,212,243,273,304,334];_jcv.l34=function(le7,lf7){var l51=_jcv.la3[lf7-1];if((lf7>2)&&_jcv.lq3(le7))++l51;return l51;}
_jcv.CTime=function(d){return _jcv.chartTime(d.getFullYear(),d.getMonth()+1,d.getDate(),d.getHours(),d.getMinutes(),d.getSeconds()+d.getMilliseconds()/1000.0);}
_jcv.chartTime=function(y,m,d,h,n,s){return(_jcv.l44(y)+_jcv.l34(y,m)+d-1)*86400+(h||0)*3600+(n||0)*60+(s||0);}
_jcvp.l11=function(e){this.l73=ase_q(e);this.l83=ase_r(e);}
_jcvp.l21=function(e){var eX=ase_q(e);var eY=ase_r(e);if(this.la==_jcv.ZoomIn){var d=this.lc;var li7=this.lq1()&&this.lj1(e,d);if(li7){var ls2=Math.min(eX,this.l73);var lj7=Math.min(eY,this.l83);var l84=Math.abs(eX-this.l73);var l94=Math.abs(eY-this.l83);switch(d){case _jcv.Horizontal:this.lz1(ls2,this.l23(this.l1),l84,this.lz2(this.l3));break;case _jcv.Vertical:this.lz1(this.l13(this.l0),lj7,this.l03(this.l2),l94);break;default:this.lz1(ls2,lj7,l84,l94);break;}
}
this.l02(li7);}
else if((this.la==_jcv.Scroll)||(this.la==_jcv.ReverseScroll)){var d=this.lb;if(this.lf2||this.lj1(e,d)){this.lf2=true;var ln5=this.lf7(eX-this.l73);var lo5=this.lg7(eY-this.l83);this.lz1(this.l13(this.l0)+ln5,this.l23(this.l1)+lo5,this.l03(this.l2),this.lz2(this.l3));this.l02(true);}
}
}
_jcvp.lr6=function(){return this.la==_jcv.ReverseScroll;}
_jcvp.lf7=function(ln5,lk7){if(this.lb==_jcv.Vertical)return 0;if((!lk7)&&this.lr6())return-this.lf7(-ln5,true);if((ln5<0)&&(this.l4+this.l6-this.l6*this.l43(ln5)/this.l2>1))ln5=Math.min(0,(this.l4+this.l6-1)*this.l03(this.l2)/this.l6);if((ln5>0)&&(this.l6*this.l43(ln5)/this.l2>this.l4))ln5=Math.max(0,this.l4*this.l03(this.l2)/this.l6);return ln5;}
_jcvp.lg7=function(lo5,lk7){if(this.lb==_jcv.Horizontal)return 0;if((!lk7)&&this.lr6())return-this.lg7(-lo5,true);if((lo5<0)&&(this.l5+this.l7-this.l7*this.l33(lo5)/this.l3>1))lo5=Math.min(0,(this.l5+this.l7-1)*this.lz2(this.l3)/this.l7);if((lo5>0)&&(this.l7*this.l33(lo5)/this.l3>this.l5))lo5=Math.max(0,this.l5*this.lz2(this.l3)/this.l7);return lo5;}
_jcvp.l41=function(e){this.l02(false);switch(this.la){case _jcv.ZoomIn:if(this.lq1()){if(this.lj1(e,this.lc))this.lt1(e);else this.lv1(e,this.ld);}
break;case _jcv.ZoomOut:if(this.lr1())this.lv1(e,this.le);break;default:if(this.lf2)this.lu1(e);break;}
this.lf2=false;}
_jcvp.l31=function(e){}
_jcvp.la1=function(e){}
_jcvp.lv1=function(e,ll7){var eX=ase_q(e);var eY=ase_r(e);var lm7=this.l6/ll7;var ln7=this.l7/ll7;this.lm1(this.lc,(this.l53(eX)-this.l0)*this.l6/this.l2-lm7/2,lm7,(this.l63(eY)-this.l1)*this.l7/this.l3-ln7/2,ln7);}
_jcvp.lu1=function(e){var eX=ase_q(e);var eY=ase_r(e);var ld2=this.lr6()?-1:1;var ln5=(this.l73-eX)*ld2;var lo5=(this.l83-eY)*ld2;this.lm1(this.lb,this.l6*this.l43(ln5)/this.l2,this.l6,this.l7*this.l33(lo5)/this.l3,this.l7);}
_jcvp.lt1=function(e){var eX=ase_q(e);var eY=ase_r(e);var lm7=this.l6*this.l43(Math.abs(this.l73-eX))/this.l2;var ln7=this.l7*this.l33(Math.abs(this.l83-eY))/this.l3;this.lm1(this.lc,this.l6*(this.l53(Math.min(this.l73,eX))-this.l0)/this.l2,lm7,this.l7*(this.l63(Math.min(this.l83,eY))-this.l1)/this.l3,ln7);}
_jcvp.lm1=function(d,lm1,lo7,ln1,lp7){var lq7=this.l4;var lr7=this.l5;var lm7=this.l6;var ln7=this.l7;if((((lo7<this.l6)&&(this.l6<this.lf))||(d==_jcv.Vertical))&&(((lp7<this.l7)&&(this.l7<this.lh))||(d==_jcv.Horizontal)))return;if(d!=_jcv.Vertical){if(lo7!=this.l6){lm7=Math.max(this.lf,Math.min(lo7,this.lg));lm1-=(lm7-lo7)/2;}
lq7=Math.max(0,Math.min(this.l4+lm1,1-lm7));}
if(d!=_jcv.Horizontal){if(lp7!=this.l7){ln7=Math.max(this.lh,Math.min(lp7,this.li));ln1-=(ln7-lp7)/2;}
lr7=Math.max(0,Math.min(this.l5+ln1,1-ln7));}
if((lq7!=this.l4)||(lr7!=this.l5)||(lm7!=this.l6)||(ln7!=this.l7)){this.lw2=this.l4;this.lx2=this.l5;this.ly2=this.l6;this.lv2=this.l7;this.l4=lq7;this.l5=lr7;this.l6=lm7;this.l7=ln7;this.raiseViewPortChangedEvent();}
}
_jcvp.zoomAt=function(x,y,ll7){var ls7=(x-this.l0)/this.l2;var lt7=(y-this.l1)/this.l3;var rx=(this.lc!=_jcv.Vertical)?1/ll7:1;var ry=(this.lc!=_jcv.Horizontal)?1/ll7:1;var lm7=Math.max(this.lf,this.l6*rx);var lm1=ls7*(this.l6-lm7);var ln7=Math.max(this.lh,this.l7*ry);var ln1=lt7*(this.l7-ln7);this.lm1(this.lc,lm1,lm7,ln1,ln7);}
_jcvp.raiseViewPortChangedEvent=function(){this.lp=1;this.lt2();this.applyHandlers("viewportchanged");if(this.onViewPortChanged&&(this.l32("viewportchanged").length==0))this.onViewPortChanged();this.lp=0;}
_jcvp.l32=function(lf5){var id=(lf5+"events").toLowerCase();if(!this[id])this[id]=[];return this[id];}
_jcvp.attachHandler=function(lf5,f){if(lf5 instanceof Array){var l51=[];for(var i=0;i<lf5.length;++i)l51[i]=this.attachHandler(lf5[i],f);return l51;}
var lw7=lf5.toLowerCase();if(lw7=="now"){this.l57="now";f.call(this);this.l57=null;}
else {if(lw7=="chartmove")this.l45();if((lw7.length>7)&&(lw7.substr(lw7.length-7,7)=="hotspot"))this.initToolTipHandler();var a=this.l32(lf5);a.push(f);return lf5+":"+(a.length-1);}
}
_jcvp.detachHandler=function(le4){if(le4 instanceof Array){for(var i=0;i<le4.length;++i)this.detachHandler(le4[i]);return;}
var ab=le4.split(':');var a=this.l32(ab[0]);a[parseInt(ab[1])]=null;if(ab[0].toLowerCase()=="chartmove"){for(var i=0;i<a.length;++i)if(a[i])return;this.ld5();}
}
_jcvp.l25=function(lp,lf5,ly7){this.lu3(lf5);this.l57=lf5;var l51=false;var a=this.l32(lf5);for(var i=0;i<a.length;++i){this.l93=a[i];if(a[i])l51|=a[i].call(lp,ly7);}
this.l57=null;return l51;}
_jcvp.l35=function(lp,lf5,e){var lz7=e.changedTouches[0];this.l07(ase_q(lz7),ase_r(lz7));this.lk6=e.type;this.l25(lp,lf5,e);this.lk6=null;}
_jcvp.isTouchEvent=function(){return this.lk6;}
_jcvp.preventDefault=function(e){if(e&&e.preventDefault)e.preventDefault();if(this.lk6)_jcv.l88(this);}
_jcvp.applyHandlers=function(lf5,ly7){return this.l25(this,lf5,ly7);}
_jcvp.getCurrentEvent=function(){return this.l57;}
_jcvp.isInEvent=function(ls){if(!(ls instanceof Array))ls=[ls];for(var i=0;i<ls.length;++i){var lf5=ls[i];if(lf5&&(lf5.toLowerCase()==this.l57))return true;}
return false;}
_jcvp.partialUpdateAsAttachment=function(l08,ly){this.partialUpdate(l08,ly||"hidden");}
_jcvp.partialUpdate=function(l08,l18){if(this.l12)return;_jcv.ls1(this.l82());this.applyHandlers("preupdate");this.lt2();var lw="cdPartialUpdate="+this.l01+"&cdCacheDefeat="+ase_h();if(l18)lw+="&cdAttachment=1";if(l08)lw+="&"+l08;lw+="&"+this.l92.name+"="+ase_21(escape(this.l92.value),'\\+','%2B');var lv=ase_11(ase_a(this.l01+"_callBackURL").value,lw);if(l18){switch(l18){case "_self":location=lv;break;case "hidden":var id=this.l01+"_loader_frame";var l28=ase_a(id);if(!l28){l28=document.createElement("IFRAME");l28.id=id;var s=l28.style;s.position="absolute";s.left="0px";s.top="0px";s.display="none";s.visibility="hidden";document.body.appendChild(l28);}
l28.src=lv;break;default:window.open(lv,l18);}
return;}
var l38=this.updatingMsg;if(ase_g(l38))l38=_jcv.updatingMsg;if(l38&&(l38!="none"))this.msgBox(l38);this.ln=1;var lp5=this;this.l12=ase_j1(lv,function(t){lp5.lj2(t)},function(l48,l58){lp5.lc1(l48,l58);});}
_jcvp.lj2=function(lr1){var l68=ase_e1(lr1,"<!--CD_SCRIPT "," CD_SCRIPT-->");if(l68){var l78=ase_e1(lr1,"<!--CD_MAP "," CD_MAP-->");var imgObj=this.l82();var imgBuffer=(this.ll1=(this.doubleBuffering?new Image():null))||imgObj;if(imgObj.useMap)imgObj.useMap=null;imgObj.loadImageMap=function(){window.setTimeout(function(){_jcv.putMap(imgObj,l78);},100);};imgBuffer.onload=function(){imgObj._jcv.onPartialLoad(true);}
imgBuffer.onerror=imgBuffer.onabort=function(l03){imgObj._jcv.lc1(999,"Error loading image '"+this.src+"'["+l03+"]");}
var l98=window.onerror;window.onerror=function(l03){imgObj._jcv.lc1(801,"Error interpretating partial update result ["+l03+"] <div style='margin:20px;background:#dddddd'><xmp>"+l68+"</xmp></div>")};eval(l68);window.onerror=l98;if(ase_2)this.lt2();}
else this.lc1(800,"Partial update returns invalid data <div style='margin:20px;background:#dddddd'><xmp>"+lr1+"</xmp></div>");}
_jcvp.lb1=function(la8){var imgObj=this.l82();var imgBuffer=this.ll1||imgObj;if(imgBuffer)imgBuffer.onerror=imgBuffer.onabort=imgBuffer.onload='';imgObj.onUpdateCompleted='';this.l12=false;this.lg1(this.le1());if(la8){this.lw2=this.l4;this.lv2=this.l7;this.lx2=this.l5;this.ly2=this.l6;if(imgObj!=imgBuffer){imgObj.src=imgBuffer.src;imgObj.style.width=imgBuffer.style.width;imgObj.style.height=imgBuffer.style.height;}
imgObj.loadImageMap();}
else {imgObj.useMap=imgObj.lr2;if(this.ly2||this.lv2){this.l4=this.lw2;this.l7=this.lv2;this.l5=this.lx2;this.l6=this.ly2;this.lt2();}
}
imgObj.loadImageMap='';}
_jcvp.onPartialLoad=function(la8){if(this.l82().onUpdateCompleted)this.l82().onUpdateCompleted();else this.msgBox();this.lb1(la8);window[this.getId()+"_chartModel"]=window[this.getId()+"_pending_chartModel"];this.lz4();this.applyHandlers("postupdate");}
_jcvp.lc1=function(l48,l58){this.lb1(false);this.msgBox();this.errCode=l48;this.errMsg=l58;if(!this.applyHandlers("updateerror")){var lb8=this.serverErrorMsg;if(!lb8)lb8=_jcv.serverErrorMsg;if(lb8&&(lb8!="none"))this.msgBox(ase_21(ase_21(lb8,'%errCode',l48),'%errMsg',l58));}
this.errCode=null;this.errMsg=null;}
_jcvp.isUpdating=function(){return(this.l12||this.lk2)?true:false;}
_jcvp.abortUpdate=function(){if(this.l12){var r=this.l12;this.l12=null;r.onreadystatechange=function(){};r.abort();}
if(this.lk2){var ll6=this.lk2;this.lk2=null;ll6.onerror=ll6.onabort=ll6.onload=null;ll6.src=null;}
}
_jcvp.streamUpdate=function(lc8,l08){var lp1=ase_h();if(!lc8)lc8=60;var ll6=this.lk2;if(ll6){if(lc8*1000>=lp1-ll6.lk1)return false;ll6.src=null;ll6.onerror=ll6.onabort=ll6.onload=null;}
if(!this.li2)this.li2=this.l82().src;this.lk2=ll6=this.l82();ll6.lk1=lp1;var lp5=this;ll6.onload=function(){var imgObj=lp5.l82();if(imgObj.useMap)imgObj.useMap=null;var b=lp5.lk2;if(imgObj!=b)imgObj.src=b.src;b.onabort();}
ll6.onerror=ll6.onabort=function(){var b=lp5.lk2;if(b)b.onload=b.onabort=b.onerror=null;lp5.lk2=null;}
var lw="cdDirectStream="+this.l01+"&cdCacheDefeat="+lp1;if(l08)lw+="&"+l08;ll6.src=ase_11(this.li2,lw);return true;}
_jcvp.lo1=function(a,v){return a+((typeof v!="number")?"**":"*")+v;}
_jcvp.ln1=function(av){var l41=av.indexOf("*");if(l41==-1)return null;var a=av.substring(0,l41);var v=av.substring(l41+1,av.length);if(v.charAt(0)=="*")v=v.substring(1,v.length);else v=parseFloat(v);return{"attr":a,"value":v};}
_jcvp.lp1=function(){var l51="";for(var i=0;i<_jcv.ly1.length;++i){var a=_jcv.ly1[i];var v=null;if((a=="lo")&&this.lo){for(var lq in this.lo)v=((v==null)?"":v+"\x1f")+this.lo1(lq,this.lo[lq]);}
else v=this[a];if((typeof v!="undefined")&&(null!=v))l51+=(l51?"\x1e":"")+this.lo1(i,v);}
return l51;}
_jcvp.decodeState=function(s){var ld8=s.split("\x1e");for(var i=0;i<ld8.length;++i){var av=this.ln1(ld8[i]);if(!av)continue;var a=_jcv.ly1[parseInt(av.attr)];if(a=="lo"){var le8=av.value.split("\x1f");for(var i2=0;i2<le8.length;++i2){var lg8=this.ln1(le8[i2]);if(!lg8)continue;this.lo[lg8.attr]=lg8.value;}
}
else this[a]=av.value;}
this.lp=0;}
_jcvp.lt2=function(){if(this.l92)this.l92.value=this.lp1();}
_jcvp.l72=function(){if((!ase_7)||(ase_9()>=9)){var imgObj=this.l82();var m=_jcv.l22(imgObj);if(m){m.onmousedown=imgObj.onmousedown;m.onmousemove=imgObj.onmousemove;m.onmouseout=imgObj.onmouseout;}
}
}
_jcv.l22=function(imgObj){var lh8=imgObj.lr2;if(!lh8)lh8=imgObj.useMap;if(!lh8)return null;var l41=lh8.indexOf('#');if(l41>=0)lh8=lh8.substring(l41+1);var l51=ase_a(lh8);if(!l51){l51=document.getElementsByName(lh8);l51=l51?l51[0]:null;}
return l51;}
_jcv.loadMap=function(imgObj,lv){if(!imgObj.lr2)imgObj.lr2=imgObj.useMap;_jcv.ls1(imgObj);imgObj.la2=ase_j1(lv,function(t){_jcv.putMap(imgObj,ase_e1(t,"<!--CD_MAP "," CD_MAP-->"));},function(l48,l58){_jcv.onLoadMapError(l48,l58);}
);}
_jcv.loadPendingMap=function(){if(!window._jcvPendingMap)return;for(var a in window._jcvPendingMap){var lp=ase_a(a);if(lp){var lv=window._jcvPendingMap[a];window._jcvPendingMap[a]=null;if(lv)_jcv.loadMap(lp,lv);}
}
}
_jcv.ls1=function(imgObj){if(imgObj.la2){imgObj.la2.abort();imgObj.la2=null;}
}
_jcv.onLoadMapError=function(l48,l58){}
_jcv.putMap=function(imgObj,li8){var m=_jcv.l22(imgObj);if(!m&&li8){var lh8='map_'+imgObj.id;imgObj.useMap=imgObj.lr2='#'+lh8;var d=document;m=d.createElement("MAP");m.id=m.name=lh8;d.body.appendChild(m);if(imgObj._jcv)imgObj._jcv.l72();}
if(m){m.innerHTML=li8;m.ll6=m.lm6=1;if(imgObj.useMap!=imgObj.lr2)imgObj.useMap=imgObj.lr2;var lp5=_jcv.get(imgObj.id);if(lp5&&lp5.l65)lp5.lq7();}
imgObj.la2=null;}
_jcv.canSupportPartialUpdate=function(){return(window.XMLHttpRequest||ase_i1());}
_jcv.getVersion=function(){return ase_0;}
function _jvpc(id){this.lf8=id;this.le8=null;this.ld8=null;this.lg5=4;this.lh5=8;this.l95=_jcv.lk5;var lp=this.lz7("root");var lj8=["maskTop","maskBottom","maskLeft","maskRight","pad","sel"];var i=0;for(i=0;i<lj8.length;++i){if(this.lz7(lj8[i]))continue;var lk8=document.createElement("DIV");lk8.id=this.lg8(lj8[i]);var s=lk8.style;s.position="absolute";if(i>3)s.visibility="hidden";lk8.innerHTML="<img style='display:none' />";lp.appendChild(lk8);}
var ll8=["MouseDown","MouseMove","MouseUp","TouchStart","TouchMove","TouchEnd"];for(i=0;i<ll8.length;++i){var lg2="on"+ll8[i];lp[lg2.toLowerCase()]=_jvpc.l67(id,_jvpcp[lg2],lg2.substring(2,7).toLowerCase());}
var cv=_jcv.get(id);cv.lf5();var ln8=["originalWidth","originalHeight","l0","l1","l2","l3","lx","ly","lz"];for(i=0;i<ln8.length;++i)this[ln8[i]]=cv[ln8[i]];if(++this.l2>0)++this.l3;else {this.l0=this.l1=0;this.l2=this.l16;this.l3=this.l06;}
ln8=["ls","lt","lr","lu"];for(i=0;i<ln8.length;++i){var lq=ln8[i];this[lq]=ase_g(cv[lq])||cv[lq];}
var a=this.lt7=[];a[_jcv.Left]="w-resize";a[_jcv.Right]="e-resize";a[_jcv.Top]="n-resize";a[_jcv.Bottom]="s-resize";a[_jcv.lj5]=null;a[_jcv.TopLeft]="nw-resize";a[_jcv.TopRight]="ne-resize";a[_jcv.BottomLeft]="sw-resize";a[_jcv.BottomRight]="se-resize";a[0]="default";a[-1]="wait";this.l55();}
_jvpc.get=function(id){var lp=ase_a(id);if(!lp)return null;if(!lp._jvpc)lp._jvpc=new _jvpc(id);return lp._jvpc;}
_jvpcp=_jvpc.prototype;_jvpcp.getViewer=function(){return _jcv.get(this.le8);}
_jvpcp.setViewer=function(lp5){var lp8=this.getViewer();if(lp8)lp8.detachHandler(this.ld8);if(null==lp5)this.le8=this.ld8=null;else {this.le8=lp5.getId();this.ld8=lp5.attachHandler("PostUpdate",_jvpc.l67(this.lf8,_jvpcp.onViewPortChanged));this.onViewPortChanged();this.lz7("pad").style.visibility="visible";}
}
_jvpcp.setDragBorderToResize=function(b){this.lt=b;}
_jvpcp.getDragBorderToResize=function(b){return this.lt;}
_jvpcp.setDragInsideToMove=function(b){this.ls=b;}
_jvpcp.getDragInsideToMove=function(b){return this.ls;}
_jvpcp.setDragOutsideToSelect=function(b){this.lr=b;}
_jvpcp.getDragOutsideToSelect=function(b){return this.lr;}
_jvpcp.setClickToCenter=function(b){this.lu=b;}
_jvpcp.getClickToCenter=function(b){return this.lu;}
_jvpcp.setMouseMargin=function(lq8,lr8){this.lg5=lq8;this.lh5=lr8;}
_jvpcp.setViewPortExternalColor=function(lj5){this.lx=lj5;}
_jvpcp.getViewPortExternalColor=function(lj5){return this.lx;}
_jvpcp.setViewPortBorderStyle=function(ls8){this.ly=ls8;}
_jvpcp.getViewPortBorderStyle=function(ls8){return this.ly;}
_jvpcp.setSelectionBorderStyle=function(ls8){this.lz=ls8;}
_jvpcp.getSelectionBorderStyle=function(ls8){return this.lz;}
_jvpcp.lg8=function(id){id=id?("_"+id):"";return this.lf8+id;}
_jvpcp.lz7=function(id){return ase_a(this.lg8(id));}
_jvpcp.l28=function(lp,lv4,lx4,lw4,ly4){lv4=Math.round(lv4);lx4=Math.round(lx4);lw4=Math.round(lw4);ly4=Math.round(ly4);if(!lp.id)lp=this.lz7(lp);width=Math.max(0,lw4-lv4);height=Math.max(0,ly4-lx4);var s=lp.style;if(s.width==''){s.width=lp.offsetWidth+"px";s.height=lp.offsetHeight+"px";}
s.width=Math.max(0,(width-lp.offsetWidth+parseInt(s.width)))+"px";s.height=Math.max(0,(height-lp.offsetHeight+parseInt(s.height)))+"px";s.left=(lv4+Math.min(0,width-lp.offsetWidth)/2)+"px";s.top=(lx4+Math.min(0,height-lp.offsetHeight)/2)+"px";return lp;}
_jvpcp.l18=function(lp,lv4,lx4,lw4,ly4){lp=this.l28(lp,lv4,lx4,lw4,ly4);ase_51(lp,this.lj8("lx","#80ffffff"));}
_jvpcp.lj8=function(a,v){return ase_g(this[a])?v:this[a];}
_jvpc.l67=function(id,lr,lt8){return function(e){var ld5=_jvpc.get(id);if("touch"==lt8)_jcv.l88(ld5);if(("mouse"!=lt8)||!_jcv.la8(ld5))return lr.call(ld5,e);};}
_jvpcp.l55=function(){var lu8=_jvpc.l67(this.lf8,_jvpcp.l68);window.setInterval(lu8,_jcv.moveConfirmTimer);ase_z(window,"resize",lu8,false);ase_z(this.lz7("root"),"resize",lu8,false);}
_jvpcp.l68=function(){var lp=this.lz7("root");if((this.lm7!=lp.clientWidth)||(this.lk7!=lp.clientHeight))this.onViewPortChanged();this.lm7=lp.clientWidth;this.lk7=lp.clientHeight;}
_jvpcp.lv5=function(x,y,lv4,lx4,lw4,ly4){var lv8=x+x-lv4-lw4;var lw8=y+y-lx4-ly4;return lv8*lv8+lw8*lw8;}
_jvpcp.ln6=function(x,y,lv4,lx4,lw4,ly4){if(ase_e(lv4,x,lw4)&&ase_e(lx4,y,ly4))return this.lv5(x,y,lv4,lx4,lw4,ly4);else return-1;}
_jvpcp.lq6=function(lx8,ly8,x,y,lz8,lq8){return ase_e(x-lq8,lx8,x+lq8)&&ase_e(y-lq8*ase_f(lz8),ly8,y+lz8);}
_jvpcp.lo6=function(lx8,ly8,x,y,x2,y2,lq8,lr8){if(lq8>lr8)return this.ln6(lx8,ly8,x-lq8,y-lq8,x+lq8,y+lq8);var l09=lr8*ase_f(x2-x);var lz8=lr8*ase_f(y2-y);if(this.lq6(lx8,ly8,x,y,lz8,lq8)||(this.lq6(ly8,lx8,y,x,l09,lq8)))return this.lv5(lx8,ly8,x,y,x,y);else return-1;}
_jvpcp.lp6=function(l15,x,y,lv4,lx4,lw4,ly4){var l19=this.lg5;var l29=this.lh5;switch(l15){case _jcv.Left:return this.ln6(x,y,lv4-l19,lx4,lv4+l19,ly4);case _jcv.Right:return this.ln6(x,y,lw4-l19,lx4,lw4+l19,ly4);case _jcv.Top:return this.ln6(x,y,lv4,lx4-l19,lw4,lx4+l19);case _jcv.Bottom:return this.ln6(x,y,lv4,ly4-l19,lw4,ly4+l19);case _jcv.TopLeft:return this.lo6(x,y,lv4,lx4,lw4,ly4,l19,l29);case _jcv.TopRight:return this.lo6(x,y,lw4,lx4,lv4,ly4,l19,l29);case _jcv.BottomLeft:return this.lo6(x,y,lv4,ly4,lw4,lx4,l19,l29);case _jcv.BottomRight:return this.lo6(x,y,lw4,ly4,lv4,lx4,l19,l29);case _jcv.lj5:return this.ln6(x,y,lv4,lx4,lw4,ly4);default:return-1;}
}
_jvpcp.lw5=function(lx8,ly8){var l39=[];var l49=0;if(this.ls)l39[l49++]=_jcv.lj5;if(this.lt){switch(this.getViewer().lc){case _jcv.Horizontal:l39[l49++]=_jcv.Left;l39[l49++]=_jcv.Right;break;case _jcv.Vertical:l39[l49++]=_jcv.Top;l39[l49++]=_jcv.Bottom;break;case _jcv.HorizontalVertical:l39[l49++]=_jcv.Left;l39[l49++]=_jcv.Right;l39[l49++]=_jcv.Top;l39[l49++]=_jcv.Bottom;l39[l49++]=_jcv.TopLeft;l39[l49++]=_jcv.TopRight;l39[l49++]=_jcv.BottomLeft;l39[l49++]=_jcv.BottomRight;break;}
}
var l59=this.lz7("pad");var lv4=l59.lp5+Math.round((l59.lm5-l59.offsetWidth)/2);var lx4=l59.lq5+Math.round((l59.ll5-l59.offsetHeight)/2);var lw4=lv4+l59.offsetWidth;var ly4=lx4+l59.offsetHeight;var l69=-1;var l79=0x7fffffff;for(var i=0;i<l49;++i){var l89=this.lp6(l39[i],lx8,ly8,lv4,lx4,lw4,ly4);if((l89>=0)&&(l89<l79)){l79=l89;l69=i;}
}
return(l69>=0)?l39[l69]:_jcv.li5;}
_jvpcp.le1=function(p){var l51=this.lt7[p];return l51?l51:this.lt7[0];}
_jvpcp.lg1=function(lf3,lc4){this.lt7[p]=lc4;}
_jvpcp.l17=function(x){return this.l13(x*this.l2+this.l0);}
_jvpcp.l27=function(y){return this.l23(y*this.l3+this.l1);}
_jvpcp.l37=function(x){return(x-this.l17(0))/(this.l17(1)-this.l17(0));}
_jvpcp.l47=function(y){return(y-this.l27(0))/(this.l27(1)-this.l27(0));}
_jvpcp.l13=function(w){var lp=this.lz7();var l51=(this.l16&&lp.clientWidth)?(w*lp.clientWidth/this.l16):w;return l51+lp.offsetLeft;}
_jvpcp.l23=function(h){var lp=this.lz7();var l51=(this.l06&&lp.clientHeight)?(h*lp.clientHeight/this.l06):h;return l51+lp.offsetTop;}
_jvpcp.onViewPortChanged=function(){this.lz7("root").style.cursor=this.le1(0);var lp5=this.getViewer();if(lp5)this.le7(lp5.l4,lp5.l5,lp5.l6,lp5.l7);}
_jvpcp.le7=function(l99,la9,l43,l53){var l59=this.lz7("pad");l59.lp5=this.l17(l99);l59.lq5=this.l27(la9);l59.lm5=this.l17(l99+l43)-l59.lp5;l59.ll5=this.l27(la9+l53)-l59.lq5;this.l38();}
_jvpcp.ls7=function(){var l59=this.lz7("pad");var lb9=(l59.lp5==l59.l66)&&(l59.lm5==l59.l56);var lc9=(l59.lq5==l59.l76)&&(l59.ll5==l59.l46);if(!(lb9&&lc9))this.lc8(l59.lp5,l59.lq5,l59.lm5,l59.ll5,lb9,lc9);}
_jvpcp.l38=function(){var lp5=this.getViewer();var l59=this.lz7("pad");var ld9=this.lz7("sel");var le9=this.l17(0);var lf9=this.l17(1);var lg9=this.l27(0);var lh9=this.l27(1);if(this.ld7()){var li9=lp5.lc!=_jcv.Vertical;var lj9=lp5.lc!=_jcv.Horizontal;var lv4=Math.min(this.la5,this.l75);var lw4=Math.max(this.la5,this.l75);var lx4=Math.min(this.lb5,this.l85);var ly4=Math.max(this.lb5,this.l85);if((li9&&((lv4>lf9)||(lw4<le9)))||(lj9&&((lx4>lh9)||(ly4<lg9)))){ld9.style.visibility="hidden";return;}
lv4=li9?ase_d(le9,lv4,lf9):l59.l66;lw4=li9?ase_d(le9,lw4,lf9):(l59.l66+l59.l56);lx4=lj9?ase_d(lg9,lx4,lh9):l59.l76;ly4=lj9?ase_d(lg9,ly4,lh9):(l59.l76+l59.l46);ld9.lp5=lv4;ld9.lq5=lx4;ld9.lm5=lw4-lv4;ld9.ll5=ly4-lx4;ld9.style.border=this.lj8("lz","1px solid gray");this.l28(ld9,lv4,lx4,lw4,ly4);ld9.style.visibility="visible";}
else {ld9.style.visibility="hidden";this.lz7("pad").style.border=this.lj8("ly","1px solid gray");this.l28(l59,l59.lp5,l59.lq5,l59.lp5+l59.lm5,l59.lq5+l59.ll5);this.l18("maskLeft",le9,lg9,l59.lp5,lh9);this.l18("maskRight",l59.lp5+l59.lm5,lg9,lf9,lh9);this.l18("maskTop",l59.lp5,lg9,l59.lp5+l59.lm5,l59.lq5);this.l18("maskBottom",l59.lp5,l59.lq5+l59.ll5,l59.lp5+l59.lm5,lh9);}
}
_jvpcp.lc8=function(x,y,w,h,lb9,lc9){var lp5=this.getViewer();var lq7=lb9?lp5.l4:this.l37(x);var lr7=lc9?lp5.l5:this.l47(y);var lm7=lb9?lp5.l6:(this.l37(x+w)-lq7);var ln7=lc9?lp5.l7:(this.l47(y+h)-lr7);var lk9=ase_d(lp5.lf,lm7,lp5.lg);if(lm7!=lk9){lq7=ase_d(0,lq7+(lm7-lk9)/2,1-lk9);lm7=lk9;}
var ll9=ase_d(lp5.lh,ln7,lp5.li);if(ln7!=ll9){lr7=ase_d(0,lr7+(ln7-ll9)/2,1-ll9);ln7=ll9;}
this.l48(lq7,lr7,lm7,ln7);}
_jvpcp.l48=function(l99,la9,l43,l53){var lp5=this.getViewer();lp5.l4=l99;lp5.l5=la9;lp5.l6=l43;lp5.l7=l53;lp5.raiseViewPortChangedEvent();}
_jvpcp.lc7=function(){var lp5=this.getViewer();return lp5.li8(this.l75-this.la5,this.l85-this.lb5,_jcv.HorizontalVertical,lp5.lj);}
_jvpcp.ld7=function(){var lp5=this.getViewer();return(this.l95==_jcv.li5)&&this.lr&&lp5.li8(this.l75-this.la5,this.l85-this.lb5,lp5.lc,lp5.lj);}
_jvpcp.lu6=function(x,y){var lp5=this.getViewer();if(null==lp5)return false;var lw2=this.l27(0)-lp5.lm4;var ly2=this.l27(1)+lp5.lj4;var lv2=this.l17(0)-lp5.lk4;var lx2=this.l17(1)+lp5.ll4;var lj4=(y>=lw2)&&(y<=ly2);var lk4=(x>=lv2)&&(x<=lx2);return lj4&&lk4;}
_jvpcp.lx7=function(e){var lp=this.lz7("root");return ase_q(e)-ase_w(lp)-lp.clientLeft;}
_jvpcp.ly7=function(e){var lp=this.lz7("root");return ase_r(e)-ase_x(lp)-lp.clientTop;}
_jvpcp.onMouseDown=function(e){var lp=this.lz7("root");var l59=this.lz7("pad");var lp5=this.getViewer();if((null==lp5)||lp5.l12||(ase_s(e)!=1))return;var mX=this.lx7(e);var mY=this.ly7(e);if(!this.lu6(mX,mY))return;this.l98=true;this.l86=null;this.l96=null;ase_b(e);if(window.onmousemove!=lp.onmousemove){if(lp.setCapture)lp.setCapture();lp.lo7=window.onmousemove;lp.lp7=window.onmouseup;window.onmousemove=lp.onmousemove;window.onmouseup=lp.onmouseup;}
this.la5=this.l75=mX;this.lb5=this.l85=mY;this.l95=this.lw5(mX,mY);l59.l66=l59.lp5;l59.l76=l59.lq5;l59.l56=l59.lm5;l59.l46=l59.ll5;this.l97=false;this.la7=false;this.l87=false;}
_jvpcp.onMouseMove=function(e){var lp=this.lz7("root");var l59=this.lz7("pad");var lp5=this.getViewer();if(null==lp5)return;if(lp5.l12){lp.style.cursor=this.le1(-1);return;}
var mX=this.lx7(e);var mY=this.ly7(e);if(this.l98&&(mX==this.l86)&&(mY==this.l96))return;this.l86=mX;this.l96=mY;var lm9=mX-this.la5;var ln9=mY-this.lb5;var sd=lp5.lb;var zd=lp5.lc;var ps=l59.style;lp.style.cursor=this.le1((this.l95==_jcv.lk5)?this.lw5(mX,mY):this.l95);this.l75=mX;this.l85=mY;switch(this.l95){case _jcv.lk5:break;case _jcv.li5:if(this.ld7()||this.l97)this.l38();this.l97=this.ld7();break;case _jcv.lj5:if(sd!=_jcv.Vertical)l59.lp5=ase_d(this.l17(0),l59.l66+lm9,this.l17(1)-l59.lm5);if(sd!=_jcv.Horizontal)l59.lq5=ase_d(this.l27(0),l59.l76+ln9,this.l27(1)-l59.ll5);this.l38();this.la7=true;break;default:var lv4=l59.l66;var lx4=l59.l76;var lw4=lv4+l59.l56;var ly4=lx4+l59.l46;if(zd!=_jcv.Vertical){switch(this.l95){case _jcv.Left:case _jcv.BottomLeft:case _jcv.TopLeft:lv4+=lm9;break;case _jcv.Right:case _jcv.BottomRight:case _jcv.TopRight:lw4+=lm9;break;}
}
if(zd!=_jcv.Horizontal){switch(this.l95){case _jcv.Top:case _jcv.TopLeft:case _jcv.TopRight:lx4+=ln9;break;case _jcv.Bottom:case _jcv.BottomLeft:case _jcv.BottomRight:ly4+=ln9;break;}
}
lv4=ase_d(this.l17(0),lv4,this.l17(1));lw4=ase_d(this.l17(0),lw4,this.l17(1));lx4=ase_d(this.l27(0),lx4,this.l27(1));ly4=ase_d(this.l27(0),ly4,this.l27(1));l59.lm5=Math.abs(lw4-lv4);l59.ll5=Math.abs(ly4-lx4);l59.lp5=Math.min(lv4,lw4);l59.lq5=Math.min(lx4,ly4);this.l38();this.la7=true;break;}
this.l87=this.l87||this.lc7();}
_jvpcp.onMouseUp=function(e){var lp=this.lz7("root");var lp5=this.getViewer();if((null==lp5)||(ase_s(e)!=1)||(!this.l98))return;if(lp.releaseCapture)lp.releaseCapture();window.onmousemove=lp.lo7;window.onmouseup=lp.lp7;this.l98=false;this.l95=_jcv.lk5;if(this.l97){var ld9=this.lz7("sel");if(ld9.style.visibility!="hidden")this.lc8(ld9.lp5,ld9.lq5,ld9.lm5,ld9.ll5);}
else if(this.la7){this.ls7();}
else if(this.lu&&!this.l87){var lr9=false;var sd=lp5.lb;if(sd!=_jcv.Vertical){var w=lp5.l6;var lq7=ase_d(0,this.l37(this.l75)-w/2,1-w);lr9=lr9||(lq7!=lp5.l4);lp5.l4=lq7;}
if(sd!=_jcv.Horizontal){var h=lp5.l7;var lr7=ase_d(0,this.l47(this.l85)-h/2,1-h);lr9=lr9||(lr7!=lp5.l5);lp5.l5=lr7;}
if(lr9)lp5.raiseViewPortChangedEvent();}
}
_jvpcp.onTouchStart=function(e){var lp=this.lz7("root");var l59=this.lz7("pad");var lp5=this.getViewer();if((null==lp5)||lp5.l12||ase_t(e))return;this.lx6=null;var e1=e.changedTouches[0];var mX=this.lx7(e1);var mY=this.ly7(e1);if(!this.lu6(mX,mY))return;var lv4=l59.lp5+Math.round((l59.lm5-l59.offsetWidth)/2);var lx4=l59.lq5+Math.round((l59.ll5-l59.offsetHeight)/2);var lw4=lv4+l59.offsetWidth;var ly4=lx4+l59.offsetHeight;var ls9=9999;var lt9=9999;if((mX>=lv4-ls9)&&(mX<=lw4+ls9)&&(mY>=lx4-ls9)&&(mY<=ly4+ls9)){ase_b(e);this.lx6=e1.identifier;this.lb6=mX;this.lc6=mY;l59.l66=l59.lp5;l59.l76=l59.lq5;l59.l56=l59.lm5;l59.l46=l59.ll5;}
}
_jvpcp.onTouchMove=function(e){var lp=this.lz7("root");var l59=this.lz7("pad");var lp5=this.getViewer();var e1=ase_c1(e.changedTouches,this.lx6);if(!(lp5&&e1))return;ase_b(e);var lm9=this.lx7(e1)-this.lb6;var ln9=this.ly7(e1)-this.lc6;this.lb6+=lm9;this.lc6+=ln9;var sd=lp5.lb;if(sd!=_jcv.Vertical)l59.lp5=ase_d(this.l17(0),l59.lp5+lm9,this.l17(1)-l59.lm5);if(sd!=_jcv.Horizontal)l59.lq5=ase_d(this.l27(0),l59.lq5+ln9,this.l27(1)-l59.ll5);this.l38();}
_jvpcp.onTouchEnd=function(e){var lp=this.lz7("root");var lp5=this.getViewer();var e1=ase_c1(e.changedTouches,this.lx6);if(!(lp5&&e1))return;ase_b(e);this.lx6=null;this.ls7();}
JsChartViewer=_jcv;JsViewPortControl=_jvpc;_jcv.loadPendingMap();