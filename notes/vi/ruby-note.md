> Ruby là một ngôn ngữ thuần hướng đối tượng, kiểu mạnh. Không như nhiều ngôn ngữ khác string, numbers,.. là kiểu dữ liệu nguyên mẫu, trong Ruby, mọi thứ trong Ruby đều là object (sự thật vẫn có block, các từ khóa không thực sự là object).

### Basics
> **Lưu ý:** Trong đây tôi dùng Ruby 2.7 nên có thể một số methods mới được bổ xung và các phiên thấp hơn có thể sẽ không có. Bạn có thể truy cập ruby-doc.org để xác định phiên bản của bạn có hỗ trợ mehod đó không.

> **Kiểu dữ liệu**
> Ruby có các kiểu dữ liệu cơ bản Numbers, Strings, Booleans, Nil
> Lưu ý
> - Strings: nên dùng '' cho trường hợp dùng chuỗi kí tự thông thông, "" cho trường hợp cần nội suy hoặc các kí tự đặc biêt như \n, \r, \t,...
> - Symbols: có phần tương tự String, khác biệt ở chỗ với mỗi chuỗi sẽ được lưu riêng cho dù có cùng giá trị. Symbols thì nếu cùng giá trị sẽ là một
> - Numbers: có hai loại chính sử dụng là Integer, Float. Ngoài ra còn có BigDecimal (giúp tính toán chính xác với các dấu phẩy động), Complex (số phức dưới dạng a + bi)
> - Booleans: true, false, nil là các đối tượng đặc biệt của TrueClass, FalseClass, NilClass


> **Biến**
> Tên của biến thường dùng snake_case để đặt tên. Việc đặt tên dễ rõ ràng có nhiều lợi ích cho việc bảo trì mã cũng như hỗ trợ trong quá trình viết mã...
> Biến trong Ruby có scop khác nhau như hằng `COSNT`, biến toàn cục `$global`, biến cục bộ `var`, biến class `@@var_class`, biến của đối tượng `@instance_var`

> **Cấu trúc rẽ nhánh**
> Lưu ý: trong Ruby chỉ có giá fasle và nil là falsy (giá trị false), còn mọi object còn lại đều là truthy (giá trị đúng)  
> Các cấu trúc rẽ nhánh:
> - if .. esle .. end, 
> - if .. esle .. elsif .. end,
> - unless .. else .. end,
> - case .. when .. esle ..end
>
> Ruby còn hỗ trợ kiểu viết ngắn ngọn như `a = 1 if true`
> ternary operator: \<điều kiện\> ? \<thực hiện nếu điều kiện đúng\> : <thực hiện nếu điều kiện sai>
> Logic: ngoài những biểu thức cơ bản >, < >=, <=, != ta có == trả true nếu hai đối tượng có giá trị như nhau; #eql? trả true nếu hai đối tượng cùng class và giá trị như nhau; #equal? trả true nếu đó là cùng một đối tượng, <=> (spaceship operator - trả -1 nếu bên trái lớn, 0 nếu hai bên bằng nhau, 1 nếu bên phải lớn)
> and, or cos ý nghĩa tương tự &&, || nhưng có mức độ ưu tiên thấp hơn. vd `a = 1 && 2` => && có mức ưu tiên cao hơn = nên 1 && 2 trả về 2 sau đó gán cho a (a có giá trị 2), nếu `a = 1 and 2` => and có mức ưu tiên thấp hơn = nên a gán = 1 (a có giá trị 1) sau đó mới so sánh a với 2.

> **Vòng lặp**
> Các loại vòng lặp trong Ruby: lặp vô hạn loop, lặp với điều kiện đúng while, lặp với điều kiện sai until, lặp qua từng phần tử for. ngoài ra còn có một vài methods loop như #times, #upto, #downto, #map, #each...
> Có thể kết hợp dùng break để thoát khỏi vòng lặp, redo để thực hiện lại vòng lặp đó để xử lý các vòng lặp

> **Mảng**
> Thu thập tập hợp các dữ liệu lại dưới dạng có thứ tự. Bản chất là các dữ liệu sẽ được lưu bởi các ô lưu dữ liệu liền kề nhau.

> **Hash**
> Là kiểu thu thập dữ liệu tương tự mảng nhưng các dữ liệu sẽ được quản "đặt tên" bởi keys thay vì index như mảng.

> **Methods**
> Để tránh việc lặp lại nhiều lần cùng một công việc, các ngôn ngữ dùng phương pháp đặt tên cho các khối mã để có thể gọi chúng lại nhiều lần trong chương trình. Nhiều ngôn ngữ phân biệt giữa function (hàm không có đối tượng liên kết) với methods (hàm liên kết với đối tượng) nhưng Ruby là ngôn ngữ thuần hướng đối tượng nên không có phân biệt này. Mọi methods đều được liên kết với ít nhất một đối tượng.
>
> Ruby cung cấp rất nhiều các method hữu ích giúp việc lập trinhg trở lên nhanh chóng dễ dàng hơn.
>
> Ruby cung cấp nhiều bí danh (tên gọi khác của cùng một method), ví dụ #map và #collect là hai cách gọi của cùng một methods nên sẽ không có gì khác nhau về hiệu suất. Đây là cách Ruby giúp lập trình viên thoải mái kho lập trình. Ruby sử dụng _bang methods_ để thể hiện các methods này sẽ thay đổi dữ liệu gốc như #map! sẽ hoạt động tương tự #map nhưng thay vì trả về tập hợp dữ liệu mới đã xử lý, #map! thay đổi trực tiếp trên tập hợp dữ liệu cũ!
> 
> Enumerable là các methods dùng chung cho cả Array và Hash (DRY trong Ruby). Một số method thường dùng như:
> - #each, #map (#collect), #select (#filter), #reduce (#inject)
> - #reject, #drop, #uniq, #count, #zip, #find (#detect), #flat_map, #max, #min, #max_by, #min_by, #take, #delete, #delete_if 
> - #all?, #one?, #none?, #any?, #include? (#member?)
> - #compact, #dig, #chunk, #lazy, #tally, #zip, #each_cons, #each_with_object, #each_with_index

> **Debugging** 
> Ví dụ:
> ```ruby
>  Traceback (most recent call last):
> 	21: from /home/david-roark/.rvm/gems/ruby-2.7.2/bin/ruby_executable_hooks:22:in `<main>'
> 	20: from /home/david-roark/.rvm/gems/ruby-2.7.2/bin/ruby_executable_hooks:22:in `eval'
> 	19: from /home/david-roark/.rvm/gems/ruby-2.7.2/bin/irb:23:in `<main>'
> 	18: from /home/david-roark/.rvm/gems/ruby-2.7.2/bin/irb:23:in `load'
> 	17: from /home/david-roark/.rvm/gems/ruby-2.7.2/gems/irb-1.3.5/exe/irb:11:in `<top (required)>'
> path/to/file.rb:16:in `<def_err>': undefined method `map' for "it will raise error":String (NoMethodError)
> ```
> Ta sẽ để ý dòng cuối sẽ thấy thông tin **(irb):16**có nghĩa vị trí lỗi tại **path/to/file.rb** dòng **16** trong **def_err** của file.rb. **undefined method `map' for "it will raise error":String** mô tả chi tiết lỗi gặp phải (method #map chưa có được 'định nghĩa' trong class String) và tên của lỗi ở đây là **NoMethodError**.
> Để xử lý lỗi