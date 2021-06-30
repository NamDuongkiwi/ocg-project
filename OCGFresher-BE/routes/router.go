package routes

import (
	"github.com/NamDuongkiwi/OCGFresher-BE/controller"
	"github.com/gofiber/fiber/v2")




func Setup (app *fiber.App){

	app.Post("/api/register", controller.Register)
	app.Post("/api/login", controller.Login)

	app.Get("/api/user", controller.GetID)

	app.Get("/api/products", controller.GetAllProduct)
	app.Get("/api/products/:id", controller.GetProductByID)
	app.Post("/api/products/", controller.CreateProduct)
	app.Post("/api/products/image/:id", controller.AddImage)

	app.Get("api/categories", controller.GetCategotyParent)
	app.Get("api/categories/:id", controller.GetCategotyByParent)

	app.Get("api/carts/:id", controller.AddToCart)
	app.Get("api/carts", controller.GetCart)
	app.Delete("api/carts/:id", controller.DeleteItem)
}