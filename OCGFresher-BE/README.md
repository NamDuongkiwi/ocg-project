# OCGFresher-BE

# Run sever in port : 3000
```
go run main.go
```
### Các Api đã hoàn thành 
    
### APi đăng nhập, đăng ký
```
POST /api/register
POST /api/login
```

### Các api cho đơn hàng

```
GET /api/products
```
lấy tất cả các sản phẩm theo yêu cầu của người dùng (lọc sản phẩm theo tên, theo category, sắp xếp tăng giảm)
Lấy sản phẩm theo từng trang cho front-end và trả về tổng số sản phẩm theo yêu cầu từ request
ví dụ 1 request: http://localhost:3000/api/products?_page=1&_limit=12&_sort=id&_order=desc&q=

```
GET /api/products/id
```
Trả về chi tiết sản phẩm với id sản phẩm từ request

```
POST /api/products
```
Thêm sản phẩm vào database

```
POST /api/products/image/id
```
Thêm hình ảnh cho sản phẩm với id là id sản phẩm

```
GET api/categories
```
Lấy về các danh dục sản phẩm là danh mục cha 

```
GET api/categories/id
```
Lấy danh sách danh mục sản phẩm là danh mục con của danh mục cha (id là id của cha): Ví dụ như danh mục sản phẩm linh kiện pc có cpu, main, ram, ... là các danh mục sản phẩm con

```
GET api/carts
```
lấy về danh sách giỏ hàng của người dùng đã login

```
GET api/carts/id
```
Thêm sản phẩm vào giỏ hàng với id là id sản phẩm

```
DELETE api/carts/id
```
Xoá sản phẩm khỏi giỏ hàng



