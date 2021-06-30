import { createStore } from "vuex";

import products from "./modules/products";
import user from "./modules/user";
import cart from "./modules/cart"

const debug = process.env.NODE_ENV !== "production";

const store = createStore({
  strict: debug,
  modules: {
    cart,
    products,
    user,
  },
});

export default store;