import axios from "axios";
import { API_DOMAIN } from "@/config";

export default{
    async getAllItems(){
        return axios.get(`${API_DOMAIN}/carts`).then((response) => {
            return response.data;
        });
    },
    async addProductToCart(productId){
        return axios.get(`${API_DOMAIN}/carts/${productId}`).then((response) => {
            return response.data;
        });
    },
    async deleteItem(itemId){
        return axios.delete(`${API_DOMAIN}/carts/${itemId}`).then((response) => {
            return response.data;
        });
    }
}