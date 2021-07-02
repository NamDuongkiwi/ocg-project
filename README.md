# OCGFresher-BE

## Khởi tạo Database

Tạo 1 mysql server  trên docker, port: 3307
Import data từ file dumb trong folder OCGFresher-BE/database

## Run sever in port : 3000
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

Mô tả: Lấy tất cả các sản phẩm theo yêu cầu của người dùng (lọc sản phẩm theo tên, theo category, sắp xếp tăng giảm)
Lấy sản phẩm theo từng trang cho front-end và trả về tổng số sản phẩm theo yêu cầu từ request
ví dụ 1 request: http://localhost:3000/api/products?_page=1&_limit=12&_sort=id&_order=desc&q=
```
GET /api/products
```

Trả về chi tiết sản phẩm với id sản phẩm từ request
```
GET /api/products/id
```

Thêm sản phẩm vào database
```
POST /api/products
```

Thêm hình ảnh cho sản phẩm với id là id sản phẩm
```
POST /api/products/image/id
```
### API cho danh mục sản phẩm
Lấy về các danh dục sản phẩm là danh mục cha 
```
GET api/categories
```

Lấy danh sách danh mục sản phẩm là danh mục con của danh mục cha (id là id của cha): Ví dụ như danh mục sản phẩm linh kiện pc có cpu, main, ram, ... là các danh mục sản phẩm con
```
GET api/categories/id
```
### Các api cho giỏ hàng
lấy về danh sách giỏ hàng của người dùng đã login
```
GET api/carts
```

Thêm sản phẩm vào giỏ hàng với id là id sản phẩm
```
GET api/carts/id
```

Xoá sản phẩm khỏi giỏ hàng
```
DELETE api/carts/id
```



## Ảnh database
![image](https://user-images.githubusercontent.com/43265144/123946816-d62f2580-d9c9-11eb-9d29-3551a2fb584f.png)


# OCGFresher-FE

## Project setup
```
npm install
```

### Compiles and hot-reloads for development
```
npm run serve
```

### Compiles and minifies for production
```
npm run build
```

### Lints and fixes files
```
npm run lint
```

### Customize configuration
See [Configuration Reference](https://cli.vuejs.org/config/).


### Một số ảnh sản phẩm

![image](https://user-images.githubusercontent.com/43265144/124209869-96288980-db14-11eb-8574-312c82dd827f.png)

![image](https://user-images.githubusercontent.com/43265144/124209956-ca03af00-db14-11eb-9420-821b1bc7bacb.png)

![image](https://user-images.githubusercontent.com/43265144/124210122-1949df80-db15-11eb-905f-4e9efc9c46db.png)


