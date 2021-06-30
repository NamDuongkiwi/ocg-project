package controller

import "github.com/gofiber/fiber/v2"

func Checkout(c *fiber.Ctx) error {
	return c.JSON(fiber.Map{
		"message": "success",
	})
}