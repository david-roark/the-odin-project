Version: Vietnamese
=======================
HTML (**H**ypertext **M**arkup **L**anguage) là ngôn ngữ đánh dấu siêu văn bản, có nghĩa là với HTML bạn sẽ ược khai báo những gì được trình bày cho người xem.

HTML5 được khai báo bằng `<!DOCTYPE html>`

> Notes phía dưới bao gồm cả các thẻ tag của HTML5

### Classes and IDs

Class và id giúp việc tham chiếu đến các phần tử HTML trở lên dễ dàng hơn khi làm việc với CSS, javascript. Class sử dụng trên 1 hoặc nhiều thẻ tag, thường sử dụng để tham chiếu phần tử khi dùng với CSS. ID để tham chiếu một phàn tử duy nhất, thường dược sử dụng với Javascript.

```HTML
<div id="uniq-id"></div>
<div class="again haha"></div>
<div class="again other"></div>
<div class="again haha"></div>
<div class="again"></div>
```

### Headings

Các đề mục dùng để mô tả chủ đề mà chúng đứng trước. Các thẻ tag từ \<**h1**\> **\-\>** \<**h6**\> tương ứng từ quan trọng nhất đến ít quan trọng hơn.

### Paragraphs
Tags| Ý nghĩa, cách dùng
--|--
\<**p**\> | định nghĩa đoạn văn bản
\<**br**\> | để xuống dòng
\<**pre**\> | trình bày nội dung y như được trình trong HTML như khoảng trắng, xuống dòng,...

### Text formating

Tags| Ý nghĩa, cách dùng
:--:|--
\<**mark**\> | đánh đấu phần được <mark> hightlight</mark>
\<**strong**\> | đánh dấu nội dung <strong> quan trọng</strong>, thường được thể hiện bằng chữ in đậm
\<**b**\>  | <b>in đậm</b> nội dung
\<**em**\>  | đánh dấu <em>phần nhấn mạnh</em>, thường thể hiện bằng cách in nghiên nội dung
\<**i**\>  | <i>in nghiêng</i> nội dung
\<**u**\>  | <u>gạch dưới</u> nội dung
\<**abbr**\>  |  đánh dấu <abbr title="từ viết tắt">TVT</abbr>
\<**sup**\>   | đánh dấu <sup>phía trên</sup>
\<**sub**\>  |  đánh dấu <sub>phía dưới</sub>

### Anchors and hyperlinks

Một số _parameter_ thường dùng trong thẻ \<**a**\> như: `href` `rel` `target` `title` `download`.
| Trường hợp  | Ý nghĩa  |
|---|---|
| \<a href="htpps://link.com"\>Link\</a\> | Link tới site khác  |
|\<a href="htpps://link.com"\ rel="external">Link\</a\> | link tới site khác với mối quan hệ thể hiện qua `rel=""`|
|\<a href="htpps://link.com"\ target="_blank">Link\</a\> | link tới site khác và mở site đó trên tab mới của windown thể hiện ở `target="_blank"` hoặc có thể mở ngay tại cửa sổ đó,...|
|\<a href="tel:123456789"\>Call me\</a>| khi click vào đây thì sẽ chuyển qua phần mềm để thực hiện cuộc gọi|
|\<a href="mailto:example@test.com"\>Send email\</a\>| khi click vào đây thì sẽ chuyển qua phần mềm để thực hiện gửi email|

### Lists

\<ol\> khai báo kiểu danh sách có thứ tự, \<ul\> không có thứ tự, \<li\> khai báo các items trong danh sách.

```HTML
<ol type="a">
  <li>Items</li>
    <ul>
      <li> lồng danh sách không thứ tự vào </li>
      <li> lồng danh sách không thứ tự vào </li>
      <li> lồng danh sách không thứ tự vào </li>
    </ul>
  <li>Items</li>
  <li>Items</li>
  <li>Items f</li>
  <li>Items g</li>
</ol>
```

<ol type="a">
  <li>Items</li>
    <ul>
      <li> lồng danh sách không thứ tự vào </li>
      <li> lồng danh sách không thứ tự vào </li>
      <li> lồng danh sách không thứ tự vào </li>
    </ul>
  <li>Items</li>
  <li>Items</li>
  <li>Items f</li>
  <li>Items g</li>
</ol>

Ngoài ra còn có danh sách mô tả với các thẻ \<dl\>, \<dt\>, \<dd\>

### Tables
Trình bày ở dạng bảng với các ô, hàng, cột

```HTML
<table>
  <caption>Tiêu đề bảng</caption>

  <tr>
    <th>Tiêu đề cột 1</th>
    <th>Tiêu đề cột 2</th>
    <th> Tiêu đề cột 3</th>
  </tr>

  <tr>
    <td> Row 1 col 1</td>
    <td> Row 1 col 2</td>
    <td> Row 1 col 3</td>
  </tr>
  <tr>
    <td colspan="3"> row 2; spans all 3 cols</td>
  </tr>
  <tr>
    <td rowspan="2"> spans row 3 + 4; col 1</td>
    <td> Row 3 col 2</td>
    <td> Row 3 col 3</td>
  </tr>
  <tr>
    <td> Row 4 col 2</td>
    <td> Row 4 col 3</td>
  </tr>
</table>
```

