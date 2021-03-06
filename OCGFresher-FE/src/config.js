import axios from "axios"

const isProductionEnv = process.env.NODE_ENV === "production";

export const API_DOMAIN = isProductionEnv
  ? "https://online-shop-apis.herokuapp.com"
  : "http://localhost:3000/api";

axios.defaults.headers.common['header1'] = ''+ localStorage.getItem("id")
export const BASE_URL = isProductionEnv ? "/vue3-online-shop/" : "/";