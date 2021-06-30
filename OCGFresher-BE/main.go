package main

import (
	"github.com/NamDuongkiwi/OCGFresher-BE/routes"
	"github.com/gofiber/fiber/v2"
	"github.com/gofiber/fiber/v2/middleware/cors"
	
)

func main() {
	app := fiber.New(fiber.Config{
		Prefork:       false,
		CaseSensitive: true,
		StrictRouting: true,
	})

	app.Use(cors.New(cors.Config{
		AllowOrigins: "*",
		AllowHeaders: "*",
		ExposeHeaders: "*",
	}))
	routes.Setup(app)
	app.Listen(":3000")
}