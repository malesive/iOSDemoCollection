# iOSDemoCollection
一些有用的iOS Demo收录于此

测试

2016年01月20日14:37:24  
* `Quiz`和`WorldTrotter`工程来自《Big.Nerd.Ranch.Guides.iOS.Programming.The.Big.Nerd.Ranch.Guide.5th.Edition.》  
  
2016年02月01日17:32:13  
* `Demo20160201`是为了在iOS实现类似终端打印效果，不上图了，OC实现
* `iOSTouchIDDemo`这是objective-c版本,参照网上文章测试了下iOS8下的touchID功能，结合登录界面使用的
* `JM`# JM - stoi41 i41tos 文本加密解密（objective-c version）  
这个是参照以前在网上搜到的一份HTML文件（加密部分应该是JS代码）改写的，原文件是这样的（真吭，其实我下面是想复制HTML源码，结果自动被解析了，掐掉一部分吧，javascript能看懂就行）：  
    sdf3.value="0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcde";function stoi41(str){;var t="";var a,a1,a2,a3;var b=sdf3.value.split("");for(var x=0;x<str.length;x++){a=str.charCodeAt(x)
a1=a%41;a=(a-a1)/41;a2=a%41;a=(a-a2)/41;a3=a%41;t+=b[a3]+b[a2]+b[a1]}a="z";for(var x=0;x<t.length;x+=3){if(t.charAt(x)!="A"){return t}a+=t.substr(x+1,2)}return a}function i41tos(str){;var a1,a2,a3,b=sdf3.value,d=0,t,a;if(str.charAt(0)=="z"){t=new Array(Math.floor((str.length-1)/2))
a=t.length;for(var x=0;x<a;x++){d++;a2=b.indexOf(str.charAt(d))
d++;a3=b.indexOf(str.charAt(d))
t[x]=a2*41+a3}};else{t=new Array(Math.floor(str.length/3))
a=t.length;for(var x=0;x<a;x++){a1=b.indexOf(str.charAt(d))
d++;a2=b.indexOf(str.charAt(d))
d++;a3=b.indexOf(str.charAt(d))
d++;t[x]=a1*1681+a2*41+a3}}
a=eval("String.fromCharCode("+t.join(',')+")");return a}  



