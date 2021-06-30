package models

type Category struct{
	ID 			int 	`json:"id"`
	Name 		string	`json:"category_name"`
	//ParentID 	int 	`json:"parent_id"` 
}