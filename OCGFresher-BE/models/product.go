package models

type Product struct {
	ID			int			`json:"id"`
	Name 		string 		`json:"name"`
	CategoryID	int			`json:"category_id"`
	Media 		[]string 	`json:"images"`
	Price		int 		`json:"price"`
	Description string 		`json:"description"`
	CreatedAt	string 		`json:"created_at"`
}