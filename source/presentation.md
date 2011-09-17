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

!SLIDE

# Refacor
殺了我比較快…

* HTML 無法寫 Test
* 我們必須 support IE 6,7,8,9
* 四個站的 DOM 不一致

!SLIDE

# Refactor Steps
工作只好吞下去。但苦主還是我。

* 統一四站的 DOM / CSS - 2 weeks (by 澤清)
* unHTML5 - 2 weeks ( by xdite )
* 加上正確的 HTML5 語意 - 2 day ( by xdite )

!SLIDE

# 統一四站的 DOM / CSS
區塊整理，大區塊規則必須一致

* Rails partial
* SCSS partial

!SLIDE 

# unHTML5

當然沒那麼簡單…

 * 使用 &lt;div class=&quot;section&quot;&gt; 取代 &lt;section&gt;
 * 使用 &lt;div class=&quot;header&quot;&gt; 取代 &lt;header&gt;
 * 使用 &lt;div class=&quot;nav&quot;&gt; 取代 &lt;nav&gt;
 * 使用 &lt;div class=&quot;header&quot;&gt; 取代 &lt;header&gt;
 * 使用 &lt;div class=&quot;article&quot;&gt; 取代 &lt;article&gt;


!SLIDE

# unHTML5 中遇到的問題

* display:block; 的效果消失 
* styling 原先是被下在語意標籤上 
* 有時候不只需要改一層 DOM
* 調換語意會大跑版
* 正確的語意很醜…

!SLIDE 

# 加回正確的 HTML5 語意 


* 文章 / 文章列表加回 &lt;article&gt;
* 文章標題必加 &lt;header&gt;
* 導覽列表加回 &lt;nav&gt;
* 側欄區塊一律使用 &lt;aside&gt;
* 次要地位的文章區塊，使用 &lt;aside&gt;

!SLIDE

### Final Results （ 調整完的 T17 ）

![image](/images/t17-result.jpg)

!SLIDE

# 似乎是地雷為什麼還要衝？
HTML5 超多眉角

!SLIDE

# HTML4 不敷使用

* p
* strong
* em
* h1-h6

!SLIDE

### CMS 常見的 HTML 佈局

<pre>
&lt;div class=&quot;header&quot;&gt;
  &lt;h1&gt; SITENAME &lt;/h1&gt;
&lt;/div&gt;
&lt;div class=&quot;wrapper&quot;&gt;
  &lt;div class=&quot;article-header&quot;&gt;
    &lt;h2&gt; POST TITLE &lt;/h2&gt;
  &lt;/div&gt;

  &lt;div class=&quot;social-link&quot;&gt;
    SOCIAL LINKS HERE
  &lt;/div&gt;

  &lt;div class=&quot;article-content&quot;&gt;
    # EDITOR's content here
    &lt;h1&gt; First class heading &lt;/h1&gt;
    &lt;p&gt; content here &lt;/p&gt;
    &lt;h2&gt; Second class heading &lt;/h2&gt;
    &lt;p&gt; content here &lt;/p&gt;
  &lt;/div&gt;
&lt;/div&gt;
</pre>

!SLIDE

### CMS 常見的 HTML 佈局 (續)
<pre>
&lt;div class=&quot;sidebar&quot;&gt;
  &lt;div class=&quot;section&quot;&gt;
    &lt;h2&gt; Widget Title &lt;/h2&gt;
    &lt;div class=&quot;widget-content&quot;&gt;
      WIDGET CONTENT HERE
    &lt;/div&gt;
  &lt;/div&gt;
&lt;/div&gt;
</pre>

### 問題點：

* 哪一段才是真正的文本？ wrapper / social-link / sidebar
* 哪一個才是真正的標題？ 2 個 h1 / 3 個 h2

!SLIDE

# Search Engine：哩供蝦？

!SLIDE

# 主動幫搜尋引擎畫 <span class="red">重點</span>
What HTML5 Semantic Tag do ?

* article
* section
* aside
* nav
* header / footer

!SLIDE

### 改成這樣如何？

<pre>
# 省略...
&lt;div class=&quot;wrapper&quot;&gt;
  &lt;article&gt;
  &lt;div class=&quot;article-header&quot;&gt;
    &lt;header&gt;&lt;h2&gt; POST TITLE &lt;/h2&gt;&lt;/header&gt;
  &lt;/div&gt;
  &lt;div class=&quot;social-link&quot;&gt;
    SOCIAL LINKS HERE
  &lt;/div&gt;
  &lt;div class=&quot;article-content&quot;&gt;
    &lt;section&gt;
    # EDITOR's content here
    &lt;h1&gt; First class heading &lt;/h1&gt;
    &lt;p&gt; content here &lt;/p&gt;
    &lt;h2&gt; Second class heading &lt;/h2&gt;
    &lt;p&gt; content here &lt;/p&gt;
    &lt;/section&gt;
  &lt;/div&gt;
  &lt;/article&gt;
&lt;/div&gt;
</pre>

!SLIDE

### 改成這樣如何？ (續)
<pre>
&lt;div class=&quot;sidebar&quot;&gt;
  &lt;aside class=&quot;section&quot;&gt;
    &lt;h2&gt; Widget Title &lt;/h2&gt;
    &lt;div class=&quot;widget-content&quot;&gt;
      WIDGET CONTENT HERE
    &lt;/div&gt;
  &lt;/aside&gt;
&lt;/div&gt;

</pre>

 重點一清二楚！

!SLIDE

# 如何開始著手設計？
新手通常不知道如何挑選適當的 TAG

!SLIDE

# Design Steps

* 請先設計普通的 Layout， NO semantic tags 
* 為這份 Layout 畫重點 


!SLIDE 

# 警告：千萬不能做的事

* 在語意 TAG 上，使用任何的 style
* 一邊佈局一邊上語意

<br>
### EPIC FAIL : <span class="red">邊寫筆記邊畫重點</span>

!SLIDE 

# 撰寫語意 HTML5 需要的工具
工欲善其事，必先利其器

!SLIDE

# 基本必備工具
因為 IE 6,7,8 不支援

* html5shiv
* HTML5 Reset Stylesheet

<div class="source">
<ul>
	<li>http://code.google.com/p/html5shiv/ </li>
	<li>http://html5doctor.com/html-5-reset-stylesheet/ </li>
</ul>
</div>

!SLIDE 

###  建議使用工具

* Chrome HTML5 Outliner

![image](/images/html5-outliner.png)

!SLIDE 

### 畫重點的好幫手

![image](/images/HTML5Doctor-sectioning-flowchart.png)

<div class="source blue">
http://html5doctor.com/happy-1st-birthday-us/
</div>

!SLIDE


# Reference 
http://blog.xdite.net/?p=3071

!SLIDE
# 廣告

<br>

### Techbang are hiring developers.

mailto: jobs@techbang.com.tw

<br>
### I am selling books.

http://bit.ly/xdite-book-1 # Rails 101 <br>
http://bit.ly/xdite-book-3 # Essential Rails Patterns

!SLIDE 

# Thanks for listening 
Q & A ?
