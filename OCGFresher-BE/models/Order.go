package models

type Order struct{
	ID 			int 			`json:"order_id"`
	List 		[]OrderDetail 	`json:"list_product"`
	PromoCode 	int 			`json:"promo_code"`
}