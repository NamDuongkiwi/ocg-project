package models
//import "golang.org/x/crypto/bcrypt"
type User struct{
	ID			int 	`json:"id"`
	Email 		string 	`string:"email"` 
	Password	string	`json:"-"`
	Name		string	`json:"name"`
	Mobile		int64	`json:"moblie"`
	Address		string 	`json:"address"`
	CreatedAt	string	`json:"created_at"`
}

// func (user *User) SetPassword(password string){
// 	hashedPassword, _:= bcrypt.GenerateFromPassword([]byte(password), 14)
// 	user.Password = hashedPassword
// }

// func (user *User) ComparePassword(password string) error {
// 	return bcrypt.CompareHashAndPassword(user.Password, []byte(password))
// }