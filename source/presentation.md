!SLIDE

# HTML5 語意標籤理論與實戰

HTML5 / Node.js 聯合小聚

September 17, 2011

!SLIDE

# about.me/xdite

鄭伊廷 ( xdite@about.me )

Lead Developer / Manager of Techbang

!SLIDE

# 專長

* Rapid development ( most in Rails )
* Technical training ( most in Ruby / Rails )
* Search Engine Optimization ( SEO )
* Website Scaling
* Website Marketing



!SLIDE

# T 客邦

* 3C / 攝影 / 電玩 資訊入口網站
* Taiwan Alexa 百大網站
* powered by Ruby on Rails

!SLIDE

# 實戰 HTML5 ?

!SLIDE 

# 技癢?

!SLIDE

# Better SEO ?

!SLIDE

# 都不是

!SLIDE

# 其實我不知道為什麼要換
有人趁我不在家時換掉了

而且他寫的還是爛的 HTML5 

!SLIDE

# HTML5 語義標籤血淚談
總之我得收爛攤子

!SLIDE

# 不會提及的主題

* HTML5 basis
* ARIA

!SLIDE

# Agenda

* 研究 HTML5 語意標籤的動機
* HTML5 翻修實錄
* HTML5 誤區
* 使用語意標籤的好處
* 開發注意事項 / 工具介紹

!SLIDE

# 研究 HTML5 語意的動機
其實我是被逼的

!SLIDE

# SEO 是工作的一部分

* 搜尋引擎佔了網站的流量不小比例
* Yahoo 來的流量逐漸偏低
* HTML4 時代一直很威

!SLIDE

# What happened?
開始找問題…

!SLIDE

# 囧!

![image](/images/wrong-title-digiphoto.png)

!SLIDE

# 囧!

![image](/images/wrong-title-techbang.png)

!SLIDE

# 出了什麼事？

Google 的結果很正常，應該是 Yahoo 在發春…

!SLIDE

# 問題還是一樣要解決

3 個月以後終於有空念 HTML5 spec

就跟你說我是被逼的…

!SLIDE

# O 你老師 OOO
讀了 spec 3 小時以後發現這份 HTML 全部都是錯的

Yahoo 我錯怪你了，原來你照 spec 來..

!SLIDE

# Common HTML5 mistakes 
\#1 把 section 當成普通容器元素

<div class="source"> http://html5doctor.com/avoiding-common-html5-mistakes/ </div>

!SLIDE

### Our HTML (當時）

<pre>

    &lt;header id=&quot;header&quot;&gt;
      &lt;div class=&quot;group&quot;&gt;
        &lt;!-- logo, ads, search, user_nav --&gt;
      &lt;/div&gt;
      &lt;section&gt;
        &lt;!-- web sites link--&gt;
      &lt;/section&gt;
      &lt;section&gt;
        &lt;!-- main_nav--&gt;
      &lt;/section&gt;
    &lt;/header&gt;

    &lt;section id=&quot;content&quot;&gt;
		# ……
    &lt;/section&gt;


</pre>

!SLIDE

### 我流淚了…

每一份文件的重點（第一段）都是：T 集團網路

<pre>
&lt;header&gt;
  &lt;div&gt; &lt;!-- logo, ads, search, user_nav --&gt; &lt;/div&gt;
  &lt;section&gt;
    &lt;header&gt;T&#x5ba2;&#x90a6;&#x96c6;&#x5718;&#x7db2;&#x8def;&lt;/header&gt;
    &lt;nav class=&quot;network&quot;&gt;
      &lt;a href=&quot;http://t17.techbang.com.tw&quot;&gt;T17&lt;/a&gt;
      &lt;a href=&quot;http://www.techbang.com.tw&quot;&gt;Techbang&lt;/a&gt;
      &lt;a href=&quot;http://digiphoto.techbang.com.tw&quot;&gt;Digiphoto&lt;/a&gt;
      &lt;a href=&quot;http://game.techbang.com.tw&quot;&gt;&#x6253;&#x96fb;&#x52d5;&lt;/a&gt;
      &lt;a href=&quot;http://bbking.techbang.com.tw&quot;&gt;&#x6bd4;&#x6bd4;&#x738b;&lt;/a&gt;
    &lt;/nav&gt;
  &lt;/section&gt;
  &lt;section&gt; &lt;!-- main_nav--&gt; &lt;/section&gt;
