package models

type OrderDetail struct{
	ProductID 	int 	`json:"product_id"`
	Quantity 	int 	`json:"quantity"`
	Price		int		`json:"price"`
}