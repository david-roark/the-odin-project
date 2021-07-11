Version: Vietnamese
==========================
### Git
**Git** là một hệ thống quản lý phiên bản phân tán (Distributed Version Control System – DVCS) phổ biến nhất hiện nay. Git cung cấp một kho lưu trữ (repository) riêng chứa toàn bộ lịch sử thay đổi cho mỗi lập trình viên.

Tác dụng của VCS:

  - Lưu lại lịch sử các version của bất kỳ thay đổi nào của dự án. Giúp xem lại các sự thay đổi hoặc khôi phục (revert) lại sau này.
  - Giúp việc chia sẻ code trở lên dễ dàng hơn.

Lợi ích của git ngoài những lợi ích chung của VCS:

  - Đảm bảo không có xung đột khi nhiều lập trình viên cùng hoạt động song song
  - Dễ sử dụng, thao tác nhanh, gọn, lẹ và rất an toàn.
  - Dễ dàng kết hợp các phân nhánh (branch), có thể giúp quy trình làm việc code theo nhóm đơn giản hơn rất nhiều.
  - Deployment sản phẩm dễ dàng.

### Một số lệnh cơ bản

- `git config` set user name và email
- `git init` khởi tạo một repository của một sự án. Dùng lệnh này ở thư mục gốc của dự án.
- `git clone` clone 1 repo về từ một remote source
- `git status` xem trạng thái của tát cả các file đang làm việc
- `git add <file name>` thêm các thay đổi vào stage
- `git commit -m "message"` lưu lại 1 snapshot và các file thay đổi phải đang nằm trong stage. Mỗi lần commit nó sẽ lưu lại những thay đổi của code, người commit và message của người commit. `git commit --amend                  # start $EDITOR to edit the message` `git commit --amend -m "New message" # set the new message directly`
- `git push <remote> <branch>` đẩy các thay đổi lên remote.
- `git branch` liệt kê các nhánh.
- `git checkout` chuyển sang một nhánh khác.
- `git stash` lưu thay đổi nhưng chưa muốn commit.
- `git merge <branch muốn merge>` merge 2 branch lại.
- `git reset HEAD <tên_file>` loại bỏ file ra khỏi stage để không commit nó. `git reset HEAD~2        # undo last two commits, keep changes`

### Tools, courses and cheatsheets

[Learn git](https://learngitbranching.js.org/)

[Tools search git command](https://gitexplorer.com/)

[git cheatsheet](https://gitsheet.wtf)

[git cheatsheet](https://ndpsoftware.com/git-cheatsheet.html)
