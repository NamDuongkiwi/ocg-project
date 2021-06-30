package controller

import (
	"database/sql"
	"fmt"
	"strconv"
	"time"

	"github.com/NamDuongkiwi/OCGFresher-BE/database"
	"github.com/NamDuongkiwi/OCGFresher-BE/models"
	"github.com/gofiber/fiber/v2"
)
func CreateProduct(c *fiber.Ctx) error{
	db := database.Connect()
	defer db.Close()
	var product models.Product
	err := c.BodyParser(&product)
	
	if err != nil {
		return c.Status(fiber.StatusBadRequest).
		JSON(fiber.Map{
			"message": err.Error(),
		})
	}

	product.CreatedAt = time.Now().Format("2006.01.02 15:04:05")
	_, err = db.Query("INSERT INTO product VALUES (?, ?, ?, ?, ?, ?)", product.ID, product.CategoryID, product.Name, product.Price, product.Description, product.CreatedAt) 
	if err != nil {
		return c.Status(fiber.StatusBadRequest).
		JSON(fiber.Map{
			"message": err.Error(),
		})
	}
	return c.JSON(fiber.Map{
		"message" : "success",
		"product" : product,
	})
}

// func GetAllProduct(c *fiber.Ctx) error{
// 	db := database.Connect()
// 	defer db.Close()
// 	rows, err := db.Query("SELECT * FROM product")
// 	if err != nil {
// 		return c.Status(fiber.StatusBadRequest).
// 		JSON(fiber.Map{
// 			"message": err.Error(),
// 		})
// 	}
// 	var products []models.Product
// 	for rows.Next(){
// 		var product models.Product
// 		err = rows.Scan(&product.ID, &product.CategoryID, &product.Name, &product.Price, &product.Description, &product.CreatedAt)
// 		if err != nil {
// 			return c.Status(fiber.StatusBadRequest).
// 			JSON(fiber.Map{
// 				"message": err.Error(),
// 			})
// 		}
// 		product.Media = getMedia(product.ID)
// 		products = append(products, product)
// 	}
// 	return c.JSON(products)
// }

func GetAllProduct(c *fiber.Ctx) error{
	db := database.Connect()
	defer db.Close()
	cat := c.FormValue("categoryId")
	orders := c.FormValue("_order")
	pages := c.FormValue("_page")
	page, _ := strconv.Atoi(pages)
	page = (page-1) * 12
	limit := c.FormValue("_limit")
	name := c.FormValue("q")
	name = "%" + name + "%"
	fmt.Println(orders)
	fmt.Println("cate: ", len(cat))
	//if orders 
	var rows *sql.Rows
	var err error
	var products []models.Product

	if orders == "desc" {
		if cat =="" {
			rows, err = db.Query("SELECT id, name, price FROM product WHERE name LIKE ? ORDER BY price desc LIMIT ? OFFSET ?", name, limit, page)
		}else {
			rows, err = db.Query("SELECT p.id, p.name, p.price FROM product p JOIN category c ON p.category_id = c.id WHERE c.id = ? OR c.parent_id = ? AND p.name LIKE ? ORDER BY p.price desc LIMIT ? OFFSET ?", cat, cat, name, limit, page)
		}
		
	}else {
		if len(cat) == 0{
			rows, err = db.Query("SELECT id, name, price FROM product WHERE name LIKE ? ORDER BY price asc LIMIT ? OFFSET ?",name, limit, page)
		}else {
			rows, err = db.Query("SELECT p.id, p.name, p.price FROM product p JOIN category c ON p.category_id = c.id WHERE c.id = ? OR c.parent_id = ? AND p.name LIKE ? ORDER BY p.price asc LIMIT ? OFFSET ?", cat, cat,name, limit, page)
		}
	}

	if err != nil {
		return c.Status(fiber.StatusBadRequest).
		JSON(fiber.Map{
			"message": err.Error(),
		})
	}

	for rows.Next(){
		var product models.Product
		err = rows.Scan(&product.ID, &product.Name, &product.Price)
		if err != nil {
			return c.Status(fiber.StatusBadRequest).
			JSON(fiber.Map{
				"message": err.Error(),
			})
		}
		product.Media = getMedia(product.ID)
		products = append(products, product)
	}
	c.Append("total-item", getCount(cat, name))
	return c.JSON(products)
}