<table>
  <caption>Tiêu đề bảng</caption>

  <tr>
    <th>Tiêu đề cột 1</th>
    <th>Tiêu đề cột 2</th>
    <th>Tiêu đề cột 3</th>
  </tr>

  <tr>
    <td> Row 1 col 1</td>
    <td> Row 1 col 2</td>
    <td> Row 1 col 3</td>
  </tr>
  <tr>
    <td colspan="3"> row 2; spans all 3 cols</td>
  </tr>
  <tr>
    <td rowspan="2"> spans row 3 + 4; col 1</td>
    <td> Row 3 col 2</td>
    <td> Row 3 col 3</td>
  </tr>
  <tr>
    <td> Row 4 col 2</td>
    <td> Row 4 col 3</td>
  </tr>
</table>

Để bố cục bảng rỗ ràng hơn ta có thể sử dụng \<thead\>, \<tbody\>, \<tfoot\>

### Div element, sectioning elements, media elements, iframes, images

Thẻ \<div\> là một thẻ dùng để bao học các phần tử khác dùng để phân nhóm các phần tử trong trang web. Đây là một công cụ mạnh mẽ trong thiết kế trang web. Tránh việc lồng quá nhiều thẻ \<div\> (nên tránh lồng hơn 6 cấp). Nên dùng các thẻ được giới thiệu ở HTML5 như \<article\> (bao bọc các phần có nội dung liên quan đến nhau), \<section\> (bao bọc nội dung một phần cụ thể), \<nav\> (bao bọc điều hướng của trang web), \<fieldset\> (bao quanh nhóm các form controls), \<footer\> (bao quanh các link liên quan tới website như FAQ, T&C, help, etc và thường nằm ở cuối trang), \<main\> (bao quanh nội dung chính của trang web), \<header\> (bao bọc các giới thiệu của một nhóm) để mang lại ngữ nghĩa cho bố cục trang web.

Lưu ý:
> Thẻ \<main\> dùng chỉ một lần, bao quanh nội dung chính của trang, không nên chứa các thẻ `article`, `aside`, `footer`, `header`, `nav`.
> Nếu nội dung chứa thẻ `header`, `footer`, `nav` thì nên dùng thẻ `article` thay cho `main`.
> Nếu cần một container bao bọc để styling hãy dùng \<div\>

Để nhúng audio vào trang web ta dùng thẻ \<audio\>, nhúng video dùng \<video\>, nhúng một trang web khác dùng \<iframe\>, hình ảnh dùng \<image\>
  
### Linking resourses

Các script, icon, stylesheet có thể nằm trong html nhưng nhằm mục đích tái sử dụng, dễ bảo trì,... các thành phần này thường tách ra thành file riêng và được khai báo vị trí của nó trong \<head\>

```html
<head>
  <link rel="stylesheet" href="path/to/file.css" type="text/css">
  <link rel="shortcut icon" href="path/to/file.png" type="image/x-icon">
  <script src="path/to/file.js"><script>
</head>
```

### Using CSS, Js in HTML
Có thể khai báo như đã nói trong phần 'Linking resourses' hoặc có thể  viết trong thẻ \<head\>

```html
<head>
  <style type="text/css">
    viết css tại đây
  </style>

  <script type="text/javascript">
    Viết js tại đây
  </script>
</head>
```

hoặc viết trong \<body\>

```html

<body>
...
  <!-- CSS inline -->
  <div style="color: red;"> </div>

  <script type="text/javascript">
    Viết js tại đây
  <script>
</body>
```

> Chú ý mức độ ưu tiên của các quy tắc css áp dụng lên các phần tử
> Nên viết Js trong thẻ \<head\> hoặc ở cuối \<body> để tránh trường hợp bị lỗi 

### Forms and input elements 

Form gom nhóm các \<input\> để 'thu thập' các dữ liệu và submit dữ liệu đó lên server.

```HTML
<form method="post" action="action.php">
  <input type="text" name="name_input"/>
  ...
  <input type="submit"/>
</form>
```
Các _parameter_ của \<input\>: `class`, `id`, `type`, `name`, `placeholder`, `autocomplete`, `disable`, `value`,...

Các _type_ của \<input\>

```html
<label>Text<input type="text" size="100"/></label>
<label>Checkbox<input type="checkbox" value="checkbox"></label>
<label>radio<input type="radio" value="abc" checked/></label>
<label>Number<input type="number" size="10" min="2" max="123"></label>
<label>bắt regex<input pattern="\d*" title="nhập số"></label>
<label>upload file<input type="file" accept="image/*"></label>
<label>Chọn màu<input type="color"></label>
<label>Password<input type="password"></label>
<label>Số điện thoại<input type="tel" value="0123456789"></label>
<label>Email<input type="email"></label>
<label>Thời gian<input type="time"></label>
<label>THời gian<input type="datetime"></label>
<label>Khoảng<input type="range" min="2" max="2134" step="10"></label>
<label><input type="button" value="nút bấm"></label>
<label>Phần này bị ẩn<input type="hidden" value="phần này sẽ bị ẩn"></label>

```

<label>Text <input type="text" size="100"/></label>
<label>Checkbox <input type="checkbox" value="checkbox"></label>
<label>radio <input type="radio" value="abc" checked/></label>
<label>Number <input type="number" size="10" min="2" max="123"></label>
<label>bắt regex <input pattern="\d*" title="nhập số"></label>
<label>upload file <input type="file" accept="image/*"></label>
<label>Chọn màu <input type="color"></label>
<label>Password <input type="password"></label>
<label>Số điện thoại <input type="tel" value="0123456789"></label>
<label>Email <input type="email"></label>
<label>Thời gian <input type="time"></label>
<label>THời gian <input type="datetime"></label>
<label>Khoảng <input type="range" min="2" max="2134" step="10"></label>
<label> <input type="button" value="nút bấm"></label>
<label>Phần này bị ẩn <input type="hidden" value="phần này sẽ bị ẩn"></label>