&lt;/header&gt;

</pre>

!SLIDE

###  不意外
Yahoo 才是對的 T_T

![image](/images/wrong-title-techbang.png)

!SLIDE smaller

# Section

The section element represents <span class="green"> <strong>a generic document or application section </strong> </span> …The section element <span class="red"><strong>is not a generic container element </strong></span>. When an element is needed for styling purposes or as a convenience for scripting, authors are encouraged to use the div element instead.

<div class="source"> http://html5doctor.com/the-section-element/</div>

!SLIDE

### Abusing &lt;section&gt;
Section 不是容器

![image](/images/section-everywhere.png)

!SLIDE

# Rules of using section

* 不要拿 section 來 styling，那是 <span class="red">div</span> 的事。
* 如果 <span class="red">article, aside or nav</span> 更適合的話，就不要使用 section。
* 如果這段文字最開頭之前<span class="red">沒有 natually heading</span>，那麼也不要使用 section。


!SLIDE

# Common HTML5 mistakes 
\#2 把 header 當成普通容器元素

<div class="source"> http://html5doctor.com/avoiding-common-html5-mistakes/ </div>

!SLIDE

### Our HTML (當時）

<pre>
    &lt;header&gt;
      &lt;div class=&quot;group&quot;&gt;
        &lt;!-- logo, ads, search, user_nav --&gt;
      &lt;/div&gt;
      &lt;section&gt;
        &lt;!-- web sites link--&gt;
      &lt;/section&gt;
      &lt;section&gt;
        &lt;!-- main_nav--&gt;
      &lt;/section&gt;
    &lt;/header&gt;
</pre>

!SLIDE 

<h1 class="upper"> Header </h1>

* header 可以使用在多處，標示為一段文件、一篇文章或者是一頁文件的標題。
* header 同樣可以拿來包裹 TOC / 搜尋表格 / LOGO … 
* 但 header <span class="red"> is not a sectioning content</span> , it doesn't introduce a new section.

<div class="source"> http://www.w3.org/TR/html5/sections.html#the-header-element</div>

!SLIDE

# Rules of using header

* 通常包含<span class="green"> <h1–h6 element or an hgroup element </span>，但非「必須」。
* 可拿來包裝 TOC / 搜尋表格 / LOGO
* 複雜的 DOM 請使用 <span class="red">div</span>

!SLIDE

# Common HTML5 mistakes 
\#3 將看得到的「列表」元素都包上 nav

<div class="source"> http://html5doctor.com/avoiding-common-html5-mistakes/ </div>

!SLIDE

### Our HTML（當時）

<pre>
   &lt;header&gt;
      &lt;div class=&quot;group&quot;&gt;
        &lt;!-- logo, ads, search, user_nav --&gt;
        &lt;nav id=&quot;user-navigation&quot;&gt;
        &lt;ul&gt;
          &lt;li&gt; &#x767b;&#x5165;&lt;/li&gt;
          &lt;li&gt; &#x8a3b;&#x518a; &lt;/li&gt;
          &lt;li&gt; &#x95dc;&#x65bc;&#x672c;&#x7ad9; &lt;/li&gt;
        &lt;/ul&gt;
       &lt;/nav&gt;
      &lt;/div&gt;
      &lt;section&gt;&lt;!-- web sites link--&gt; &lt;/section&gt;
      &lt;section&gt; &lt;!-- main_nav--&gt; &lt;/section&gt;
    &lt;/header&gt;
</pre>

!SLIDE 

# Nav

<span class="green">a section of navigation links</span>, either to other pages (site navigation) or to sections on the same page (eg a table of contents for long articles). This is <span class="red"> for primary navigation blocks, not just for any group of links. </span>

<div class="source"> http://html5doctor.com/nav-element/ </div>

!SLIDE

# 適合使用 Nav 的地方

* 該站導覽 bar
* 次專區導覽 bar
* 文件導覽 bar

!SLIDE

# 不適合使用 Nav 的地方

* 分頁標記
* social link
* TAG 與 Categories

!SLIDE

# 加起來會變成？
很恐怖不要看…

!SLIDE

### 知道為什麼我想殺人了吧...
重要的內容在第 4 層

![image](/images/mix-all-mistakes.png)