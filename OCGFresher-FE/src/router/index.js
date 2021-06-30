import { createRouter, createWebHistory } from "vue-router";
import { BASE_URL } from "@/config";

import Home from "../views/Home/Index.vue";
import Products from "../views/products/Index.vue";
import ProductDetail from "../views/product-detail/Index.vue";
import About from "../views/about/Index.vue";
import Contact from "../views/contact/Index.vue";
import Cart from "../views/cart/Index.vue";
import Login from "../views/login/Login.vue";



const routes = [
  { path: "/", component: Home },
  { path: "/products", component: Products },
  { path: "/products/:id", component: ProductDetail },
  { path: "/about", component: About },
  { path: "/contact", component: Contact },
  { path: "/cart", component: Cart },
  { path: "/login", component: Login}
];

const router = createRouter({
  history: createWebHistory(BASE_URL),
  scrollBehavior() {
    return { top: 0 };
  },
  routes,
});

export default router;