package controller

import (
	"github.com/NamDuongkiwi/OCGFresher-BE/database"
	"github.com/gofiber/fiber/v2")


func AddToCart(c *fiber.Ctx) error{
	user_id := c.Request().Header.Peek("header1")
	
	id, _ := c.ParamsInt("id")


	db := database.Connect()
	defer db.Close()

	_, err := db.Query("INSERT INTO carts VALUES (? , ? , 1)", user_id, id)

	if err != nil {
		return c.Status(fiber.StatusBadRequest).
		JSON(fiber.Map{
			"message": err.Error(),
		})
	}
	return c.JSON(fiber.Map{
		"mess": "success",
	})
}

func GetCart(c *fiber.Ctx) error{
	user_id := c.Request().Header.Peek("header1")
	db := database.Connect()
	defer db.Close()
	rows , err := db.Query("SELECT p.id, p.name, p.price, c.quantity FROM carts c JOIN product p ON p.id = c.product_id WHERE c.user_id = ?", user_id)
	
	if err != nil {
		return c.Status(fiber.StatusBadRequest).
		JSON(fiber.Map{
			"message": err.Error(),
		})
	}
	type Item struct{
		Id int `json:"id"`
		Images []string `json:images`
		Name string `json:"name"`
		Price int `json:"price"`
		Quantity int `json:"quantity"`
	}
	var items []Item
	for(rows.Next()){
		var item Item
		err = rows.Scan(&item.Id, &item.Name, &item.Price, &item.Quantity)
		if err != nil {
			return c.Status(fiber.StatusBadRequest).
			JSON(fiber.Map{
				"message": err.Error(),
			})
		}
		item.Images = getMedia(item.Id)
		items = append(items, item)
	}
	return c.JSON(items)
}

func DeleteItem(c *fiber.Ctx) error{
	user_id := c.Request().Header.Peek("header1")
	db := database.Connect()
	defer db.Close()

	id, _ := c.ParamsInt("id")

	_, _ = db.Query("DELETE FROM carts WHERE user_id = ? AND product_id = ?", user_id, id)
	return c.JSON(fiber.Map{
		"mess": "success",
	})
}