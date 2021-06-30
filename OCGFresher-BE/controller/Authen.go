package controller

import (
	//"time"
	"fmt"
	"strconv"
	"time"

	"github.com/NamDuongkiwi/OCGFresher-BE/database"
	"github.com/NamDuongkiwi/OCGFresher-BE/models"
	"github.com/NamDuongkiwi/OCGFresher-BE/utils"
	"github.com/gofiber/fiber/v2"
)


func Register(c *fiber.Ctx) error {
	//requestData := make(map[string]string)
	var user models.User
	if err := c.BodyParser(&user); err != nil {
		return err
	}
	//check if password and confirm password are the same
	//check if email already in use
	//var aux_user models.User
	//database.DB.Where("Email = ?", requestData["email"]).First(&aux_user)

	db := database.Connect()
	defer db.Close()

	row, _ := db.Query("SELECT * FROM users WHERE email = ?", user.Email)
	if row.Next() {
		c.Status(400)
		return c.JSON(fiber.Map{
			"message": "Email already in use",
		})
	}
	user.CreatedAt = time.Now().Format("2006.01.02 15:04:05")
	_, err := db.Query("INSERT INTO users VALUES (?,?,?,?,?,?,?)", user.ID, user.Email, user.Password, user.Name, user.Mobile, user.Address, user.CreatedAt)

	if err != nil {
		return c.Status(fiber.StatusBadRequest).
		JSON(fiber.Map{
			"message": err.Error(),
		})
	}

	return c.JSON(fiber.Map{
		"message": "success",
		"payload": fiber.Map{
			"user": user,
		},
	})
}


func Login(c *fiber.Ctx) error{
	db := database.Connect()
	defer db.Close()
	
	form := struct{
		Email string `json:"email"`
		Password string `json:"password"`
	}{}
	_ = c.BodyParser(&form)
	var password string
	var id int
	row, err := db.Query("SELECT id, password FROM users WHERE email = ?", form.Email)
	if err != nil{
		c.Status(fiber.StatusNotFound)
		return c.JSON(fiber.Map{
			"message": err.Error(),
		})
	}
	if row.Next(){
		_ = row.Scan(&id, &password)
		//fmt.Println(id)
		fmt.Println(password)
	}else {
		c.Status(fiber.StatusNotFound)
		return c.JSON(fiber.Map{
			"message": "cc",
		})
	}
	if (form.Password != password){
		c.Status(fiber.StatusBadRequest)
		return c.JSON(fiber.Map{
			"message": "wrong password",
		})
	}

	token, err := utils.Generate(strconv.Itoa(int(id)))
	if err != nil{
		return c.SendString(err.Error())
	}
	cookie := fiber.Cookie{
		Name: "jwt",
		Value: token,
		Expires: time.Now().Add(time.Hour * 24),
		HTTPOnly: true,
	}
	c.Cookie(&cookie)
	fmt.Sprintln("thanh cong")
	return c.JSON(fiber.Map{
		"id": id,
		"payload": fiber.Map{
			"user": form,
			"token": token,
		},
	})
}

func GetID(c *fiber.Ctx)error{
	cookie := c.Cookies("jwt")
	id, _ := utils.ParseJwt(cookie)
	return c.JSON(id)
}