func getCount(cat string, name string) string{
	db := database.Connect()
	defer db.Close()
	var result string
	if cat == ""{
		rows, _ := db.Query("SELECT COUNT(*) FROM product WHERE name LIKE ?", name)
		if rows.Next(){
			_ = rows.Scan(&result)
		}
	}else{
		rows, _ := db.Query("SELECT COUNT(*) FROM product p JOIN category c ON p.category_id = c.id WHERE c.id = ? OR c.parent_id = ? AND p.name LIKE ?", cat, cat, name)
		if rows.Next(){
			_ = rows.Scan(&result)
		}
	}
	return result
}

func getMedia(id int) []string {
	db := database.Connect()
	defer db.Close()
	rows, _ := db.Query("SELECT data FROM media WHERE product_id = ?", id)
	var images []string

	for rows.Next(){
		var image string
		_ = rows.Scan(&image)
		images = append(images, image)
	}

	if len(images) == 0{
		images = append(images, "")
	}
	return images
}

func AddImage(c *fiber.Ctx) error{
	db := database.Connect()
	defer db.Close()
	var image models.Media
	err := c.BodyParser(&image)
	if err != nil {
		return c.Status(fiber.StatusBadRequest).
		JSON(fiber.Map{
			"message": err.Error(),
		})
	}
	id, _ := c.ParamsInt("id")
	_, err = db.Query("INSERT INTO media VALUES (?, 0, ?)", id, image.Data)
	if err != nil {
		return c.Status(fiber.StatusBadRequest).
		JSON(fiber.Map{
			"message": err.Error(),
		})
	}
	return c.JSON(fiber.Map{
		"message" : "success",
	})
}

func GetProductByID(c *fiber.Ctx) error {
	db:= database.Connect()
	defer db.Close()
	id, _ := c.ParamsInt("id")

	rows, err := db.Query("SELECT * FROM product WHERE id = ?", id)
	if err != nil {
		return c.Status(fiber.StatusBadRequest).
		JSON(fiber.Map{
			"message": err.Error(),
		})
	}
	var product models.Product
	if rows.Next(){
		err = rows.Scan(&product.ID, &product.CategoryID, &product.Name, &product.Price, &product.Description, &product.CreatedAt)
		if err != nil {
			return c.Status(fiber.StatusBadRequest).
			JSON(fiber.Map{
				"message": err.Error(),
			})
		}
	}
	product.Media = getMedia(product.ID)
	return c.JSON(product)
}

func GetCategotyParent(c *fiber.Ctx) error{
	db := database.Connect()
	defer db.Close()
	rows, _ := db.Query("select id, name from category WHERE parent_id is null")
	var categories []models.Category
	for rows.Next(){
		var category models.Category
		err := rows.Scan(&category.ID, &category.Name)
		if err != nil {
			return c.Status(fiber.StatusBadRequest).
			JSON(fiber.Map{
				"message": err.Error(),
			})
		}
		categories = append(categories, category)
	}
	return c.JSON(categories)
}

func GetCategotyByParent(c *fiber.Ctx) error{
	db := database.Connect()
	defer db.Close()

	id, _ := c.ParamsInt("id")
	rows, _ := db.Query("select id, name from category WHERE parent_id = ?", id)
	var categories []models.Category
	for rows.Next(){
		var category models.Category
		err := rows.Scan(&category.ID, &category.Name)
		if err != nil {
			return c.Status(fiber.StatusBadRequest).
			JSON(fiber.Map{
				"message": err.Error(),
			})
		}
		categories = append(categories, category)
	}
	return c.JSON(categories)
}

/*
	// code fix bug
	if err != nil {
		return c.Status(fiber.StatusBadRequest).
		JSON(fiber.Map{
			"message": err.Error(),
		})
	}

*/