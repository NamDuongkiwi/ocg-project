package models

type Promo struct{
	ID 			int 	`json:"promo_code"`
	Description string 	`json:"description"`
	Reduction	int 	`json:"reduction"`
}