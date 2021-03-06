import axios from "axios";
import { API_DOMAIN } from "@/config";

export default {
  async getProducts({ page, limit, sort, order, search, categoryId }) {
    let filterCategory = "";
    if (categoryId) filterCategory = "&categoryId=" + categoryId;

    return axios
      .get(
        `${API_DOMAIN}/products?_page=${page}&_limit=${limit}&_sort=${sort}&_order=${order}&q=${search}${filterCategory}`
      )
      .then((response) => {
        const products = response.data.map((product) => {
          return product;
        });
        return {
          totalItems: response.headers['total-item'],
          data: products,
        };
      });
  },

  async getCategories() {
    return axios.get(`${API_DOMAIN}/categories`).then((response) => {
      return response.data;
    });
  },
  
  async getChildCate(categoryId){
    return axios.get(`${API_DOMAIN}/categories/${categoryId}`).then((response) => {
        console.log(response.data)
        return response.data;
      });
  },

  async getProductById(productId) {
    return axios.get(`${API_DOMAIN}/products/${productId}`).then((response) => {
      return response.data;
    });
  },
};