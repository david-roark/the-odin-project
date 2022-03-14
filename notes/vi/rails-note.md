☛ Version: Vietnamese
======================================
# Ruby on Rails

![Rails MVC](https://miro.medium.com/max/700/1*KK61kGXrkaFBDfY7uWukyQ.png)

> "Ruby on Rails makes it much easier and more fun. It includes everything you need to build fantastic applications, and you can learn it with the support of our large, friendly community." - Ruby on Rails

☛ Là một framework full-stack theo cấu trúc MVC được viết bằng ngôn ngữ Ruby. Triết lý của Rails theo hai nguyên tắc chính là DRY (Don't Repeat Yourself) - nghĩa là không lặp lại những thứ trùng nhau để "code" ngắn gọn, dễ sửa chữa, bảo trì và mở rộng hơn và CoC (Convention Over Configuration) - là Rails sẽ quy ước nhiều thứ như mối quan hệ giữa tên model với controller... tránh việc ta phải tự quy ước thông qua các tệp cấu hình. Rails giúp việc tạo ra một ứng dung một cách nhanh chóng hơn.

☛ Khởi tạo một ứng dụng bằng command line với Rails: `$ rails new name_app`

## Những kiến thức liên quan

![Over view http](https://developer.mozilla.org/en-US/docs/Web/HTTP/Overview/http-layers.png)

- **HTTP** (HyperText Transfer Protocol): Là phương thức trao đổi data trên internet giữa server và client. Ngoài ra ta còn có HTTPS là HTTP được tăng tính bảo mật.
- HTTP verbs:

  - GET: truy xuất tài nguyên theo id hoặc tập hợp các tài nguyên.
  - POST: tạo tài nguyên mới.
  - PUT: cập nhật tài nguyên đã có.
  - DELETE: xóa tài nguyên theo id.

- **REST** (REpresentational State Transfer): là một cấu trúc xem mọi thứ là tài nguyên (vd: văn bản, hình ảnh, dữ liệu,...). Sử dụng phương thức HTTP để trao đổi, xử lý dữ liệu,... Mối request ở dạng phi trạng thái, tức là dữ liệu khi truyền lên server sẽ đóng gói các thông tin để server có thể hiểu được và xử lý yêu cầu của client (do server không lưu lại thông tin của server).

- **URL** (Uniform Resource Locator): sử dụng để xác định duy nhất một tài nguyên trên Web. Cấu trúc: `protocol://hostname:port/path-and-file-name`

- **MVC** (Model - View - Controller): là mẫu kiến trúc phân tách ứng dụng thành ba phần logic chính là:

  - Model: xử lý dữ liệu giữa database và ứng dụng.
  - View: Xử lý UI cho ứng dụng.
  - Controller: kiểm soát luồng thực thi các request và trả lại response theo request.

- **API** (Application Programming Interface): là phương thức trung gian kết nối các ứng dụng và thư viện khác nhau. Thường xử dụng XML, JSON,...
- **Cookies**: là những tập tin một trang web gửi đến máy người dùng và được lưu lại thông qua trình duyệt khi người dùng truy cập trang web đó, dùng để ghi nhớ trạng thái, hoạt động của người dùng,..
- **Sessions** dựa vào các cookies để có thể đăng nhập một lần mà có thể thực hiện mọi yêu cầu mà không cần phải đăng nhập lại mỗi lần thực hiện yêu cầu.
- **Authentication**: ứng dụng dùng cookies được gửi từ client lên để xác định người dùng đó có tồn tại hay không trước khi thực hiện các yêu cầu từ client.
- **Authorization**: ứng dụng sẽ xác định người dùng bằng cách ủy quyền cho đối tác xác thực.

## Routing

- Router giống như người gác cửa, nó sẽ quyết định việc điều hướng xem nên dùng controller nào để xử lý yêu cầu của client hay chuyển yêu cầu đó đến nơi nào khác.
- Vị trí trong Rails: `config/routes.rb`

  - `get '/users', to: 'users#index'`
  - `post '/users', to: 'users#create'` ...

- ☛ Xem routes trong ứng dụng:

  - Tất cả routes: `$ rails routes`
  - Theo một controller cụ thể (vd: Users): `$ rails routes -c user`
  - Cụ thể theo helper method, URL path, HTTP verbs: `$ rails routes -g new_user`, `$ rails routes -g PUT`,... -
  - Viết gọn dùng
